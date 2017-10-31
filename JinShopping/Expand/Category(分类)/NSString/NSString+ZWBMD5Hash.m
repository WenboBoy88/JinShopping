//
//  NSString+ZWBMD5Hash.m
//  智能核心理赔系统
//
//  Created by 张文博 on 16/9/14.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "NSString+ZWBMD5Hash.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (ZWBMD5Hash)

- (NSString *)md5Hash {
    
    const char* str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (int)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;

}

@end
