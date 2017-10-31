//
//  ZWBThrowLineTool.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBThrowLineTool.h"

@interface ZWBThrowLineTool ()<CAAnimationDelegate>

@end

@implementation ZWBThrowLineTool


#pragma mark - 初始化单利
// 创建个静态变量
static ZWBThrowLineTool *_sharedInstance = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [super allocWithZone:zone];
    });
    return _sharedInstance;
}

+ (ZWBThrowLineTool *)sharedThrowLineTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

+ (id)copyWithZone:(NSZone *)zone {
    return _sharedInstance;
}


#pragma mark - 动画
// 从起点运动到终点
- (void)throwObject:(id)obj from:(CGPoint)startPoint to:(CGPoint)endPoint {
    self.showView = (UIView *)obj;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(startPoint.x, startPoint.y)];
    [bezierPath addQuadCurveToPoint:CGPointMake(endPoint.x + 25, endPoint.y + 25) controlPoint:CGPointMake(startPoint.x - 180, startPoint.y - 200)];
    
    [self groupAnimation:bezierPath];
}

#pragma mark - 组合动画
- (void)groupAnimation:(UIBezierPath *)bezierPath {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    expandAnimation.duration = 0.5f;
    expandAnimation.fromValue = [NSNumber numberWithFloat:1];
    expandAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    expandAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *narrowAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    narrowAnimation.beginTime = 0.5f;
    narrowAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
    narrowAnimation.duration = 1.5f;
    narrowAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
    narrowAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,expandAnimation,narrowAnimation];
    groups.duration = 0.7f;
    groups.removedOnCompletion = YES;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    
    [self.showView.layer addAnimation:groups forKey:@"group"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (self.delegate && [self.delegate respondsToSelector:@selector(animationDidFinish)]) {
        [self.delegate performSelector:@selector(animationDidFinish) withObject:nil];
    }
    self.showView = nil;
}

@end
