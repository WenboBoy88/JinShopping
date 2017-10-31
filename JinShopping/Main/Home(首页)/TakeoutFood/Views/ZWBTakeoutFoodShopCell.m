//
//  ZWBTakeoutFoodShopCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutFoodShopCell.h"

@implementation ZWBTakeoutFoodShopCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self setupBase];
}

#pragma mark - Initinal
- (void)setupBase {
    
    self.number = 0;

    self.goodsImage.layer.cornerRadius = 5;
    self.goodsImage.layer.masksToBounds = YES;
    self.goodsImage.contentMode = UIViewContentModeScaleAspectFill;
//    [self.subBtn setHidden:YES];
//    [self.goodsNumber setHidden:YES];
//    [self bringSubviewToFront:self.goodsImage];
    
    [ZWBSpeedy zwb_setupBezierPathCircularLayerWith:self.addBtn radiusSize:CGSizeMake(12.5, 12.5)];
    [ZWBSpeedy zwb_chageControlCircularWith:self.subBtn cornerRadius:12.5 borderWidth:1 borderColor:COLOR_MAIN_COLOR canMasksToBounds:YES];
}

#pragma mark - Getter Setter Methods
- (void)setOrderModel:(ZWBTakeoutFoodOrderModel *)orderModel {
    _orderModel = orderModel;
    self.goodsImage.image = IMAGE(orderModel.picture);
    self.goodsName.text   = [NSString stringWithFormat:@"%@",orderModel.name];
    self.goodsPrice.text  = [NSString stringWithFormat:@"¥ %.2f",[orderModel.min_price floatValue]];
    self.goodsNumber.text = [NSString stringWithFormat:@"%@",orderModel.orderCount];
    if ([orderModel.orderCount intValue] > 0) {
        [self.subBtn setHidden:NO];
        [self.goodsNumber setHidden:NO];
    } else {
        [self.subBtn setHidden:YES];
        [self.goodsNumber setHidden:YES];
    }

}

#pragma mark - Btn Click
- (IBAction)addClick:(UIButton *)sender {
    self.number =[self.goodsNumber.text intValue];
    self.number +=1;
    if (self.plusBlock) {
        self.plusBlock(self.number,YES);
    }
    [self showOrderNumbers:self.number];
}

- (IBAction)subClick:(UIButton *)sender {
    self.number =[self.goodsNumber.text intValue];
    self.number -=1;
    if (self.plusBlock) {
        self.plusBlock(self.number,NO);
    }
    [self showOrderNumbers:self.number];

}

#pragma mark - 显示商品个数
- (void)showOrderNumbers:(NSUInteger)count {
    self.goodsNumber.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.number];
    if (self.number > 0) {
        [self.subBtn setHidden:NO];
        [self.goodsNumber setHidden:NO];
    } else {
        [self.subBtn setHidden:YES];
        [self.goodsNumber setHidden:YES];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
