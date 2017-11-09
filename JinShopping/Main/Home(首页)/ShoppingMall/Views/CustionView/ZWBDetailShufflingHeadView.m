//
//  ZWBDetailShufflingHeadView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/9.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBDetailShufflingHeadView.h"
// Vendors
#import "SDCycleScrollView.h"


@interface ZWBDetailShufflingHeadView ()<SDCycleScrollViewDelegate>

/* 轮播图 */
@property (strong, nonatomic) SDCycleScrollView *cycleScrollView;
/* 返回*/
@property (strong, nonatomic) UIButton *backBtn;

@end

@implementation ZWBDetailShufflingHeadView

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
    
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.zwb_height) delegate:self placeholderImage:IMAGE(@"")];
    self.cycleScrollView.autoScroll = NO; // 不自动滚动
    [self addSubview:self.cycleScrollView];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:IMAGE(@"login_fanhui") forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(12, 12, 30, 30);
    backBtn.layer.cornerRadius = 15;
    backBtn.layer.masksToBounds = YES;
    [self addSubview:backBtn];
    
//    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:IMAGE(@"")];
//    self.cycleScrollView.autoScroll = NO; // 不自动滚动
//    [self addSubview:self.cycleScrollView];
//    self.cycleScrollView.sd_layout
//    .topEqualToView(self)
//    .leftEqualToView(self)
//    .rightEqualToView(self)
//    .heightIs(200.0f);

    [self setupAutoHeightWithBottomView:self.cycleScrollView bottomMargin:0];
    [self updateLayout];
}

#pragma mark - 点击事件
- (void)backClick:(UIButton *)button {
    if (self.backBlock) {
        self.backBlock();
    }
}

#pragma mark - 点击图片Bannar跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"点击了%zd轮播图",index);
}

#pragma mark - Setter Getter Methods
- (void)setShufflingArray:(NSArray *)shufflingArray {
    _shufflingArray = shufflingArray;
    self.cycleScrollView.imageURLStringsGroup = shufflingArray;
}

@end
