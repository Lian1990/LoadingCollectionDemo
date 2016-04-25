//
//  HourGlassView.m
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/25.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

#import "HourGlassView.h"

#define DURATION  3.0f

@implementation HourGlassView

@synthesize topLayer = _topLayer;
@synthesize bottomLayer = _bottomLayer;
@synthesize lineLayer = _lineLayer;
@synthesize containerLayer = _containerLayer;

@synthesize topAnimation = _topAnimation;
@synthesize bottomAnimation = _bottomAnimation;
@synthesize lineAnimation = _lineAnimation;
@synthesize containerAnimation = _containerAnimation;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildCommon];
        [self buildStage];
        [self initAnimation];
        [self showAnimation];
    }
    return self;
}
-(void)buildCommon
{
    self.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    self.backgroundColor = [UIColor colorWithRed:0.2 green:0.4 blue:0.1 alpha:1.0];
    
    _vheight = 50;
    _vwidth = 50;
}
-(void)buildStage
{
    _containerLayer = [CALayer layer];
    _containerLayer.backgroundColor = [UIColor clearColor].CGColor;
    _containerLayer.frame = CGRectMake(0, 0, _vwidth, _vheight * 2);
    _containerLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    _containerLayer.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    [self.layer addSublayer:_containerLayer];
    [self buildTop];
    [self buildBottom];
    [self buildLine];
}
-(void)buildTop
{
    //三角形路径 UIBezierPath
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(_vwidth, 0)];
    [path addLineToPoint:CGPointMake(_vwidth/2, _vheight)];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path closePath];
    
    //topLayer
    _topLayer = [CAShapeLayer layer];
    _topLayer.frame = CGRectMake(0, 0, _vwidth, _vheight);
    _topLayer.path = path.CGPath;
    _topLayer.fillColor = [UIColor whiteColor].CGColor;
    _topLayer.strokeColor = [UIColor whiteColor].CGColor;
    _topLayer.lineWidth = 1.0f;
    _topLayer.anchorPoint = CGPointMake(0.5f, 1.0f);
    _topLayer.position = CGPointMake(_vwidth/2, _vheight);
    
    [_containerLayer addSublayer:_topLayer];
}
-(void)buildBottom
{
    // BezierPath
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(_vwidth / 2, 0)];
    [path addLineToPoint:CGPointMake(_vwidth, _vheight)];
    [path addLineToPoint:CGPointMake(0, _vheight )];
    [path addLineToPoint:CGPointMake(_vwidth / 2, 0)];
    
    [path closePath];
    
    // Top Layer
    _bottomLayer = [CAShapeLayer layer];
    _bottomLayer.frame = CGRectMake(0, _vheight, _vwidth, _vheight);
    _bottomLayer.path = path.CGPath;
    _bottomLayer.fillColor = [UIColor whiteColor].CGColor;
    _bottomLayer.strokeColor = [UIColor whiteColor].CGColor;
    _bottomLayer.lineWidth = 0.0f;
    _bottomLayer.anchorPoint = CGPointMake(0.5f, 1.0f);
    _bottomLayer.position = CGPointMake(_vwidth / 2.0f, _vheight * 2.0f);
    _bottomLayer.transform = CATransform3DMakeScale(0, 0, 0);
    
    [_containerLayer addSublayer:_bottomLayer];
}
-(void)buildLine
{
    // BezierPath
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(_vwidth / 2, 0)];
    [path addLineToPoint:CGPointMake(_vwidth / 2, _vheight)];
    
    // Line Layer
    _lineLayer = [CAShapeLayer layer];
    _lineLayer.frame = CGRectMake(0, _vheight, _vwidth, _vheight);
    _lineLayer.strokeColor = [UIColor whiteColor].CGColor;
    _lineLayer.lineWidth = 1.0;
    _lineLayer.lineJoin = kCALineJoinMiter;
    _lineLayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:1], nil];
    _lineLayer.lineDashPhase = 3.0f;
    _lineLayer.path = path.CGPath;
    _lineLayer.strokeEnd = 0.0f;
    
    [_containerLayer addSublayer:_lineLayer];
}
-(void) initAnimation
{
    if (YES) // Top Animation 渐小
    {
        _topAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        _topAnimation.duration = DURATION;
        _topAnimation.repeatCount = MAXFLOAT;
        _topAnimation.keyTimes = @[@0.0f, @0.9f, @1.0f];//关键帧的时间
        _topAnimation.values = @[@1.0f, @0.0f, @0.0f]; //对应帧的value
    }
    if (YES) // Bottom Animation 渐大
    {
        _bottomAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        _bottomAnimation.duration = DURATION;
        _bottomAnimation.repeatCount = MAXFLOAT;
        _bottomAnimation.keyTimes = @[@0.1f, @0.9f, @1.0f];
        _bottomAnimation.values = @[@0.0f, @1.0f, @1.0f];
    }
    if (YES) // line Animation
    {
        _lineAnimation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
        _lineAnimation.duration = DURATION;
        _lineAnimation.repeatCount = MAXFLOAT;
        _lineAnimation.keyTimes = @[@0.0f, @0.1f, @0.9f, @1.0f];
        _lineAnimation.values = @[@0.0f, @0.1f, @1.0f, @1.0f];
    }
    if (YES) // Container Animation  旋转
    {
        _containerAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
        _containerAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2f :1 :0.8f :0.0f];
        _containerAnimation.duration = DURATION;
        _containerAnimation.repeatCount = MAXFLOAT;
        _containerAnimation.keyTimes = @[@0.8f, @1.0f];
        _containerAnimation.values = @[[NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:M_PI]];
        _containerAnimation.calculationMode = kCAAnimationCubic;
    }
}
-(void)showAnimation
{
    [_topLayer addAnimation:_topAnimation forKey:@"TopAnimatin"];
    [_bottomLayer addAnimation:_bottomAnimation forKey:@"BottomAnimation"];
    [_lineLayer addAnimation:_lineAnimation forKey:@"LineAnimation"];
    [_containerLayer addAnimation:_containerAnimation forKey:@"ContainerAnimation"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
