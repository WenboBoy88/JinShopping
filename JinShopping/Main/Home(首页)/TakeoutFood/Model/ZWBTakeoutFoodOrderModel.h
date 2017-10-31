//
//  ZWBTakeoutFoodOrderModel.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseModel.h"

@interface ZWBTakeoutFoodOrderModel : ZWBBaseModel

@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *min_price;
@property (nonatomic, copy) NSNumber *praise_num;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *month_saled;
@property (nonatomic, copy) NSNumber *orderCount;


@end
