//
//  ViewController.m
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/21.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import "ViewController.h"
#import "BallSportVC.h"
#import "WaterWaveVC.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myTable = _myTable;
@synthesize dataArr = _dataArr;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    [self.view addSubview:_myTable];
    
    _dataArr = @[@"BallSport",@"WaterWave"];
    
//    [self buildFrostedGlass];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = [_dataArr objectAtIndex:indexPath.row];
        return cell;
    }
    else
        return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        BallSportVC *ballvc = [[BallSportVC alloc]init];
        [self.navigationController pushViewController:ballvc animated:YES];
        return;
    }
    if (indexPath.row == 1) {
        WaterWaveVC *waterVC = [[WaterWaveVC alloc]init];
        [self.navigationController pushViewController:waterVC animated:YES];
        return;
    }
}
//实验=毛玻璃

-(void)buildFrostedGlass
{
    UIImageView *bgIma = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image1.jpg"]];
    bgIma.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:bgIma];
    
    UIVisualEffectView *effectV = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectV.frame = CGRectMake(0, 0, 200, 200);
    effectV.alpha = 1.0f;
    [bgIma addSubview:effectV];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
