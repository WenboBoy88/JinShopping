//
//  GoodslistCell.m
//  MeiTuanWaiMai
//
//  Created by maxin on 16/1/6.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import "ZWBGoodsListCell.h"

@interface ZWBGoodsListCell ()

@end

@implementation ZWBGoodsListCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
    [ZWBSpeedy zwb_setupBezierPathCircularLayerWith:self.addBtn radiusSize:CGSizeMake(12.5, 12.5)];
    [ZWBSpeedy zwb_setupBezierPathCircularLayerWith:self.subBtn radiusSize:CGSizeMake(12.5, 12.5)];
    self.subBtn.layer.borderColor = COLOR_MAIN_COLOR.CGColor;
    self.subBtn.layer.borderWidth = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Getter Setter Methods
- (void)setModel:(ZWBTakeoutFoodOrderModel *)model {
    _model = model;
    
    self.namelabel.text = [NSString stringWithFormat:@"%@",model.name];
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[model.min_price floatValue]];
    self.numberLabel.text = [NSString stringWithFormat:@"%@",model.orderCount];
}

#pragma mark - Button Click
// 减
- (IBAction)subClick:(id)sender {
    self.number =[self.numberLabel.text intValue];
    self.number -=1;
    [self showNumber:self.number];
    self.operationBlock(self.number,NO);
}

// 加
- (IBAction)addClick:(id)sender {
    self.number =[self.numberLabel.text intValue];
    self.number += 1;
    [self showNumber:self.number];
    self.operationBlock(self.number,YES);

}

#pragma mark - 显示个数
- (void)showNumber:(NSUInteger)count {
    self.numberLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.number];
}

@end
