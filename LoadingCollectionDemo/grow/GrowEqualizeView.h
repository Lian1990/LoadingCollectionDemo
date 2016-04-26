//
//  GrowEqualizeView.h
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/26.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GrowEqualizeView : UIView

@property (strong,nonatomic) NSArray *colorArr;
// Bars
@property (strong,nonatomic) CAShapeLayer *firstBar;
@property (strong,nonatomic) CAShapeLayer *secondBar;
@property (strong,nonatomic) CAShapeLayer *thirdBar;
@property (strong,nonatomic) CAShapeLayer *fourthBar;
@property (strong,nonatomic) CAShapeLayer *fifthBar;

// Bezier path
@property (strong,nonatomic) UIBezierPath *originalBezierPath;
@property (strong,nonatomic) UIBezierPath *endBezierPath;
@property (strong,nonatomic) CABasicAnimation *animation;

@end
