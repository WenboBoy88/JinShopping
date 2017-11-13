//
//  ZWBCommonHeaderView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/12.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBCommonHeaderView.h"

// Others


@interface ZWBCommonHeaderView ()

@property (nonatomic, strong) UIButton *tempButton;

@property (nonatomic, strong) UIView *indicatorView;

@end

@implementation ZWBCommonHeaderView

#pragma mark - Intinal
-  (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArray {
    if (self = [super initWithFrame:frame]) {
        
        // 通过懒加载方式开始创建界面
        self.titleArr = titleArray;
//        [self setupUIWithTitleArr:titleArray];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
//    return [self initWithFrame:frame titleArr:nil];
    if (self = [super initWithFrame:frame]) {
        
        [self setupUIWithTitleArr:nil];
    }
    return self;
}

#pragma mark - 创建界面
- (void)setupUIWithTitleArr:(NSArray *)titleArr {
    self.backgroundColor = COLOR_WHITE;
    CGFloat width  = SCREEN_WIDTH / titleArr.count;
    CGFloat height = self.zwb_height;
    for (NSInteger i = 0; i < titleArr.count; i++) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        bgView.backgroundColor = COLOR_WHITE;
        [self addSubview:bgView];
        UIButton *button = [ZWBFactory creatButtonWithFrame:CGRectZero bgColor:COLOR_WHITE textColor:COLOR_MAIN_RED target:self sel:@selector(buttonClick:) tag:i+10 image:nil title:titleArr[i]];
        button.titleLabel.font = PFR_FONT(14.0f);
        button.zwb_center = bgView.zwb_center;
        button.zwb_width = 120;
        button.zwb_height = 30;
        [bgView addSubview:button];
    }

    UIView *bgView = self.subviews[0];     // get BgView
    UIButton *button = [bgView.subviews firstObject];    // get Button
    // 默认选中第一个按钮
    [self buttonClick:button];
    
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = COLOR_MAIN_RED;
    indicatorView.zwb_height = 2;
    indicatorView.zwb_top = bgView.zwb_height - indicatorView.zwb_height;
    indicatorView.zwb_width = button.zwb_width;
    indicatorView.zwb_centerX = bgView.zwb_centerX;
    [self addSubview:indicatorView];
    self.indicatorView = indicatorView;
}

#pragma mark - Button Click
- (void)buttonClick:(UIButton *)button {
    // 点击的按钮和上次标记的按钮相同  则直接返回不进行任何的操作 否则则进行相关的操作
    if (self.tempButton == button) {
        return ;
    }
    
    UIView *bgView = button.superview;
    // 选中状态取反
    button.selected = !button.selected;
    [self.tempButton setTitleColor:COLOR_333 forState:UIControlStateNormal];
    [button setTitleColor:COLOR_MAIN_RED     forState:UIControlStateSelected];
    self.tempButton = button;
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.indicatorView.zwb_centerX = bgView.zwb_centerX;
    }];
}

#pragma mark - Getter Setter Methods
- (void)setTitleArr:(NSArray *)titleArr {
    _titleArr = titleArr;
    // 清除已有的视图重新
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    [self setupUIWithTitleArr:titleArr];
}


@end
