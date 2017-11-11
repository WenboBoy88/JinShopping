//
//  MyFactory.h
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/18.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWBFactory : NSObject

//这个类的功能就是创建label 和button
+ (UILabel *)creatLabelWithFrame:(CGRect)frame
                            text:(NSString *)text
                       textColor:(UIColor *)textColor
                            font:(CGFloat)font;

//创建button可以创建 标题按钮和 图片按钮
+ (UIButton *)creatButtonWithFrame:(CGRect)frame
                           bgColor:(UIColor *)bgColor
                           textColor:(UIColor *)color
                            target:(id)target
                               sel:(SEL)sel
                               tag:(NSInteger)tag
                             image:(NSString *)imageName
                             title:(NSString *)title;
//创建UIImageView
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame
                               imageName:(NSString *)imageName;
//创建UITextField
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame
                             placeHolder:(NSString *)string
                               textColor:(UIColor *)textColor
                                delegate:(id <UITextFieldDelegate>)delegate
                                     tag:(NSInteger)tag;


@end
