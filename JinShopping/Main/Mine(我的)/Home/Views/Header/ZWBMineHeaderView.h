//
//  ZWBMineHeaderView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/19.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBMineHeaderView : UIView


/** 签到回调*/
@property (nonatomic, copy) dispatch_block_t signinBlock;
/** 点击头部回调*/
@property (nonatomic, copy) dispatch_block_t tapHeaderBlock;

@end
