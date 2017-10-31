//
//  ZWBTakeoutFoodStoreCell.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/24.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWBStarView.h"
#import "ZWBTakeoutFoodOrderModel.h"

@interface ZWBTakeoutFoodStoreCell : UITableViewCell
/** 显示图片*/
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
/** 标题*/
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/** 星级View*/
@property (weak, nonatomic) IBOutlet ZWBStarView *starView;
/** 距离Label*/
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
/** 配送时间*/
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/** 售卖单数*/
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
/** 配送费用*/
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
/** 标签*/
@property (weak, nonatomic) IBOutlet UILabel *markLabel;
/** 优惠标签*/
@property (weak, nonatomic) IBOutlet UIImageView *tagImageView;
/** 优惠内容*/
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;

@property (nonatomic, strong) ZWBTakeoutFoodOrderModel *model;

@end
