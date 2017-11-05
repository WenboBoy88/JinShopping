//
//  ZWBAddressListCell.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/30.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWBAddressModel.h"

@interface ZWBAddressListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *selectImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *provinceLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;

@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;

@property (nonatomic, strong) ZWBAddressModel *model;

@end
