//
//  CircleLayout.m
//  TestDemo
//
//  Created by 王恒求 on 2017/4/25.
//  Copyright © 2017年 王恒求. All rights reserved.
//

#import "CircleLayout.h"

@interface CircleLayout()

@property (nonatomic,retain) NSMutableArray *attributeArr;
@property (nonatomic,assign) NSInteger itemCount;

@end

@implementation CircleLayout

-(instancetype)init
{
    self=[super init];
    
    if (self) {
        self.attributeArr = [NSMutableArray array];
    }
    
    return self;
}

-(void)prepareLayout
{
    [super prepareLayout];
    
    _itemCount = [self.collectionView numberOfItemsInSection:0];
    [self.attributeArr removeAllObjects];
    
    for (int i=0; i<_itemCount; i++) {
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [self.attributeArr addObject:attribute];
    }
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes* attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    /** 获取圆的半径*/
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height)/2;
    /** 计算圆心位置*/
    CGPoint center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2);
    attribute.size = CGSizeMake(50, 50);
    
    /** 计算cell的位置*/
    float x = center.x+cosf(2*M_PI/_itemCount*indexPath.row)*(radius-25);
    float y = center.y+sinf(2*M_PI/_itemCount*indexPath.row)*(radius-25);
    
    attribute.center = CGPointMake(x, y);
    attribute.size = CGSizeMake(50, 50);
    
    return attribute;
}

-(CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attributeArr;
}

@end
