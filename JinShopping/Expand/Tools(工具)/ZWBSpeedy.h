//
//  ZWBSpeedy.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/19.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWBSpeedy : NSObject

/**
 设置按钮的圆角
 
 @param anyControl 控件
 @param radius 圆角度
 @param width 边宽度
 @param borderColor 边线颜色
 @param can 是否裁剪
 @return 控件
 */
+ (id)zwb_chageControlCircularView:(id)anyControl cornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)borderColor canMasksToBounds:(BOOL)can;


/**
 选取部分数据变色（label）
 
 @param label label
 @param arrray 变色数组
 @param color 变色颜色
 @return label
 */
+ (id)zwb_setSomeOneChangeColor:(UILabel *)label selectArray:(NSArray *)arrray changeColor:(UIColor *)color;

/**
 下划线
 @param view 下划线
 */
+ (void)zwb_setupAcrossPartingLineWith:(UIView *)view lineColor:(UIColor *)color;

/**
 竖线线

 @param view 竖线
 */
+ (void)zwb_setupLongLineWith:(UIView *)view color:(UIColor *)color heightRatio:(CGFloat)ratio;


/**
 利用贝塞尔曲线设置圆角
 
 @param view 视图
 @param size 圆角尺寸
 */
+ (void)zwb_setupBezierPathCircularLayerWith:(UIView *)view radiusSize:(CGSize)size;


/**
 Label首行缩进
 
 @param label label
 @param emptylen 缩进比
 */
+ (void)zwb_setupLabel:(UILabel *)label content:(NSString *)content indentationFortheFirstLineWith:(CGFloat)emptylen;

/**
 字符串加星处理
 
 @param content NSString字符串
 @param index 第几位开始加星
 @return 返回加星后的字符串
 */
+ (NSString *)zwb_encryptionDisplayMessageWith:(NSString *)content withFirstIndex:(NSInteger)index;


#pragma mark - 图片转base64编码
+ (NSString *)imageToBase64Str:(UIImage *)image;

#pragma mark - base64图片转编码
+ (UIImage *)base64StrToUIImage:(NSString *)encodedImageStr;


@end
