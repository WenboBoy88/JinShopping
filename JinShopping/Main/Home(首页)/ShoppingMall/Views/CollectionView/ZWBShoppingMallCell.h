//
//  ZWBShoppingMallCell.h
//  JinShopping
//
//  Created by apple on 2017/6/14.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import <UIKit/UIKit.h>
// Models
#import "ZWBShoppingMallModel.h"


@interface ZWBShoppingMallCell : UICollectionViewCell

@property (nonatomic, copy) dispatch_block_t convertClickBlock;

/* 推荐数据 */
@property (strong , nonatomic) ZWBShoppingMallModel *mallModel;

/** 是否隐藏 默认隐藏*/
@property (nonatomic, assign) BOOL isHiddenConvertBtn;

@end
