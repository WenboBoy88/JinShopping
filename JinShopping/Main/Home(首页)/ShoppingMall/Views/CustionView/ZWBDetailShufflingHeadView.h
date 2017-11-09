//
//  ZWBDetailShufflingHeadView.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/9.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBDetailShufflingHeadView : UIView


@property (nonatomic, copy) dispatch_block_t backBlock;

/** 轮播数组 */
@property (nonatomic, copy) NSArray *shufflingArray;


@end
