//
//  UIActionSheet+Block.h
//  智能核心理赔系统
//
//  Created by 张文博 on 2016/11/6.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIActionSheetCallBackBlock)(NSInteger buttonIndex);

@interface UIActionSheet (Block)<UIActionSheetDelegate>

@property (nonatomic, copy) UIActionSheetCallBackBlock actionSheetCallBackBlock;

+ (void)actionSheetWithCallBackBlock:(UIActionSheetCallBackBlock)actionSheetCallBackBlock cancelTitle:(NSString *)cancelTitle alertTitle:(NSString *)alertTitle destructive:(NSString *)destructiveTitle otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;


@end
