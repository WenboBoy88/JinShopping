//
//  ZWBShoppingCarModel.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/15.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseModel.h"

@interface ZWBShoppingCarModel : ZWBBaseModel

@property (nonatomic, strong) NSString  *p_id;

@property (nonatomic, assign) float     p_price;

@property (nonatomic, strong) NSString  *p_name;

@property (nonatomic, strong) NSString  *p_imageUrl;
/** 存货*/
@property (nonatomic, assign) NSInteger p_stock;
/** 选中数*/
@property (nonatomic, assign) NSInteger p_quantity;

//商品是否被选中
@property (nonatomic, assign) BOOL      isSelect;


@end
