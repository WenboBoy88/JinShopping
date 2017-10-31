//
//  ZWBTakeoutOrderLocationCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/30.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutOrderLocationCell.h"

@implementation ZWBTakeoutOrderLocationCell

#pragma mark - Initinal
- (void)awakeFromNib {
    [super awakeFromNib];

    [UILabel changeLineSpaceForLabel:self.addressLabel withSpace:5.0f];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
