//
//  ZWBDetailFooterView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/9.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBDetailFooterView.h"

@interface ZWBDetailFooterView ()

@end

@implementation ZWBDetailFooterView

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 底部按钮(收藏 购物车 加入购物车 立即购买)
- (void)setupUI {
    
    [self setupLeftTwoButton];//店铺 购物车
    
    [self setupRightTwoButton];//加入购物车 提交订单
}

#pragma mark - 店铺 购物车
- (void)setupLeftTwoButton {
    NSArray *imagesNor = @[@"candai1",@"menu5"];
    CGFloat buttonW = SCREEN_WIDTH * 0.2;
    CGFloat buttonH = 50;
    
    for (NSInteger i = 0; i < imagesNor.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:imagesNor[i]] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonX = (buttonW * i);
        button.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
        
        [self addSubview:button];
    }
}
#pragma mark - 加入购物车 立即购买
- (void)setupRightTwoButton {
    NSArray *titles = @[@"加入购物车",@"提交订单"];
    CGFloat buttonW = SCREEN_WIDTH * 0.6 * 0.5;
    CGFloat buttonH = 50;
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = PFR_FONT(16.0f);
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.tag = i + 2;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.backgroundColor = (i == 0) ? COLOR_MAIN_YELLOW : COLOR_MAIN_RED;
        [button addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonX = SCREEN_WIDTH * 0.4 + (buttonW * i);
        button.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
        
        [self addSubview:button];
    }
}

#pragma mark - Button Click
- (void)bottomButtonClick:(UIButton *)button {
    // 回调Block
    if (self.clickFooterBlock) {
        self.clickFooterBlock(button.tag);
    }
}


@end
