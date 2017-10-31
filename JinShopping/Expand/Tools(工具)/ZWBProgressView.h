//
//  ZWBProgressView.h
//  智能核心理赔系统公司版
//
//  Created by 张文博 on 17/5/4.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBProgressView : UIView

/** 进度范围 0.00 - 1.00*/
@property (nonatomic, assign) CGFloat progress;

@property (nonatomic, assign) BOOL isUsingTimer;


/** 进度条的颜色 */
@property (nonatomic,strong) UIColor *progressColor;
/** 进度条的背景色*/
@property (nonatomic,strong) UIColor *bottomColor;
/** 进度条的速度*/
@property (nonatomic,assign) float time;



/** 开始*/
- (void)startRunTimer;
/** 暂停定时*/
- (void)pauseTimer;
/** 重新启动定时*/
- (void)resumeTimer;
/** 结束*/
- (void)endTimer;

@end
