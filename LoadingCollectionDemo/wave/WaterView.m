//
//  WaterView.m
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/21.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

#import "WaterView.h"

@implementation WaterView

@synthesize value = _value;
@synthesize waveT = _waveT;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    //圆形路径
   
    CGFloat radius = MIN(WIDTH/2, HEIGHT/2)-10;
    
    //画圆
//    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, radius*2, radius*2)];
//    [ovalPath setLineWidth:2.0f];
//    [ovalPath stroke];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(WIDTH/2, HEIGHT/2) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [path setLineWidth:2.0f];
    [path setLineCapStyle:kCGLineCapRound];
    [path addClip];//裁边
    [path stroke];
    
    //wave
    CGPoint currentP = CGPointMake(0, HEIGHT*(1-_value));
    UIBezierPath *wave = [UIBezierPath bezierPath];
    [wave moveToPoint:currentP];
    for (int i = 0; i < HEIGHT*2; i++) {
        CGPoint temp = relativeCoor(currentP, i, 3*sin(M_PI /40 *i + _waveT));
        [wave addLineToPoint:temp];
    }
    [wave addLineToPoint:CGPointMake(WIDTH, HEIGHT)];
    [wave addLineToPoint:CGPointMake(0, HEIGHT)];
    [[UIColor colorWithRed:0.2 green:0.2 blue:0.7 alpha:1.0]set];
    [wave fill];
    
}
-(void)didMoveToSuperview{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(waveChange) userInfo:nil repeats:YES];
    [timer fire];
}
-(void)waveChange{
    _waveT += M_PI * 0.02;
    if (_waveT == M_PI * 2) {
        _waveT = 0;
    }
    [self setNeedsDisplay];
}
CGPoint relativeCoor(CGPoint point, CGFloat x ,CGFloat y){
    return CGPointMake(point.x + x, point.y + y);
}
@end
