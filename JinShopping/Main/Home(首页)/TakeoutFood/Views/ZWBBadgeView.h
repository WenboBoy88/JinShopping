//
//  ZWBBadgeView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBBadgeView : UIView

- (instancetype)initWithFrame:(CGRect)frame withString:(NSString *)string;

- (instancetype)initWithFrame:(CGRect)frame withString:(NSString *)string withTextColor:(UIColor *)textColor;

/** 显示的值*/
@property (nonatomic,strong) NSString *badgeValue;
/** 显示的颜色*/
@property (nonatomic,strong) UIColor *textColor;

@end
