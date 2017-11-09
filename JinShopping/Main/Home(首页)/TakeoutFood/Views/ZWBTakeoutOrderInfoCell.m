//
//  ZWBTakeoutOrderInfoCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/30.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutOrderInfoCell.h"

@implementation ZWBTakeoutOrderInfoCell

#pragma mark - Initinal
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    // 给文本框增加边框线
    [ZWBSpeedy zwb_chageControlCircularView:self.desTextField cornerRadius:2 borderWidth:1 borderColor:COLOR_MAIN_BG canMasksToBounds:YES];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
