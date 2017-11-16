//
//  ZWBNummberCount.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/16.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBNummberCount : UIView


/**
 *  总数
 */
@property (nonatomic, assign) NSInteger totalNum;
/**
 *  当前显示价格
 */
@property (nonatomic, assign) NSInteger currentCountNumber;

/**
 *  数量改变回调
 */
@property (nonatomic, copy) void(^numberChangeBlock)(NSInteger count);


@end
