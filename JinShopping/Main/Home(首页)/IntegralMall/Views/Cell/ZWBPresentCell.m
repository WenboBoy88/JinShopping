//
//  ZWBPresentCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/12.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBPresentCell.h"

@implementation ZWBPresentCell

#pragma mark - Initinal
- (void)awakeFromNib {
    [super awakeFromNib];

    self.convertBtn.layer.borderColor  = COLOR_MAIN_RED.CGColor;
    self.convertBtn.layer.borderWidth  = 1;
    self.convertBtn.layer.cornerRadius = 2;

}

#pragma mark - Button Click
- (IBAction)convertClick:(UIButton *)sender {
    if (self.convertBlock) {
        self.convertBlock();
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
