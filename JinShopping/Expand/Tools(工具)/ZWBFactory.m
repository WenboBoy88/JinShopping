//
//  MyFactory.m
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/18.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "ZWBFactory.h"

@implementation ZWBFactory

+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(CGFloat)font{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = textColor ? textColor : [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}

+ (UIButton *)creatButtonWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor textColor:(UIColor *)color target:(id)target sel:(SEL)sel tag:(NSInteger)tag image:(NSString *)imageName title:(NSString *)title{
    UIButton *button = nil;
    if (imageName) {
        //创建图片按钮
        //创建背景图片 按钮
        button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button setImage:IMAGE(imageName) forState:UIControlStateNormal];
        if (title) {//图片标题按钮
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:color forState:UIControlStateNormal];
        }
        
    } else if (title) {
        //创建标题按钮
        button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:color forState:UIControlStateNormal];
    }
    button.backgroundColor = bgColor;
    button.frame = frame;
    button.tag = tag;
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}
+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image  = [UIImage imageNamed:imageName];
    return imageView;
}

+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)string textColor:(UIColor *)textColor delegate:(id<UITextFieldDelegate>)delegate tag:(NSInteger)tag {
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    //设置风格类型
    textField.textColor = textColor ? textColor : COLOR_BLACK;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = string;
    //设置代理
    textField.delegate = delegate;
    //设置tag值
    textField.tag = tag;
    return textField;
}

@end
