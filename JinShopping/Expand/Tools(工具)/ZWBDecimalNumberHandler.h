//
//  ZWBDecimalNumberHandler.h
//
//
//  Created by 张文博 on 2017/9/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWBDecimalNumberHandler : NSDecimalNumberHandler

+ (instancetype)defaultStringNumberHandler;

// 自定义的数字格式，结果会忽略设置的scale和formatterStyle
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;

// formatter 的格式  数据类型
@property (nonatomic, assign) NSNumberFormatterStyle formatterStyle;





@end
