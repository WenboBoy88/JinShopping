//
//  ZWBTakeoutFoodHeaderView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/24.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutFoodHeaderView.h"

@interface ZWBTakeoutFoodHeaderView () {
    
}

@property (nonatomic, strong) UIImageView *bannerImageView;

@property (nonatomic, strong) UILabel *contentLabel;

@end


@implementation ZWBTakeoutFoodHeaderView

#pragma mark - Intial
- (instancetype)init {
    if (self = [super init]) {
        
        // 基础设置
        [self setupBase];
        // 设置界面 banner图
        [self setupUI];
        // 设置Frame
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - initialize
- (void)setupBase {
    self.backgroundColor = COLOR_CLEAR;
    self.width = SCREEN_WIDTH;
    self.userInteractionEnabled = YES;
}

#pragma mark - 创建视图
- (void)setupUI {
    // 外卖Banner
    UIImageView *bannerImageView = [[UIImageView alloc] initWithImage:IMAGE(@"waimai_banner")];
    bannerImageView.backgroundColor = COLOR_CLEAR;
    [self addSubview:bannerImageView];
    self.bannerImageView = bannerImageView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBannerClick:)];
    [self addGestureRecognizer:tap];
}

#pragma mark - 更新Frame
- (void)setupAutoLayout {
    self.bannerImageView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .autoHeightRatio(0.39);
    
    [self setupAutoHeightWithBottomView:self.bannerImageView bottomMargin:0];
    [self layoutSubviews];
}

#pragma mark - Tap Click
- (void)tapBannerClick:(UITapGestureRecognizer *)tap {
    if (self.clickBannerBlock) {
        self.clickBannerBlock();
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}


@end
