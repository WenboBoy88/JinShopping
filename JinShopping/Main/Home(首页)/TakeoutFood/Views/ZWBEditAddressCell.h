//
//  ZWBEditAddressCell.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/30.
//  Copyright © 2017年 张文博. All rights reserved.
//
// 定位设为默认选择项
#import <UIKit/UIKit.h>

@interface ZWBEditAddressCell : UITableViewCell

@property (nonatomic, strong) UIImageView *selectImageView;
/** 名称*/
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, copy) void (^selectStatusBlock)(BOOL isSelected);

@end
