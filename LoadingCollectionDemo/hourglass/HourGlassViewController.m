//
//  HourGlassViewController.m
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/25.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

#import "HourGlassViewController.h"

@interface HourGlassViewController ()

@end

@implementation HourGlassViewController

@synthesize hourglass = _hourglass;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _hourglass = [[HourGlassView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_hourglass];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
