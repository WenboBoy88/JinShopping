//
//  ZWBIntegralMallItemFooterView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/12.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBIntegralMallItemFooterView.h"

@interface ZWBIntegralMallItemFooterView ()

@property (nonatomic, strong) UIButton *moreBtn;
@end

@implementation ZWBIntegralMallItemFooterView

#pragma mark - Intinal
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - UI
- (void)setupUI {
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.titleLabel.font = PFR_FONT(15.0f);
    [moreBtn setTitle:@"查看更多" forState:UIControlStateNormal];
    [moreBtn setTitleColor:COLOR_MAIN_RED forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreBtn];
    self.moreBtn = moreBtn;
    [ZWBSpeedy zwb_chageControlCircularView:moreBtn cornerRadius:2 borderWidth:1 borderColor:COLOR_MAIN_RED canMasksToBounds:YES];
    moreBtn.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .widthIs(100)
    .heightIs(40);
}

#pragma mark - Button Click
- (void)moreClick:(UIButton *)button {
    if (self.moreButtonClickBlock) {
        self.moreButtonClickBlock(0);
    }
}


@end
