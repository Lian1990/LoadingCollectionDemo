//
//  HourGlassView.h
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/25.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HourGlassView : UIView
{
    CGFloat _vwidth;
    CGFloat _vheight;
}

// Top
@property (strong, nonatomic) CAShapeLayer *topLayer;

// Bottom
@property (strong, nonatomic) CAShapeLayer *bottomLayer;

// Dash line
@property (strong, nonatomic) CAShapeLayer *lineLayer;

// container Layer
@property (strong, nonatomic) CALayer *containerLayer;

// Animaiton
@property (strong, nonatomic) CAKeyframeAnimation *topAnimation;

@property (strong, nonatomic) CAKeyframeAnimation *bottomAnimation;

@property (strong, nonatomic) CAKeyframeAnimation *lineAnimation;

@property(strong, nonatomic) CAKeyframeAnimation *containerAnimation;

@end
