//
//  NSString+Addition.m
//  网络请求
//
//  Created by 张文博 on 16/9/20.
//  Copyright © 2016年 zhangwenbo. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)

- (NSString *)convertTimesTampWithDateFormat:(NSString *)dateFormat {
    //dateFormat 设置返回的格式 @"yyyy-MM-dd HH:mm"
    if (dateFormat.length == 0) {
        return @"";
    }
    NSTimeInterval timeInterval = [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];

    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *timeStr = [dateFormatter stringFromDate:date];
    
    return timeStr;
}

- (NSString *)noWhiteSpaceString {
    NSString *newString = self;

    newString = [newString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    newString = [newString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //去除掉首尾的空白字符和换行字符使用
    newString = [newString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    newString = [newString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return newString;
}

- (NSString *)handlerOtherCharString {
    NSRange range = [self rangeOfString:@".0"];
    if (range.location != NSNotFound) {
        return [self substringToIndex:range.location];
    } else {
        return self;
    }
}


@end
