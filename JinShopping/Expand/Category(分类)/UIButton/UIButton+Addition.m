//
//  UIButton+Addition.m
//  智能核心理赔系统公司版
//
//  Created by 张文博 on 17/2/22.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "UIButton+Addition.h"

@implementation UIButton (Addition)

/** 禁用按钮*/
- (UIButton *)closeClickStatus {
    [self setTitleColor:COLOR_666 forState:UIControlStateNormal];
    self.backgroundColor = RGBA(221, 221, 221, 1.f);
    self.enabled = NO;
    return self;
}

/** 打开按钮*/
- (UIButton *)openClickStatusWithBgColor:(UIColor *)bgColor {
    [self setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
    self.backgroundColor = bgColor;
    self.enabled = YES;
    return self;
}
@end
