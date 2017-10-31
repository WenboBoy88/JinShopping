//
//  ZWBHomeHeaderView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/19.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWBScrollHeaderView.h"
#import "ZWBShowItemView.h"

@interface ZWBHomeHeaderView : UIView

@property (nonatomic, strong) ZWBScrollHeaderView *scrollHeaderView;

@property (nonatomic, strong) ZWBShowItemView *showItemView;

@property (nonatomic, copy) void(^clickHeaderViewBlock)(NSString *clickType, NSInteger clickIndex);

@end
