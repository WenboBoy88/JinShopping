//
//  NSNumber+Addition.m
//  智能核心理赔系统公司版
//
//  Created by 张文博 on 2017/8/7.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "NSNumber+Addition.h"

@implementation NSNumber (Addition)

- (NSString *)getAfterPoint:(NSInteger)position {
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    ouncesDecimal = [[NSDecimalNumber alloc] initWithDouble:self.doubleValue];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [NSString stringWithFormat:@"%@",roundedOunces];
}

- (NSString *)numberToString {
    if ([self.stringValue isEqualToString:@"0"]) {
        return @"0";
    } else {
        
        return [NSString stringWithFormat:@"%.2f", self.doubleValue];
    }
}

@end
