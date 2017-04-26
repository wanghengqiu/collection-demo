//
//  CircleViewController.m
//  TestDemo
//
//  Created by 王恒求 on 2017/4/25.
//  Copyright © 2017年 王恒求. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleLayout.h"
#import "AppUtily.h"

static NSString * const myCell = @"myCell";

@interface CircleViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,retain) UICollectionView *collectionView;

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    CircleLayout *layOut=[[CircleLayout alloc]init];
    
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
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:myCell forIndexPath:indexPath];
    cell.layer.cornerRadius=25;
    cell.backgroundColor=RANDOM_COLOR;
    return cell;
}

@end
