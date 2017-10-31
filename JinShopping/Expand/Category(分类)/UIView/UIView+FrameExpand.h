//
//  UIView+FrameExpand.h
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/12.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameExpand)

/** 起点x坐标*/
@property (nonatomic, assign) CGFloat zwb_left;
/** 起点y坐标*/
@property (nonatomic, assign) CGFloat zwb_top;
/** 最大x坐标*/
@property (nonatomic, assign) CGFloat zwb_right;
/** 最大y坐标*/
@property (nonatomic, assign) CGFloat zwb_bottom;
/** 宽*/
@property (nonatomic, assign) CGFloat zwb_width;
/** 高*/
@property (nonatomic, assign) CGFloat zwb_height;
/** 起点(x, y)坐标*/
@property (nonatomic, assign) CGPoint zwb_origin;
/** 尺寸大小{w, h}*/
@property (nonatomic, assign) CGSize  zwb_size;
/** 中心x坐标*/
@property (nonatomic, assign) CGFloat zwb_centerX;
/** 中心y坐标*/
@property (nonatomic, assign) CGFloat zwb_centerY;
/** 中心(x, y)坐标*/
@property (nonatomic, assign) CGPoint zwb_center;

@end
