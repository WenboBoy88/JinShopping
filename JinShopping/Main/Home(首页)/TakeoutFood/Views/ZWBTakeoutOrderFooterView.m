//
//  ZWBTakeoutOrderFooterView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/30.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutOrderFooterView.h"

@implementation ZWBTakeoutOrderFooterView


#pragma mark - Initinal
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化界面
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.width = SCREEN_WIDTH;
    self.backgroundColor = COLOR_MAIN_BG;
    
    UILabel *dispatchTitleLabel = [[UILabel alloc] init];
    dispatchTitleLabel.text = @"配送费用:";
    dispatchTitleLabel.font = PFR_FONT(12.0f);
    dispatchTitleLabel.textColor = COLOR_WHITE;
    [self addSubview:dispatchTitleLabel];
    UILabel *dispatchPriceLabel = [[UILabel alloc] init];
    dispatchPriceLabel.text = @"¥ 0";
    dispatchPriceLabel.textColor = COLOR_WHITE;
    dispatchPriceLabel.font = PFR_FONT(12.0f);
    [self addSubview:dispatchPriceLabel];
    self.dispatchPriceLabel = dispatchPriceLabel;
    
    UILabel *countTitleLabel = [[UILabel alloc] init];
    countTitleLabel.text = @"商品总计:";
    countTitleLabel.font = PFR_FONT(12.0f);
    countTitleLabel.textColor = COLOR_WHITE;
    [self addSubview:countTitleLabel];
    UILabel *totalCountLabel = [[UILabel alloc] init];
    totalCountLabel.text = @"¥ 0/8份";
    totalCountLabel.textColor = COLOR_WHITE;
    totalCountLabel.font = PFR_FONT(12.0f);
    [self addSubview:totalCountLabel];
    self.totalCountLabel = totalCountLabel;

    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [payBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    payBtn.titleLabel.font = PFR_FONT(15.0f);
    [payBtn setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
    payBtn.backgroundColor = COLOR_MAIN_BG;
    [payBtn addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:payBtn];
    
    dispatchTitleLabel.sd_layout
    .topSpaceToView(self, 12)
    .leftSpaceToView(self, 10)
    .heightIs(15);
    [dispatchTitleLabel setSingleLineAutoResizeWithMaxWidth:80.0f];
    self.dispatchPriceLabel.sd_layout
    .leftSpaceToView(dispatchTitleLabel, 2)
    .topEqualToView(dispatchTitleLabel)
    .bottomEqualToView(dispatchTitleLabel)
    .widthIs(120.0f);

    countTitleLabel.sd_layout
    .topSpaceToView(dispatchTitleLabel, 1)
    .leftSpaceToView(self, 10)
    .widthRatioToView(dispatchTitleLabel, 1.0)
    .heightIs(15);
    self.totalCountLabel.sd_layout
    .leftSpaceToView(dispatchTitleLabel, 2)
    .topEqualToView(countTitleLabel)
    .bottomEqualToView(countTitleLabel)
    .widthIs(140.0f);

    payBtn.sd_layout
    .topEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(90.0f);
    
    [self setupAutoHeightWithBottomView:payBtn bottomMargin:0];
    [self layoutSubviews];
}

#pragma mark - Button Click
- (void)submitClick:(UIButton *)button {
    
}

#pragma mark - Getter Setter Methods

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
