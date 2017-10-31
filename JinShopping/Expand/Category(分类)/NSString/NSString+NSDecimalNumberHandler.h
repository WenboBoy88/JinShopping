//
//  NSString+NSDecimalNumberHandler.h
//  智能核心理赔系统公司版
//
//  Created by 张文博 on 2017/9/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWBDecimalNumberHandler.h"

/**
 // Rounding policies :
 // Original
 //    value 1.2  1.21  1.25  1.35  1.27
 // Plain    1.2  1.2   1.3   1.4   1.3
 // Down     1.2  1.2   1.2   1.3   1.2
 // Up       1.2  1.3   1.3   1.4   1.3
 // Bankers  1.2  1.2   1.2   1.4   1.3
 
 typedef NS_ENUM(NSUInteger, NSRoundingMode) {
 NSRoundPlain,   // Round up on a tie
 NSRoundDown,    // Always down == truncate
 NSRoundUp,      // Always up
 NSRoundBankers  // on a tie round so last digit is even
 };
 */

@interface NSString (NSDecimalNumberHandler)

// Adding
- (NSString *)zwb_stringNumberByAdding:(NSString *)stringNumber;
- (NSString *)zwb_stringNumberByAdding:(NSString *)stringNumber withBehavior:(ZWBDecimalNumberHandler *)handler;

// Subtracting
- (NSString *)zwb_stringNumberBySubtracting:(NSString *)stringNumber;
- (NSString *)zwb_stringNumberBySubtracting:(NSString *)stringNumber withBehavior:(ZWBDecimalNumberHandler *)handler;

// Multiplying
- (NSString *)zwb_stringNumberByMultiplyingBy:(NSString *)stringNumber;
- (NSString *)zwb_stringNumberByMultiplyingBy:(NSString *)stringNumber withBehavior:(ZWBDecimalNumberHandler *)handler;

// Dividing
- (NSString *)zwb_stringNumberByDividingBy:(NSString *)stringNumber;
- (NSString *)zwb_stringNumberByDividingBy:(NSString *)stringNumber withBehavior:(ZWBDecimalNumberHandler *)handler;


@end
