//
//  GrowEqualizeViewController.m
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/26.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import "GrowEqualizeViewController.h"
#import "GrowEqualizeView.h"

@interface GrowEqualizeViewController ()

@end

@implementation GrowEqualizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    GrowEqualizeView *grow = [[GrowEqualizeView alloc]initWithFrame:CGRectMake(100, 200, 150, 80)];
    [self.view addSubview:grow];
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
