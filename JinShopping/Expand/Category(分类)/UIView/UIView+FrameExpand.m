//
//  UIView+FrameExpand.m
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/12.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "UIView+FrameExpand.h"

@implementation UIView (FrameExpand)


- (CGFloat)zwb_left {
    return self.frame.origin.x;
}

- (void)setZwb_left:(CGFloat)zwb_left {
    CGRect frame = self.frame;
    frame.origin.x = zwb_left;
    self.frame = frame;
}

- (CGFloat)zwb_top {
    return self.frame.origin.y;
}

- (void)setZwb_top:(CGFloat)zwb_top {
    CGRect frame = self.frame;
    frame.origin.y = zwb_top;
    self.frame = frame;
}

- (CGFloat)zwb_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setZwb_right:(CGFloat)zwb_right {
    CGRect frame = self.frame;
    frame.origin.x = zwb_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)zwb_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setZwb_bottom:(CGFloat)zwb_bottom {
    CGRect frame = self.frame;
    frame.origin.y = zwb_bottom - frame.size.height;
    self.frame = frame;
}

- (CGSize)zwb_size {
    return self.frame.size;
}

- (CGPoint)zwb_origin {
    return self.frame.origin;
}

- (void)setZwb_origin:(CGPoint)zwb_origin {
    CGRect frame = self.frame;
    frame.origin = zwb_origin;
    self.frame = frame;
}

- (void)setZwb_size:(CGSize)zwb_size {
    CGRect frame = self.frame;
    frame.size = zwb_size;
    self.frame = frame;
}

- (CGFloat)zwb_width {
    return self.frame.size.width;
}

- (void)setZwb_width:(CGFloat)zwb_width
{
    CGRect frame = self.frame;
    frame.size.width = zwb_width;
    self.frame = frame;
}

- (CGFloat)zwb_height {
    return self.frame.size.height;
}

- (void)setZwb_height:(CGFloat)zwb_height {
    CGRect frame = self.frame;
    frame.size.height = zwb_height;
    self.frame = frame;
}

- (CGPoint)zwb_center {
    return self.center;
}

- (void)setZwb_center:(CGPoint)zwb_center {
    self.center = zwb_center;
}

- (CGFloat)zwb_centerX {
//    return self.zwb_left + self.zwb_width * 0.5;
    return self.center.x;
}

- (void)setZwb_centerX:(CGFloat)zwb_centerX {
    CGPoint center = self.center;
    center.x  = zwb_centerX;
    self.center = center;
}

- (CGFloat)zwb_centerY {
//    return self.zwb_top + self.zwb_height * 0.5;
    return self.center.y;
}

- (void)setZwb_centerY:(CGFloat)zwb_centerY {
    CGPoint center = self.center;
    center.y  = zwb_centerY;
    self.center = center;

}

@end
