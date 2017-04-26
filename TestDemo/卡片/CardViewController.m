//
//  CardViewController.m
//  TestDemo
//
//  Created by 王恒求 on 2017/4/24.
//  Copyright © 2017年 王恒求. All rights reserved.
//

#import "CardViewController.h"
#import "CardLayout.h"
#import "AppUtily.h"

static NSString * const myCell = @"myCell";

@interface CardViewController ()<UICollectionViewDelegate,UICollectionViewDataSource> {
    NSArray *data;
}

@property(nonatomic,retain) UICollectionView *collectionView;

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    CardLayout *layOut=[[CardLayout alloc]init];
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 200, kSCREEN_WIDTH, 150) collectionViewLayout:layOut];
    _collectionView.backgroundColor=[UIColor clearColor];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.showsVerticalScrollIndicator=NO;
    _collectionView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:myCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:myCell forIndexPath:indexPath];
    cell.backgroundColor=RANDOM_COLOR;
    cell.layer.cornerRadius=50;
    return cell;
}


@end
