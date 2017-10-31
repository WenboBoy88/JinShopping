//
//  MBProgressHUD+Expand.h
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/27.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Expand)

/**
 *  自定义图片的提示，3s后自动消失
 *
 *  @param title 要显示的文字
 *  @param iconName 图片地址(建议不要太大的图片)
 *  @param view 要添加的view
 */
+ (void)showCustomIcon:(NSString *)iconName title:(NSString *)title toView:(UIView *)view;

/**
 *  自动消失成功提示，带默认图
 *
 *  @param success 要显示的文字
 *  @param view    要添加的view
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;


/**
 *  自动消失错误提示,带默认图
 *
 *  @param error 要显示的错误文字
 *  @param view  要添加的View
 */
+ (void)showError:(NSString *)error toView:(UIView *)view;


/**
 *  自动消失提示,带默认图
 *
 *  @param info 要显示的文字
 *  @param view  要添加的View
 */
+ (void)showInfo:(NSString *)info toView:(UIView *)view;


/**
 *  自动消失提示,带默认图
 *
 *  @param warn 要显示的文字
 *  @param view  要添加的View
 */
+ (void)showWarn:(NSString *)warn toView:(UIView *)view;



/**
 *  快速显示一条提示信息
 *
 *  @param showAutoMessage 要显示的文字
 */
+ (void)showAutoMessage:(NSString *)showAutoMessage;


/**
 *  自定义停留时间，有图(菊花)
 *
 *  @param message 要显示的文字
 *  @param view    要添加的View
 *  @param time    停留时间
 */
+ (void)showIconMessage:(NSString *)message toView:(UIView *)view remainTime:(CGFloat)time;


/**
 *  显示文本信息，无图 
 *
 *  @param message 要显示的文字
 *  @param view 要添加的View
 *  @param time 停留时间
 */
+ (void)showMessage:(NSString *)message toView:(UIView *)view remainTime:(CGFloat)time;


/**
 从视图上得到HUD

 @param view 要添加的view
 @return 返回HUD
 */
+ (MBProgressHUD *)getMBProgressHUDWithView:(UIView *)view;

/**
 *  文字+菊花提示,不自动消失
 *
 *  @param message 要显示的文字
 *  @param view    要添加的View
 *
 */
+ (void)showMessage:(NSString *)message toView:(UIView *)view;


/**
 *  自定义动画
 *
 *  @param message  显示的文字
 *  @param model    样式
 *  @param view     加载在view上
 *
 *  @return 返回动画
 */
+ (MBProgressHUD *)showMessage:(NSString *)message model:(MBProgressHUDMode)model toView:(UIView *)view;

/**
 *  隐藏ProgressView
 *
 *  @param view superView
 */
+ (void)hideHUDForView:(UIView *)view;


/**
 *  延迟隐藏ProgressView
 */
+ (void)hideHUD:(MBProgressHUD *)hud afterDelay:(CGFloat)time;


@end
