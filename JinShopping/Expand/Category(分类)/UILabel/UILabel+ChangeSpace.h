//
//  UILabel+ChangeSpace.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/30.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ChangeSpace)

/**
 改变行间距

 @param label 当前的Label
 @param space 行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label withSpace:(float)space;

/**
 改变字间距
 
 @param label 当前的Label
 @param space 行间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label withSpace:(float)space;

/**
 改变行间距和字间距
 
 @param label 当前的Label
 @param lineSpace 行间距
 @param wordSpace 字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace wordSpace:(float)wordSpace;

@end
