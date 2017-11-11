//
//  UIBarButtonItem+Addition.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/18.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "UIBarButtonItem+Addition.h"

@implementation UIBarButtonItem (Addition)

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title
                             frame:(CGRect)frame
                            target:(id)target
                            action:(SEL)action {
    return [self itemWithTitle:title frame:frame layercornerRadius:0 layerBorderWitdth:0 layerBorderColor:nil target:target action:action];
}

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image
                            target:(id)target
                            action:(SEL)action {
    return [self itemWithImage:image highlightedImage:nil selectedImage:nil target:target action:action];
}


+ (UIBarButtonItem *)itemWithImage:(UIImage *)image
                     selectedImage:(UIImage *)selectedImage
                            target:(id)target
                            action:(SEL)action {
    
    return [self itemWithImage:image highlightedImage:nil selectedImage:selectedImage target:target action:action];
}

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image
                  highlightedImage:(UIImage *)highlightedImage
                            target:(id)target
                            action:(SEL)action {
    return [self itemWithImage:image highlightedImage:highlightedImage selectedImage:nil target:target action:action];
}


+ (UIBarButtonItem *)itemWithImage:(UIImage *)image
                  highlightedImage:(UIImage *)highlightedImage
                     selectedImage:(UIImage *)selectedImage
                            target:(id)target
                            action:(SEL)action {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightedImage forState:UIControlStateHighlighted];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    UIView *contentView = [[UIView alloc]initWithFrame:btn.frame];
//    [contentView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];

}

// 特殊的标题
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title frame:(CGRect)frame layercornerRadius:(CGFloat)cornerRadius layerBorderWitdth:(CGFloat)borderWidth layerBorderColor:(UIColor *)borderColer target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.titleLabel.font = PFR_FONT(14.0);
    [btn setTitle:title forState:UIControlStateNormal];
    btn.layer.cornerRadius = cornerRadius;
    btn.layer.borderWidth = borderWidth;
    btn.layer.borderColor = [borderColer CGColor];
//    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

#pragma mark - 返回
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage title:(NSString *)title target:(id)target action:(SEL)action {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn sizeToFit];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightedImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, -20);
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


@end
