//
//  ZWBStrUtility.h
//  智能核心理赔系统公司版
//
//  Created by 张文博 on 16/12/1.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWBStrUtility : NSObject


//处理表情字符
+ (NSMutableAttributedString *)emotionStrWithString:(NSString *)text;

/**
 *  将带有表情符的文字转换为图文混排的文字
 *
 *  @param text      带表情符的文字
 *  @param plistName 表情符与表情对应的plist文件
 *  @param y         图片的y偏移值
 *
 *  @return 转换后的文字
 */
+ (NSMutableAttributedString *)emotionStrWithString:(NSString *)text plistName:(NSString *)plistName y:(CGFloat)y;
/**
 *  将个别文字转换为特殊的图片
 *
 *  @param string    原始文字段落
 *  @param text      特殊的文字
 *  @param imageName 要替换的图片
 *
 *  @return  NSMutableAttributedString
 */
+ (NSMutableAttributedString *)exchangeString:(NSString *)string withText:(NSString *)text imageName:(NSString *)imageName;


@end
