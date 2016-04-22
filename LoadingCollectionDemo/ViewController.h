//
//  ViewController.h
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/21.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *myTable;
@property (strong,nonatomic) NSArray     *dataArr;


@end

