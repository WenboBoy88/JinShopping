//
//  ZWBIntegralMallHeaderView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/12.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBIntegralMallHeaderView.h"

// Views
#import "ZWBScrollHeaderView.h"

@interface ZWBIntegralMallHeaderView ()

@property (nonatomic, strong) ZWBScrollHeaderView *bannerView;

@end

@implementation ZWBIntegralMallHeaderView

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    
    ZWBScrollHeaderView *bannerView = [[ZWBScrollHeaderView alloc] init];
    bannerView.placeHolderImageName = @"";
    [bannerView setClickBannerBlock:^(NSInteger clickIndex) {
        
    }];
    self.bannerView = bannerView;
    [self addSubview:bannerView];
}

- (void)setupAutoLayout {
    self.bannerView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self);
    
    [self setupAutoHeightWithBottomView:self.bannerView bottomMargin:0];
    [self layoutSubviews];
    
}

@end
