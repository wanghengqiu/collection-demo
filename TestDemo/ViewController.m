//
//  ViewController.m
//  TestDemo
//
//  Created by 王恒求 on 2017/4/21.
//  Copyright © 2017年 王恒求. All rights reserved.
//

#import "ViewController.h"
#import "AppUtily.h"
#import "CardViewController.h"
#import "WaterFallViewController.h"
#import "CircleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"CollectionView";
    
    UIButton *cardBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 30, kSCREEN_WIDTH-30, 45)];
    cardBtn.backgroundColor=HEX2RGB(kNavBackgroundColor);
    [cardBtn setTitle:@"Gallery效果" forState:UIControlStateNormal];
    [self.view addSubview:cardBtn];
    [cardBtn addTarget:self action:@selector(cardBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *waterFallBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 105, kSCREEN_WIDTH-30, 45)];
    waterFallBtn.backgroundColor=HEX2RGB(kNavBackgroundColor);
    [waterFallBtn setTitle:@"瀑布流效果" forState:UIControlStateNormal];
    [self.view addSubview:waterFallBtn];
    [waterFallBtn addTarget:self action:@selector(waterFallBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *circleFallBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 180, kSCREEN_WIDTH-30, 45)];
    circleFallBtn.backgroundColor=HEX2RGB(kNavBackgroundColor);
    [circleFallBtn setTitle:@"环形效果" forState:UIControlStateNormal];
    [self.view addSubview:circleFallBtn];
    [circleFallBtn addTarget:self action:@selector(circleFallBtnClicked) forControlEvents:UIControlEventTouchUpInside];
}


-(void)cardBtnClicked
{
    CardViewController *vc=[[CardViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)waterFallBtnClicked
{
    WaterFallViewController *vc=[[WaterFallViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)circleFallBtnClicked
{
    CircleViewController *vc=[[CircleViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
