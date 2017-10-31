//
//  ZWBShowItemView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/18.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZWBShowItemView : UIView

- (instancetype)init;

@property (nonatomic, assign) NSInteger showCount;

@property (nonatomic, copy) void(^clickItemBlock)(NSInteger index, NSInteger tag);

@end
