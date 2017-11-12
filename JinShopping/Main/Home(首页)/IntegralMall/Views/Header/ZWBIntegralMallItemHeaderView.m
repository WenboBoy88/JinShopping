//
//  ZWBIntegralMallItemHeaderView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/12.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBIntegralMallItemHeaderView.h"

@interface ZWBIntegralMallItemHeaderView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end


@implementation ZWBIntegralMallItemHeaderView

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化界面
        [self setupUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)setupUI {
    // 滑动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = COLOR_WHITE;
    [self addSubview:scrollView];
    self.scrollView = scrollView;
}


@end
