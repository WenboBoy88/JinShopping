//
//  UIButton+Addition.h
//  智能核心理赔系统公司版
//
//  Created by 张文博 on 17/2/22.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Addition)

/** 禁用按钮*/
- (UIButton *)closeClickStatus;
/** 打开按钮*/
- (UIButton *)openClickStatusWithBgColor:(UIColor *)bgColor;

@end
