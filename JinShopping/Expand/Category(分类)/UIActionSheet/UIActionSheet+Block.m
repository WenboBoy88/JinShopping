//
//  UIActionSheet+Block.m
//  智能核心理赔系统
//
//  Created by 张文博 on 2016/11/6.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "UIActionSheet+Block.h"
#import <objc/runtime.h>

static NSString *UIActionSheetKey = @"UIActionSheetKey";

@implementation UIActionSheet (Block)

+ (void)actionSheetWithCallBackBlock:(UIActionSheetCallBackBlock)actionSheetCallBackBlock cancelTitle:(NSString *)cancelTitle alertTitle:(NSString *)alertTitle destructive:(NSString *)destructiveTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:alertTitle delegate:nil cancelButtonTitle:cancelTitle destructiveButtonTitle:destructiveTitle otherButtonTitles:nil, nil];
    NSString *other;
    va_list args;
    if (otherButtonTitles) {
        [actionSheet addButtonWithTitle:otherButtonTitles];
        va_start(args, otherButtonTitles);
        while ((other = va_arg(args, NSString *))) {
            [actionSheet addButtonWithTitle:other];
        }
        va_end(args);
    }
    actionSheet.delegate = actionSheet;
    [actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    actionSheet.actionSheetCallBackBlock = actionSheetCallBackBlock;
}

- (void)setActionSheetCallBackBlock:(UIActionSheetCallBackBlock)actionSheetCallBackBlock {
    [self willChangeValueForKey:@"callBackActionSheetBlock"];
    objc_setAssociatedObject(self, &UIActionSheetKey, actionSheetCallBackBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"callBackActionSheetBlock"];
}

- (UIActionSheetCallBackBlock)actionSheetCallBackBlock {
    return objc_getAssociatedObject(self, &UIActionSheetKey);
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%ld", (long)buttonIndex);
    if (self.actionSheetCallBackBlock) {
        self.actionSheetCallBackBlock(buttonIndex);
    }
}

@end
