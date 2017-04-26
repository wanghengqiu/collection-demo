//
//  WaterFallLayout.m
//  TestDemo
//
//  Created by 王恒求 on 2017/4/25.
//  Copyright © 2017年 王恒求. All rights reserved.
//

#import "WaterFallLayout.h"
#import "AppUtily.h"

#define kColumnCount        2
#define kSpace              10

@interface WaterFallLayout()

/** */
@property(nonatomic,assign) UIEdgeInsets sectionInset;
/** 记录每列的高度*/
@property(nonatomic,retain) NSMutableDictionary* heightDic;
/** 记录每个cell的attribute*/
@property(nonatomic,retain) NSMutableArray* attributeArr;

@end

@implementation WaterFallLayout

-(instancetype)init
{
    self=[super init];
    
    if (self) {
        self.heightDic = [NSMutableDictionary dictionary];
        self.attributeArr = [NSMutableArray array];
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.itemWidth = (kSCREEN_WIDTH - self.sectionInset.left-self.sectionInset.right-kSpace*(kColumnCount-1))/2;
    }
    
    return self;
}

/** 准备布局*/
-(void)prepareLayout
{
    [super prepareLayout];
    
    for (int i=0; i<kColumnCount; i++) {
        [self.heightDic setObject:@(self.sectionInset.top) forKey:@(i)];
    }
    
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    [self.attributeArr removeAllObjects];
    for (int i=0; i<itemCount; i++) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.attributeArr addObject:attributes];
    }
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath===%ld",(long)indexPath.row);
    UICollectionViewLayoutAttributes* attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    /** 随机一个高度*/
    CGFloat itemHeight = 100 + arc4random_uniform(150);
    
    /** 找出目前是哪个列的高度最短，把这个cell放在最短的这一列的下面*/
    __block NSNumber* minIndex = @0;
    [self.heightDic enumerateKeysAndObjectsUsingBlock:^(NSNumber* key, NSNumber* obj, BOOL * _Nonnull stop) {
        if ([self.heightDic[minIndex] floatValue]> obj.floatValue) {
            minIndex = key;
        }
    }];
    
    /** 根据最短的列来算出这一个cell的frame*/
    CGFloat cellX = self.sectionInset.left+minIndex.intValue*(self.itemWidth+kSpace);
    /** y值就等于该列现有的高度加上一个space*/
    CGFloat cellY = [self.heightDic[minIndex] floatValue]+kSpace;
    attribute.frame = CGRectMake(cellX, cellY, self.itemWidth, itemHeight);
    
    self.heightDic[minIndex] = @(CGRectGetMaxY(attribute.frame));
    
    return attribute;
}

/** 重新计算contentsize，如果不计算，会出现最下面的cell，有些无法显示完全*/
-(CGSize)collectionViewContentSize
{
    __block NSNumber *maxIndex=@0;
    
    /** 找出最长的那一列*/
    [self.heightDic enumerateKeysAndObjectsUsingBlock:^(NSNumber* key, NSNumber* obj, BOOL * _Nonnull stop) {
        if ([self.heightDic[maxIndex] floatValue] < obj.floatValue) {
            maxIndex=key;
        }
    }];
    
    return CGSizeMake(0, [self.heightDic[maxIndex] floatValue]+self.sectionInset.bottom);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributeArr;
}


@end
