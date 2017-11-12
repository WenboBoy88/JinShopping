//
//  ZWBScrollHeaderView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/18.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBScrollHeaderView.h"
// Vendors

@interface ZWBScrollHeaderView()<SDCycleScrollViewDelegate>

/* 轮播图 */
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation ZWBScrollHeaderView

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化界面
        [self setUpUI];
    }
    return self;
}

#pragma mark - initialize
- (void)setUpUI {
    self.backgroundColor = [UIColor whiteColor];
    
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:IMAGE(@"waimai_banner")];
    self.cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    self.cycleScrollView.autoScrollTimeInterval = 5.0;
    [self addSubview:self.cycleScrollView];
}

#pragma mark - 点击图片Bannar跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"点击了%zd轮播图",index);
    if (self.clickBannerBlock) {
        self.clickBannerBlock(index);
    }
}

#pragma mark - 更新位置布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.cycleScrollView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self);
}

#pragma mark - Setter Getter Methods
- (void)setImageURLArr:(NSArray *)imageURLArr {
    _imageURLArr = imageURLArr;
    
    self.cycleScrollView.imageURLStringsGroup = imageURLArr;
}

- (void)setPlaceHolderImageName:(NSString *)placeHolderImageName {
    _placeHolderImageName = placeHolderImageName;
    
    self.cycleScrollView.placeholderImage = IMAGE(placeHolderImageName);
}

@end
