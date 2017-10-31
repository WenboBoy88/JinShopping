//
//  ZWBTakeoutFoodShopCell.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWBTakeoutFoodOrderModel.h"

@interface ZWBTakeoutFoodShopCell : UITableViewCell
/** 商品图片*/
@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
/** 认证标签*/
@property (weak, nonatomic) IBOutlet UILabel *authenLabel;
/** 商品名称*/
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
/** 商品销售个数*/
@property (weak, nonatomic) IBOutlet UILabel *goodsSaleCount;
/** 商品评价*/
@property (weak, nonatomic) IBOutlet UILabel *goodsEval;
/** 商品价格*/
@property (weak, nonatomic) IBOutlet UILabel *goodsPrice;
/** 商品个数*/
@property (weak, nonatomic) IBOutlet UILabel *goodsNumber;
/** ➕*/
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
/** ➖*/
@property (weak, nonatomic) IBOutlet UIButton *subBtn;

/** 订单的Model*/
@property (nonatomic, strong) ZWBTakeoutFoodOrderModel *orderModel;

@property (assign, nonatomic) NSInteger orderId;

@property (assign, nonatomic) NSUInteger number;

//增加减少订单数量 需不需要动画效果
@property (copy, nonatomic) void(^plusBlock)(NSInteger count,BOOL animated);

@end
