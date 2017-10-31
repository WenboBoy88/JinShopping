//
//  ZWBTakeoutFoodShopCarViewModel.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutFoodShopCarViewModel.h"

@implementation ZWBTakeoutFoodShopCarViewModel

#pragma mark - 初始化
+ (void)getShopData:(void(^)(NSMutableArray *array))shopDataBlock {
    /**
     *  在这个方法里面请求数据，处理回调
     */
    
    
    NSMutableArray *array = [NSMutableArray new];
    
    NSDictionary *dic1 = @{@"id": @9323283,
                           @"name": @"马可波罗意面",
                           @"min_price": @12.0,
                           @"praise_num": @20,
                           @"picture":@"1.png",
                           @"month_saled":@12};
    
    NSDictionary *dic2 = @{@"id": @9323284,
                           @"name": @"鲜珍焗面",
                           @"min_price": @28.0,
                           @"praise_num": @6,
                           @"picture":@"2.png",
                           @"month_saled":@34};
    
    NSDictionary *dic3 = @{@"id": @9323285,
                           @"name": @"经典焗面",
                           @"min_price": @28.0,
                           @"praise_num": @8,
                           @"picture":@"3.png",
                           @"month_saled":@16};
    
    NSDictionary *dic4 = @{@"id": @26844943,
                           @"name": @"摩洛哥烤肉焗饭",
                           @"min_price": @32.0,
                           @"praise_num": @1,
                           @"picture":@"4.png",
                           @"month_saled":@56};
    
    NSDictionary *dic5 = @{@"id": @9323279,
                           @"name": @"莎莎鸡肉饭",
                           @"min_price": @29.0,
                           @"praise_num": @11,
                           @"picture":@"5.png",
                           @"month_saled":@11};
    
    NSDictionary *dic6 = @{@"id": @9323289,
                           @"name": @"曼哈顿海鲜巧达汤",
                           @"min_price": @22.0,
                           @"praise_num": @2,
                           @"picture":@"6.png",
                           @"month_saled":@5};
    
    NSDictionary *dic7 = @{@"id": @9323243,
                           @"name": @"意式香辣12寸传统",
                           @"min_price": @72.0,
                           @"praise_num": @0,
                           @"picture":@"7.png",
                           @"month_saled":@19};
    
    NSDictionary *dic8 = @{@"id": @9323220,
                           @"name": @"超级棒约翰9寸卷边",
                           @"min_price": @64.0,
                           @"praise_num": @28,
                           @"picture":@"8.png",
                           @"month_saled":@7};
    
    NSDictionary *dic9 = @{@"id": @9323280,
                           @"name": @"牛肉培根焗饭",
                           @"min_price": @30.0,
                           @"praise_num": @48,
                           @"picture":@"9.png",
                           @"month_saled":@0};
    
    NSDictionary *dic10 = @{@"id": @9323267,
                            @"name": @"胡椒薯格",
                            @"min_price": @16.0,
                            @"praise_num": @9,
                            @"picture":@"10.png",
                            @"month_saled":@136};
    
    [array addObjectsFromArray:@[dic1, dic2, dic3, dic4, dic5,
                                 dic6, dic7, dic8, dic9, dic10]];
    shopDataBlock(array);
}

#pragma mark - 计算价格
+ (double)getTotalPrice:(NSMutableArray *)dataArray {
    double nTotal = 0;
    for (ZWBTakeoutFoodOrderModel *model in dataArray) {
        if (model.orderCount != 0 || model.orderCount) {
            nTotal += model.orderCount.integerValue * model.min_price.floatValue;
        }
    }
    return nTotal;
}

#pragma mark - 计算订单数据
+ (NSMutableArray *)addOrderModel:(ZWBTakeoutFoodOrderModel *)orderModel orderData:(NSMutableArray *)orderArray isAdded:(BOOL)isAdded {
    if (isAdded) {
        if (orderArray.count != 0) {
            BOOL flage = YES; // 设置个标记
            // 先循环查找订单数组中是否存在orderModel 存在修改其值 并直接返回
            for (ZWBTakeoutFoodOrderModel *model in orderArray) {
                if (model.orderId == orderModel.orderId){
                    
                    flage = NO;
                    break;
                }
            }
            if (flage) { // 如果不存在则直接添加
                [orderArray addObject:orderModel];
            }
        } else {
            [orderArray addObject:orderModel];
        }
        
    } else{
        
        for (int i = 0; i < orderArray.count; i++) {
            
            ZWBTakeoutFoodOrderModel *model = orderArray[i];
            
            if (model.orderId == orderModel.orderId){
                
                if ([orderModel.orderCount integerValue] == 0) {
                    [orderArray removeObjectAtIndex:i];
                    break;
                }
                
                if ([model.orderCount integerValue] == 0){
                    [orderArray removeObjectAtIndex:i];
                } else {
                    model.orderCount = orderModel.orderCount;
                    
//                    [dic setValue:[NSString stringWithFormat:@"%@", dict[@"orderCount"]] forKey:@"orderCount"];
                }
                break;
            }
        }
    }
    return orderArray;
}

#pragma  mark - 计算数量
+ (NSInteger)countOthersWithOrderData:(NSMutableArray *)ordersArray {
    NSInteger count = 0;
    for (ZWBTakeoutFoodOrderModel *model in ordersArray) {
        count += [model.orderCount integerValue];
    }
    return count;
}

#pragma mark - 更新显示数据
+ (NSMutableArray *)updateArray:(NSMutableArray *)dataArray atSelectDictionary:(ZWBTakeoutFoodOrderModel *)orderModel {
    for (ZWBTakeoutFoodOrderModel *model in dataArray) {
        if ([model.orderId isEqualToString:orderModel.orderId]) {
            model.orderCount = orderModel.orderCount;
        }
    }
    return dataArray;
}
@end
