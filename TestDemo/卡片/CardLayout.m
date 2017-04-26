//
//  CardLayout.m
//  TestDemo
//
//  Created by 王恒求 on 2017/4/24.
//  Copyright © 2017年 王恒求. All rights reserved.
//

#import "CardLayout.h"
#import "AppUtily.h"

#define kCellWitdh  100
#define kScaleRate  0.4

@implementation CardLayout

-(instancetype)init
{
    self=[super init];
    
    if (self) {
        self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing=kCellWitdh/2;
        self.sectionInset=UIEdgeInsetsMake(0, 150, 0, 150);
        self.itemSize=CGSizeMake(kCellWitdh, kCellWitdh);
    }
    
    return self;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/** 重新布局每个cell*/
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    /** collection的可视区域*/
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    CGFloat makeScaleDis = kCellWitdh;
    
    for (UICollectionViewLayoutAttributes* attribute in array) {
        /** 如果cell在可视区域上则进行缩放*/
        if (CGRectIntersectsRect(attribute.frame, rect)) {
            CGFloat space = CGRectGetMidX(visibleRect)-attribute.center.x;
            
            if (ABS(space) < makeScaleDis) {
                /** 滑动的进度*/
                CGFloat progress = space/makeScaleDis;
                CGFloat rate = 1+kScaleRate*(1-ABS(progress));
                attribute.transform3D = CATransform3DMakeScale(rate, rate, 1.0);
            }
        }
    }
    
    return array;
}

/** 重新设置当滑动停止时collectionview的偏移量*/
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    /** 取出在屏幕中的cell*/
    NSArray *tempArr=[self layoutAttributesForElementsInRect:CGRectMake(proposedContentOffset.x, self.collectionView.bounds.origin.y, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height)];;
    CGFloat minDistnce = MAXFLOAT;
    CGFloat curCenterX=proposedContentOffset.x+CGRectGetWidth(self.collectionView.bounds)/2;
    
    /** 取出当前所有的cell中最接近屏幕中心点的cell*/
    for (UICollectionViewLayoutAttributes* attribute in tempArr) {
        CGFloat cellCenterX = attribute.center.x;
        if (ABS(cellCenterX-curCenterX) < ABS(minDistnce)) {
            minDistnce = cellCenterX-curCenterX;
        }
    }
    
    return CGPointMake(proposedContentOffset.x + minDistnce, proposedContentOffset.y);
}

@end
