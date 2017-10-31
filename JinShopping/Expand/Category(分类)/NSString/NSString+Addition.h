//
//  NSString+Addition.h
//  网络请求
//
//  Created by 张文博 on 16/9/20.
//  Copyright © 2016年 zhangwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)

- (NSString *)convertTimesTampWithDateFormat:(NSString *)dateFormat;

/** 无空格和换行的字符串*/
- (NSString *)noWhiteSpaceString;


- (NSString *)handlerOtherCharString;


@end
