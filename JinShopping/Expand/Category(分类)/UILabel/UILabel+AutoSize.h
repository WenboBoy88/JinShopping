//
//  UILabel+AutoSize.h
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/13.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AutoSize)

/**
 * 垂直方向固定获取动态宽度的UILabel的方法
 *
 * @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (CGRect)resizeLabelHorizontal;

/**
 *  水平方向固定获取动态高度的UILabel的方法
 *
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (CGRect)resizeLabelVertical;

/**
 *  垂直方向固定获取动态宽度的UILabel的方法
 *
 *  @param minimumWidth minimum width
 *
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (CGRect)resizeLabelHorizontal:(CGFloat)minimumWidth;

/**
 *  水平方向固定获取动态高度的UILabel的方法
 *
 *  @param minimumHeigh minimum height
 *
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (CGRect)resizeLabelVertical:(CGFloat)minimumHeigh;


@end
