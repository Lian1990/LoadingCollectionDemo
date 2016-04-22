//
//  WaterWaveVC.h
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/21.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterView.h"

@interface WaterWaveVC : UIViewController<UIWebViewDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate>

@property (strong,nonatomic) UIWebView *webShow;
@property (strong,nonatomic) WaterView *waveShow;

@property (strong,nonatomic) NSFileHandle *writeHandle;

@property(nonatomic)long long currentLength;
@property(nonatomic)long long sumLength;

@end
