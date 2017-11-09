//
//  ZWBDetailStoreCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/9.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBDetailStoreCell.h"

@implementation ZWBDetailStoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [ZWBSpeedy zwb_chageControlCircularView:self.callBtn  cornerRadius:5 borderWidth:1 borderColor:COLOR_MAIN_RED canMasksToBounds:YES];
    [ZWBSpeedy zwb_chageControlCircularView:self.enterBtn cornerRadius:5 borderWidth:1 borderColor:COLOR_MAIN_RED canMasksToBounds:YES];
}

#pragma mark - Btn Click
- (IBAction)callClick:(UIButton *)sender {
    
}

- (IBAction)enterStoreClick:(UIButton *)sender {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
