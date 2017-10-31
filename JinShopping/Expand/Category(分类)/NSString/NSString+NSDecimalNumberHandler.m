//
//  NSString+NSDecimalNumberHandler.m
//  智能核心理赔系统公司版
//
//  Created by 张文博 on 2017/9/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "NSString+NSDecimalNumberHandler.h"

// 设置返回格式的类型
NSNumberFormatter *ZWBDecimalNumberFormatter(NSUInteger scale, NSNumberFormatterStyle formatterStyle) {
    static NSNumberFormatter *numberFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.alwaysShowsDecimalSeparator = YES;
        numberFormatter.minimumIntegerDigits = 1;
    });
    
    numberFormatter.numberStyle = formatterStyle;
    numberFormatter.minimumFractionDigits = scale;
    return numberFormatter;
};

// CalculationType
typedef NS_ENUM(NSInteger,CalculationType){
    CalculationAdding,
    CalculationSubtracting,
    CalculationMultiplying,
    CalculationDividing,
};


@implementation NSString (NSDecimalNumberHandler)

- (NSString *)zwb_stringNumberByAdding:(NSString *)stringNumber{
    return [self zwb_stringNumberByAdding:stringNumber
                            withBehavior:[ZWBDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)zwb_stringNumberBySubtracting:(NSString *)stringNumber{
    return [self zwb_stringNumberBySubtracting:stringNumber withBehavior:[ZWBDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)zwb_stringNumberByMultiplyingBy:(NSString *)stringNumber{
    return [self zwb_stringNumberByMultiplyingBy:stringNumber withBehavior:[ZWBDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)zwb_stringNumberByDividingBy:(NSString *)stringNumber{
    return [self zwb_stringNumberByDividingBy:stringNumber withBehavior:[ZWBDecimalNumberHandler defaultStringNumberHandler]];
}


- (NSString *)zwb_stringNumberByAdding:(NSString *)stringNumber withBehavior:(ZWBDecimalNumberHandler *)handler{
    return  [self stringNumberByCalculationType:CalculationAdding by:stringNumber withBehavior:handler];
}

- (NSString *)zwb_stringNumberBySubtracting:(NSString *)stringNumber withBehavior:(ZWBDecimalNumberHandler *)handler{
    return  [self stringNumberByCalculationType:CalculationSubtracting by:stringNumber withBehavior:handler];
}
- (NSString *)zwb_stringNumberByMultiplyingBy:(NSString *)stringNumber withBehavior:(ZWBDecimalNumberHandler *)handler{
    return  [self stringNumberByCalculationType:CalculationMultiplying by:stringNumber withBehavior:handler];
}
- (NSString *)zwb_stringNumberByDividingBy:(NSString *)stringNumber withBehavior:(ZWBDecimalNumberHandler *)handler{
    return  [self stringNumberByCalculationType:CalculationDividing by:stringNumber withBehavior:handler];
}


- (NSString *)stringNumberByCalculationType:(CalculationType)type by:(NSString *)stringNumber withBehavior:(ZWBDecimalNumberHandler *)handler{
    
    NSDecimalNumber *selfNumber = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *calcuationNumber = [NSDecimalNumber decimalNumberWithString:stringNumber];
    
    NSDecimalNumber *result = nil;
    if (CalculationAdding == type) {
        result = [selfNumber decimalNumberByAdding:calcuationNumber withBehavior:handler];
    }else if (CalculationSubtracting == type){
        result = [selfNumber decimalNumberBySubtracting:calcuationNumber withBehavior:handler];
    }else if (CalculationMultiplying == type){
        result = [selfNumber decimalNumberByMultiplyingBy:calcuationNumber withBehavior:handler];
    }else if (CalculationDividing == type){
        result = [selfNumber decimalNumberByDividingBy:calcuationNumber withBehavior:handler];
    }
    
    // 设置的精度
    short scale =  [handler scale];
    // 如果自定义了结果格式化工具使用自定义formatter
    NSNumberFormatter *numberFormatter = handler.numberFormatter? :ZWBDecimalNumberFormatter((NSUInteger)scale, handler.formatterStyle);
    return [numberFormatter stringFromNumber:result];
}

@end
