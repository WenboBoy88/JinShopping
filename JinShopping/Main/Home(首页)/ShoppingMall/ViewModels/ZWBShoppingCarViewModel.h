//
//  ZWBShoppingCarViewModel.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/15.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseViewModel.h"
#import "ZWBShoppingCarController.h"
#import "ZWBShoppingCarModel.h"

@interface ZWBShoppingCarViewModel : ZWBBaseViewModel

@property (nonatomic, copy) dispatch_block_t opertaionStatusBlock;

@property (nonatomic, assign) ZWBShoppingCarController *cartVC;

@property (nonatomic, strong) NSMutableArray *cartData;
/**
 *  存放店铺选中
 */
@property (nonatomic, strong) NSMutableArray *shopSelectArray;
/**
 *  carbar 观察的属性变化
 */
@property (nonatomic, assign) float allPrices;
/**
 *  carbar 全选的状态
 */
@property (nonatomic, assign) BOOL isSelectAll;

/** 获取数据*/
- (void)getData;
/** 全选*/
- (void)selectAll:(BOOL)isSelect;
/** 选中某一行*/
- (void)rowSelect:(BOOL)isSelect indexPath:(NSIndexPath *)indexPath;
/** 当行改变数量*/
- (void)rowChangeQuantity:(NSInteger)quantity indexPath:(NSIndexPath *)indexPath;

//获取价格
- (float)getAllPrices;


@end
