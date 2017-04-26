//
//  WaterFallViewController.m
//  TestDemo
//
//  Created by 王恒求 on 2017/4/24.
//  Copyright © 2017年 王恒求. All rights reserved.
//

#import "WaterFallViewController.h"
#import "AppUtily.h"
#import "WaterFallLayout.h"

static NSString * const myCell = @"myCell";

@interface WaterFallViewController () <UICollectionViewDataSource>

@property(nonatomic,retain) UICollectionView *collectionView;

@end

@implementation WaterFallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    WaterFallLayout *layOut=[[WaterFallLayout alloc]init];
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT-64) collectionViewLayout:layOut];
    _collectionView.backgroundColor=[UIColor clearColor];
    //_collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.showsVerticalScrollIndicator=NO;
    _collectionView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:myCell];
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:myCell forIndexPath:indexPath];
    cell.backgroundColor=RANDOM_COLOR;
    return cell;
}

@end
