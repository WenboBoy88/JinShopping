//
//  UIAlertView+Block.h
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/27.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIAlertViewCallBackBlock)(NSInteger buttonIndex);

@interface UIAlertView (Block)

@property (nonatomic, copy) UIAlertViewCallBackBlock alertViewCallBackBlock;

+ (void)alertWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;


@end
