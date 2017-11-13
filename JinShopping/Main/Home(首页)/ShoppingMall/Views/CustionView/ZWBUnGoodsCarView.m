//
//  ZWBUnGoodsCarView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBUnGoodsCarView.h"

@interface ZWBUnGoodsCarView ()



@end

@implementation ZWBUnGoodsCarView

#pragma mark - Initinal
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - UI
- (void)setupUI {
    self.backgroundColor = COLOR_MAIN_BG;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:IMAGE(@"gouwuche_null@")];
    [self addSubview:imageView];
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"购物车快饿瘪了!";
    titleLabel.textColor = COLOR_333;
    titleLabel.font = PFR_FONT(14.0f);
    [self addSubview:titleLabel];
    UILabel *subLabel = [ZWBFactory creatLabelWithFrame:CGRectZero text:@"主人给我挑点东西吃吧!" textColor:COLOR_666 font:12.0f];
    subLabel.font = PFR_FONT(12.0f);
    [self addSubview:subLabel];
    UIButton *shoppingBtn = [ZWBFactory creatButtonWithFrame:CGRectZero bgColor:COLOR_MAIN_RED textColor:COLOR_WHITE target:self sel:@selector(shoppingMallClick:) tag:0 image:nil title:@"逛一逛"];
    shoppingBtn.titleLabel.font = PFR_FONT(14.0f);
    [self addSubview:shoppingBtn];
    
    imageView.sd_layout
    .topSpaceToView(self, 8)
    .centerXEqualToView(self)
    .widthRatioToView(self, 0.6)
    .heightEqualToWidth();
    titleLabel.sd_layout
    .topSpaceToView(imageView, 8)
    .centerXEqualToView(self)
    .widthRatioToView(self, 0.8)
    .heightIs(21);
    subLabel.sd_layout
    .topSpaceToView(titleLabel, 2)
    .centerXEqualToView(self)
    .widthRatioToView(self, 0.8)
    .heightIs(16.0f);
    shoppingBtn.sd_layout
    .topSpaceToView(subLabel, 10)
    .centerXEqualToView(self)
    .widthIs(80)
    .heightIs(30);
    
    [self setupAutoHeightWithBottomView:shoppingBtn bottomMargin:10];
    [self updateLayout];
}

#pragma mark - Button Click
- (void)shoppingMallClick:(UIButton *)button {
    
}



@end
