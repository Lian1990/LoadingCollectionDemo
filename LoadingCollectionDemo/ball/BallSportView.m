//
//  BallSportView.m
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/21.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import "BallSportView.h"


#define BALL_COLOR  [UIColor blackColor]
#define BALL_RADIUS 20

@interface BallSportView ()

@property (strong,nonatomic) UIView *first_ball;
@property (strong,nonatomic) UIView *second_ball;
@property (strong,nonatomic) UIView *third_ball;

@end

@implementation BallSportView

@synthesize first_ball = _first_ball;
@synthesize second_ball = _second_ball;
@synthesize third_ball = _third_ball;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加一个毛玻璃模板
        UIVisualEffectView *effectV = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        effectV.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
        effectV.alpha = 1.0f;
        effectV.layer.cornerRadius = BALL_RADIUS;
        [self addSubview:effectV];
    }
    return self;
}
-(void)showLoading
{
    CGFloat Bheight = HEIGHT/2 - BALL_RADIUS/2;
    
    _first_ball = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2 - BALL_RADIUS*1.5, Bheight, BALL_RADIUS, BALL_RADIUS)];
    _second_ball = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2 - BALL_RADIUS*0.5, Bheight, BALL_RADIUS, BALL_RADIUS)];
    _third_ball = [[UIView alloc]initWithFrame:CGRectMake(WIDTH/2 +BALL_RADIUS*0.5, Bheight, BALL_RADIUS, BALL_RADIUS)];
    
    _first_ball.backgroundColor = BALL_COLOR;
    _second_ball.backgroundColor = BALL_COLOR;
    _third_ball.backgroundColor = BALL_COLOR;
    
    _first_ball.layer.cornerRadius = BALL_RADIUS/2;
    _second_ball.layer.cornerRadius = BALL_RADIUS/2;
    _third_ball.layer.cornerRadius = BALL_RADIUS/2;
    
    [self addSubview:_first_ball];
    [self addSubview:_second_ball];
    [self addSubview:_third_ball];
    
    [self loadingAnimation];
    
}
-(void)loadingAnimation
{
    //三个球的圆心
    CGPoint  centerP = CGPointMake(WIDTH/2, HEIGHT/2);
    CGPoint  centerFirstP = CGPointMake(WIDTH/2 - BALL_RADIUS, HEIGHT/2);
    CGPoint  centerThirdP = CGPointMake(WIDTH/2 + BALL_RADIUS, HEIGHT/2);
    
    //第一个圆的曲线
    UIBezierPath *pathFirst = [UIBezierPath bezierPath];
    [pathFirst moveToPoint:centerFirstP];
    [pathFirst addArcWithCenter:centerP radius:BALL_RADIUS startAngle:M_PI endAngle:M_PI*2 clockwise:NO];
    UIBezierPath *pathFirstSub = [UIBezierPath bezierPath];
    [pathFirstSub addArcWithCenter:centerP radius:BALL_RADIUS startAngle:0 endAngle:M_PI clockwise:NO];
    [pathFirst appendPath:pathFirstSub];
    //第一个圆的动画
    CAKeyframeAnimation *firstBall_animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    firstBall_animation.path = pathFirst.CGPath;
    firstBall_animation.fillMode = kCAFillModeForwards;
    firstBall_animation.removedOnCompletion = NO;
    firstBall_animation.calculationMode = kCAAnimationCubic;
    firstBall_animation.duration = 1.5;
    firstBall_animation.repeatCount = 1;
//    firstBall_animation.delegate = self;
    firstBall_animation.autoreverses = NO;
    firstBall_animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_first_ball.layer addAnimation:firstBall_animation forKey:@"animation"];
    
    //第三个圆的曲线
    UIBezierPath *pathThird = [UIBezierPath bezierPath];
    [pathThird moveToPoint:centerThirdP];
    [pathThird addArcWithCenter:centerP radius:BALL_RADIUS startAngle:0 endAngle:M_PI clockwise:NO];
    UIBezierPath *pathThirdSub = [UIBezierPath bezierPath];
    [pathThirdSub addArcWithCenter:centerP radius:BALL_RADIUS startAngle:M_PI endAngle:M_PI*2 clockwise:NO];
    [pathThird appendPath:pathThirdSub];
    
    //第三个圆的动画
    CAKeyframeAnimation *thirdBall_animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    thirdBall_animation.path = pathThird.CGPath;
    thirdBall_animation.removedOnCompletion = NO;
    thirdBall_animation.fillMode = kCAFillModeForwards;
    thirdBall_animation.calculationMode = kCAAnimationCubic;
    thirdBall_animation.repeatCount = 1;
    thirdBall_animation.duration = 1.5;
    thirdBall_animation.delegate = self;
    thirdBall_animation.autoreverses = NO;
    thirdBall_animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.third_ball.layer addAnimation:thirdBall_animation forKey:@"animation"];
    
}
-(void)animationDidStart:(CAAnimation *)anim
{
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseOut animations:^{
        _first_ball.transform = CGAffineTransformMakeTranslation(-BALL_RADIUS, 0);
        _first_ball.transform = CGAffineTransformScale(_first_ball.transform, 0.8, 0.8);
        
        _third_ball.transform = CGAffineTransformMakeTranslation(BALL_RADIUS, 0);
        _third_ball.transform = CGAffineTransformScale(_third_ball.transform, 0.8, 0.8);
        
        _second_ball.transform = CGAffineTransformMakeScale(0.8, 0.8);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionCurveEaseIn|UIViewAnimationOptionBeginFromCurrentState animations:^{
            _first_ball.transform = CGAffineTransformIdentity;
            _second_ball.transform = CGAffineTransformIdentity;
            _third_ball.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
        }];
        
    }];
}
//repeat 方式
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self loadingAnimation];
}

-(void)dismissLoading
{
    if (self.subviews) {
        [self removeFromSuperview];
    }
}

@end
