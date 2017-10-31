//
//  ZWBTakeoutFoodShopCarViewModel.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWBTakeoutFoodOrderModel.h"

@interface ZWBTakeoutFoodShopCarViewModel : NSObject

#pragma mark - 初始化
+ (void)getShopData:(void(^)(NSMutableArray *array))shopDataBlock;

#pragma mark - 计算价格
+ (double)getTotalPrice:(NSMutableArray *)dataArray;

#pragma mark - 计算订单数据
+ (NSMutableArray *)addOrderModel:(ZWBTakeoutFoodOrderModel *)orderModel orderData:(NSMutableArray *)orderArray isAdded:(BOOL)isAdded;

#pragma  mark - 计算数量
+ (NSInteger)countOthersWithOrderData:(NSMutableArray *)ordersArray;

#pragma mark - 更新显示数据
+ (NSMutableArray *)updateArray:(NSMutableArray *)dataArray atSelectDictionary:(ZWBTakeoutFoodOrderModel *)orderModel;



@end
