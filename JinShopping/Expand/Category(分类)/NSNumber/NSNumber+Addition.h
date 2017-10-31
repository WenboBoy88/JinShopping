//
//  NSNumber+Addition.h
//  智能核心理赔系统公司版
//
//  Created by 张文博 on 2017/8/7.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Addition)

/**
 返回数字精度问题

 @param position 保留小数的位数
 @return 返回修改小数后的字符串
 */
- (NSString *)getAfterPoint:(NSInteger)position;

- (NSString *)numberToString;

@end
