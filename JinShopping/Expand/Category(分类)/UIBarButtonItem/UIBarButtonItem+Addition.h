//
//  UIBarButtonItem+Addition.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/18.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Addition)


+ (UIBarButtonItem *)itemWithTitle:(NSString *)title
                             frame:(CGRect)frame
                            target:(id)target
                            action:(SEL)action;


+ (UIBarButtonItem *)itemWithImage:(UIImage *)image
                            target:(id)target
                            action:(SEL)action;

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title
                             frame:(CGRect)frame
                 layercornerRadius:(CGFloat)cornerRadius
                 layerBorderWitdth:(CGFloat)borderWidth
                  layerBorderColor:(UIColor *)borderColer
                            target:(id)target
                            action:(SEL)action;

/**
 扩展

 @param image 正常的图片
 @param selectedImage 选择后的图片
 @param target 响应者
 @param action 响应事件
 @return 返回
 */
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image
                      selectedImage:(UIImage *)selectedImage
                            target:(id)target
                            action:(SEL)action;


/**
 扩展

 @param image 正常的图片
 @param highlightedImage 点击高亮图片
 @param target 响应者
 @param action 响应事件
 @return 返回
 */
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image
                  highlightedImage:(UIImage *)highlightedImage
                            target:(id)target
                            action:(SEL)action;

/**
 扩展
 
 @param image 正常的图片
 @param highlightedImage 点击高亮图片
 @param selectedImage 选择后的图片
 @param target 响应者
 @param action 响应事件
 @return 返回
 */
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image
                  highlightedImage:(UIImage *)highlightedImage
                     selectedImage:(UIImage *)selectedImage
                            target:(id)target
                            action:(SEL)action;



#pragma 返回
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage title:(NSString *)title target:(id)target action:(SEL)action;


@end
