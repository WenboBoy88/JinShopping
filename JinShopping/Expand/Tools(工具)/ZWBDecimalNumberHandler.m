//
//  ZWBDecimalNumberHandler.m
//  智能核心理赔系统公司版
//
//  Created by 张文博 on 2017/9/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBDecimalNumberHandler.h"

@implementation ZWBDecimalNumberHandler

+ (instancetype)defaultStringNumberHandler {
    ZWBDecimalNumberHandler *handler = [[self alloc] initWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    return handler;
}


@end
