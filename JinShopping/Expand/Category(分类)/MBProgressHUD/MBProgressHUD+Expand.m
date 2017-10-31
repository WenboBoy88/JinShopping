//
//  MBProgressHUD+Expand.m
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/27.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "MBProgressHUD+Expand.h"

@implementation MBProgressHUD (Expand)

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self showCustomIcon:@"MBHUD_Error" title:error toView:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self showCustomIcon:@"MBHUD_Success" title:success toView:view];
}

+ (void)showInfo:(NSString *)info toView:(UIView *)view {
    [self showCustomIcon:@"MBHUD_Info" title:info toView:view];
}

+ (void)showWarn:(NSString *)Warn toView:(UIView *)view {
    [self showCustomIcon:@"MBHUD_Warn" title:Warn toView:view];
}

+ (void)showCustomIcon:(NSString *)iconName title:(NSString *)title toView:(UIView *)view {
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = title;
    hud.label.font = CHINESE_SYSTEM(15);
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 代表需要蒙版效果
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    
    // 3秒之后再消失
    [hud hideAnimated:YES afterDelay:3];
}


+ (MBProgressHUD *)getMBProgressHUDWithView:(UIView *)view {
    if (view == nil) view = (UIView *)[UIApplication sharedApplication].delegate.window;
    return [MBProgressHUD HUDForView:view];
}

// 文字+菊花提示,不自动消失
+ (void)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = (UIView *)[UIApplication sharedApplication].delegate.window;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = message;
    hud.label.font = CHINESE_SYSTEM(15);
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //代表需要蒙版效果
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];

//    return [self showMessage:message model:MBProgressHUDModeIndeterminate ToView:view];
    
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message model:(MBProgressHUDMode)model toView:(UIView *)view {
    if (view == nil) view = (UIView *)[UIApplication sharedApplication].delegate.window;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = model;
    hud.minSize = CGSizeMake(50.f, 50.f);
    hud.label.text = message;
    hud.label.font = CHINESE_SYSTEM(15);
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //代表需要蒙版效果
//    hud.dimBackground = YES;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    
    return hud;
}



/**
 *  进度条View
 */
+ (MBProgressHUD *)showProgressToView:(UIView *)view text:(NSString *)text{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    hud.label.text = text;
    hud.label.font = CHINESE_SYSTEM(15);
    // 代表需要蒙版效果
//    hud.dimBackground = YES;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];

    return hud;
}

//自定义停留时间，有图(菊花)
+ (void)showIconMessage:(NSString *)message toView:(UIView *)view remainTime:(CGFloat)time {
    [self showMessage:message toView:view remainTime:time model:MBProgressHUDModeIndeterminate];
}


//快速显示一条提示信息
+ (void)showAutoMessage:(NSString *)message{
    [self showMessage:message toView:nil remainTime:1.5 model:MBProgressHUDModeText];
}

//显示底部文本信息，无图
+ (void)showMessage:(NSString *)message toView:(UIView *)view remainTime:(CGFloat)time{
    [self showMessage:message toView:view remainTime:time model:MBProgressHUDModeText];
}

+ (void)showMessage:(NSString *)message toView:(UIView *)view remainTime:(CGFloat)time model:(MBProgressHUDMode)model{
    
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.label.font = CHINESE_SYSTEM(15);
    //模式
    hud.mode = model;
//    hud.square = YES;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 代表需要蒙版效果
//    hud.dimBackground = YES;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];

    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // X秒之后再消失
    [hud hideAnimated:YES afterDelay:time];
}

+ (void)hideHUD:(MBProgressHUD *)hud afterDelay:(CGFloat)time {
    
    [hud hideAnimated:YES afterDelay:time];
}


+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = (UIView *)[UIApplication sharedApplication].delegate.window;
    
    [self hideHUDForView:view animated:YES];
}



@end
