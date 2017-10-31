//
//  ZWBHomeHeaderView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/19.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBHomeHeaderView.h"

@implementation ZWBHomeHeaderView

#pragma mark - Intial
- (instancetype)init {
    if (self = [super init]) {
        
        // 基础设置
        [self setupBase];
        // 设置界面 banner图
        [self setupScrollView];
        // 设置界面的 item图标
        [self setupItemView];
        // 设置位置
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - initialize
- (void)setupBase {
    self.backgroundColor = COLOR_CLEAR;
    self.width = SCREEN_WIDTH;
}

#pragma mark - 创建视图
// banner图
- (void)setupScrollView {
    ZWBScrollHeaderView *scrollHeaderView = [[ZWBScrollHeaderView alloc] init];
    [scrollHeaderView setClickBannerBlock:^(NSInteger clickIndex) {
        
    }];
    self.scrollHeaderView = scrollHeaderView;
    [self addSubview:scrollHeaderView];
    

}
// item图标
- (void)setupItemView {
    ZWBShowItemView *showItemView = [[ZWBShowItemView alloc] init];
    [showItemView setClickItemBlock:^(NSInteger index, NSInteger tag) {
        
    }];
    self.showItemView = showItemView;
    [self addSubview:showItemView];

}
#pragma mark - 更新Frame
- (void)setupAutoLayout {
    self.scrollHeaderView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .autoHeightRatio(0.39);
    self.showItemView.sd_layout
    .topSpaceToView(self.scrollHeaderView, 0)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(170);
    
    [self setupAutoHeightWithBottomView:self.showItemView bottomMargin:0];
    [self layoutSubviews];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
