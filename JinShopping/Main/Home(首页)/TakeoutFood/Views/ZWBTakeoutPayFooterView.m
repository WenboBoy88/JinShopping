//
//  ZWBTakeoutPayFooterView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/30.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutPayFooterView.h"

@implementation ZWBTakeoutPayFooterView

#pragma mark - Initinal
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化界面
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = COLOR_MAIN_BG;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"还需在线支付";
    titleLabel.font = PFR_FONT(13.0f);
    titleLabel.textColor = COLOR_666;
    [self addSubview:titleLabel];
    
    UILabel *moneyLabel = [[UILabel alloc] init];
    moneyLabel.text = @"¥ 0";
    moneyLabel.textColor = COLOR_MAIN_RED;
    moneyLabel.font = PFR_FONT(15.0f);
    [self addSubview:moneyLabel];
    self.moneyLabel = moneyLabel;
    
    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [payBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    payBtn.titleLabel.font = PFR_FONT(15.0f);
    [payBtn setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
    payBtn.backgroundColor = COLOR_MAIN_BG;
    [payBtn addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:payBtn];
    self.payBtn = payBtn;
    
    titleLabel.sd_layout
    .leftSpaceToView(self, 12)
    .centerYEqualToView(self)
    .heightIs(18);
    [titleLabel setSingleLineAutoResizeWithMaxWidth:100.0f];
    self.moneyLabel.sd_layout
    .leftSpaceToView(titleLabel, 8)
    .centerYEqualToView(titleLabel)
    .heightIs(21);
    [self.moneyLabel setSingleLineAutoResizeWithMaxWidth:120.0f];
    self.payBtn.sd_layout
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(80.0f);
    
    [self setupAutoHeightWithBottomView:self.payBtn bottomMargin:0];
    [self layoutSubviews];
}


#pragma mark - Button Click
- (void)submitClick:(UIButton *)button {
    
}

#pragma mark - Getter Setter Method

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
