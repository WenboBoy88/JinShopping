//
//  ZWBGoodsMainModel.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/10.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseModel.h"

@class ZWBGoodsSubItemModel;
@interface ZWBGoodsMainModel : ZWBBaseModel

/** 文标题  */
@property (nonatomic, copy ,readonly) NSString *title;

/** goods  */
@property (nonatomic, copy ,readonly) NSArray<ZWBGoodsSubItemModel *> *goods;


@end
