//
//  ZWBThrowLineTool.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@protocol ZWBThrowLineToolDelegate;

@interface ZWBThrowLineTool : NSObject

@property (nonatomic, assign) id<ZWBThrowLineToolDelegate>delegate;
@property (nonatomic, strong) UIView *showView;



+ (ZWBThrowLineTool *)sharedThrowLineTool;

/**
 *  将某个view或者layer从起点抛到终点
 *
 *  @param obj         被抛的物体
 *  @param startPoint  起点坐标
 *  @param endPoint    终点坐标
 */
- (void)throwObject:(id)obj from:(CGPoint)startPoint to:(CGPoint)endPoint;


@end


@protocol ZWBThrowLineToolDelegate <NSObject>

/**
 *  抛物线结束的回调
 */
- (void)animationDidFinish;

@end
