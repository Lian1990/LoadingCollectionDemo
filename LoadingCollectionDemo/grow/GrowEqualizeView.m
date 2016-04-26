//
//  GrowEqualizeView.m
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/26.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import "GrowEqualizeView.h"

#define layerW  WIDTH/5
#define itemW   WIDTH/6

@implementation GrowEqualizeView

@synthesize colorArr = _colorArr;
@synthesize fifthBar = _fifthBar;
@synthesize firstBar = _firstBar;
@synthesize secondBar = _secondBar;
@synthesize thirdBar = _thirdBar;
@synthesize fourthBar = _fourthBar;
@synthesize originalBezierPath = _originalBezierPath;
@synthesize endBezierPath = _endBezierPath;
@synthesize animation = _animation;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self buildSprites];
        [self spriteAnimation];
        [self showAnimation];
    }
    return self;
}
-(void)initData
{
    _colorArr = [NSArray arrayWithObjects:[UIColor redColor],[UIColor purpleColor],[UIColor greenColor],[UIColor blueColor],[UIColor yellowColor], nil];
    self.backgroundColor = [UIColor grayColor];
    
    _originalBezierPath = [UIBezierPath bezierPath];
    [_originalBezierPath moveToPoint:CGPointMake(0, HEIGHT/4.0)];
    [_originalBezierPath addLineToPoint:CGPointMake(itemW, HEIGHT/4.0)];
    [_originalBezierPath addLineToPoint:CGPointMake(itemW, HEIGHT*3.0/4.0)];
    [_originalBezierPath addLineToPoint:CGPointMake(0, HEIGHT*3.0/4.0)];
    [_originalBezierPath addLineToPoint:CGPointMake(0, HEIGHT/4.0)];
    
    _endBezierPath = [UIBezierPath bezierPath];
    [_endBezierPath moveToPoint:CGPointMake(0, 0)];
    [_endBezierPath addLineToPoint:CGPointMake(itemW, 0)];
    [_endBezierPath addLineToPoint:CGPointMake(itemW, HEIGHT)];
    [_endBezierPath addLineToPoint:CGPointMake(0, HEIGHT)];
    [_endBezierPath addLineToPoint:CGPointMake(0, 0)];
}
-(void)buildSprites
{
    for (int i = 0; i < 5; i++) {
        CGPoint originalP = CGPointMake(layerW * i, 0);
        if (i == 0) {
            _firstBar = [CAShapeLayer layer];
            _firstBar.frame = CGRectMake(originalP.x, originalP.y, itemW, HEIGHT);
            _firstBar.path = _originalBezierPath.CGPath;
            _firstBar.fillColor = ((UIColor *) [_colorArr objectAtIndex:i]).CGColor;
            [self.layer addSublayer:_firstBar];
            
        }
        else if (i == 1)
        {
            _secondBar = [CAShapeLayer layer];
            _secondBar.frame = CGRectMake(originalP.x, originalP.y, itemW, HEIGHT);
            _secondBar.path = _originalBezierPath.CGPath;
            _secondBar.fillColor = ((UIColor *)[_colorArr objectAtIndex:i]).CGColor;
            [self.layer addSublayer:_secondBar];
        }
        else if (i == 2)
        {
            _thirdBar = [CAShapeLayer layer];
            _thirdBar.frame = CGRectMake(originalP.x, originalP.y, itemW, HEIGHT);
            _thirdBar.path = _originalBezierPath.CGPath;
            _thirdBar.fillColor = ((UIColor *)[_colorArr objectAtIndex:i]).CGColor;
            [self.layer addSublayer:_thirdBar];
        }
        else if (i == 3)
        {
            _fourthBar = [CAShapeLayer layer];
            _fourthBar.frame = CGRectMake(originalP.x, originalP.y, itemW, HEIGHT);
            _fourthBar.path = _originalBezierPath.CGPath;
            _fourthBar.fillColor = ((UIColor *)[_colorArr objectAtIndex:i]).CGColor;
            [self.layer addSublayer:_fourthBar];
        }
        else if (i == 4)
        {
            _fifthBar = [CAShapeLayer layer];
            _fifthBar.frame = CGRectMake(originalP.x, originalP.y, itemW, HEIGHT);
            _fifthBar.path = _originalBezierPath.CGPath;
            _fifthBar.fillColor = ((UIColor *)[_colorArr objectAtIndex:i]).CGColor;
            [self.layer addSublayer:_fifthBar];
        }
    }
}
-(void)spriteAnimation
{
    _animation = [CABasicAnimation animationWithKeyPath:@"path"];
    _animation.fromValue = (id)_originalBezierPath.CGPath;
    _animation.toValue = (id)_endBezierPath.CGPath;
    _animation.autoreverses = YES;
    _animation.repeatCount = MAXFLOAT;
    _animation.duration = 0.8f;
    _animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.80 :0 :0.275 :1];//控制动画速度
//    _animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
}
-(void)showAnimation
{
    [self performSelector:@selector(addFirstAniamtion) withObject:nil afterDelay:0];
    [self performSelector:@selector(addSecondAnimation) withObject:nil afterDelay:0.2];
    [self performSelector:@selector(addThirdAnimation) withObject:nil afterDelay:0.4];
    [self performSelector:@selector(addFourthAnimation) withObject:nil afterDelay:0.6];
    [self performSelector:@selector(addFifthAnimation) withObject:nil afterDelay:0.8];
}
-(void) addFirstAniamtion
{
    [_firstBar addAnimation:_animation forKey:@"firstAnimation"];
}
-(void) addSecondAnimation
{
    [_secondBar addAnimation:_animation forKey:@"secondAnimation"];
}
-(void) addThirdAnimation
{
    [_thirdBar addAnimation:_animation forKey:@"thirdAnimatin"];
}
-(void) addFourthAnimation
{
    [_fourthBar addAnimation:_animation forKey:@"fourthAnimation"];
}
-(void) addFifthAnimation
{
    [_fifthBar addAnimation:_animation forKey:@"fifthAnimation"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
