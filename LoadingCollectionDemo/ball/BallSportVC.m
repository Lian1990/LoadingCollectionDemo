//
//  BallSportVC.m
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/21.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import "BallSportVC.h"

@implementation BallSportVC

@synthesize ballV = _ballV;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor greenColor];
    }
    return self;
}

-(void)viewDidLoad
{
    _ballV = [[BallSportView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:_ballV];
    [_ballV showLoading];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(50, 380, 100, 30);
    [btn setTitle:@"BTN" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick:(id)sender
{
    [_ballV dismissLoading];
}

@end
