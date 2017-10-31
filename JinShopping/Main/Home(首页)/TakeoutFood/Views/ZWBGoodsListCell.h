//
//  GoodslistCell.h
//  MeiTuanWaiMai
//
//  Created by maxin on 16/1/6.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWBTakeoutFoodOrderModel.h"

@interface ZWBGoodsListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *namelabel;

@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak, nonatomic) IBOutlet UIButton *subBtn;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (nonatomic, copy) void (^operationBlock)(NSInteger number, BOOL isAdd);

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger number;

@property (nonatomic, strong) ZWBTakeoutFoodOrderModel *model;

@end
