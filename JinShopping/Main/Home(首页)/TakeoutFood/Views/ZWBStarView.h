//
//  ZWBStarView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/25.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBStarView : UIView

/** 是否可以点击*/
@property (nonatomic, assign) BOOL operation;
/** 点击回调Block*/
@property (nonatomic, copy) void (^starLevelBlock)(CGFloat starLevel, NSIndexPath *indexPath);

@property (nonatomic, assign) CGFloat level;

@property (nonatomic, strong) NSIndexPath *indexPath;


@end
