//
//  ZWBMineCustomerItemView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/20.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>
// Model
#import "ZWBMineSectionItemModel.h"

@interface ZWBMineCustomerItemView : UIView


/**
 填充的Model类
 */
@property (nonatomic, strong) ZWBMineSectionItemModel *model;


- (void)addTarget:(id)target action:(SEL)action;


@end
