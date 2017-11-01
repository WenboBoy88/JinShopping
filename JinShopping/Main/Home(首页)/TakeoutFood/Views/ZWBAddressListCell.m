//
//  ZWBAddressListCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/30.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBAddressListCell.h"

@implementation ZWBAddressListCell

#pragma mark - Initinal
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [ZWBSpeedy zwb_setupBezierPathCircularLayerWith:self.signLabel radiusSize:CGSizeMake(2, 2)];
}


#pragma mark - Getter Setter Methods
- (void)setModel:(ZWBAddressModel *)model {
    _model = model;
    
    
}

#pragma mark - Button Click
- (IBAction)editClick:(UIButton *)sender {
    
}

- (IBAction)delClick:(UIButton *)sender {
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
