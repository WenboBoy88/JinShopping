//
//  ZWBMineWalletCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/19.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBMineWalletCell.h"

@interface ZWBMineWalletCell()

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *integralLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;

@end

@implementation ZWBMineWalletCell

#pragma mark - Initial
- (void)awakeFromNib {
    [super awakeFromNib];

    
}


#pragma mark - Initialize


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
