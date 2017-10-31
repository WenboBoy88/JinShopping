//
//  ZWBShowItemView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/18.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShowItemView.h"

@interface ZWBShowItemView()<UIScrollViewDelegate> {
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}
/** 标题的数组*/
@property (nonatomic, strong) NSArray *titlesArr;
/** 图片数组*/
@property (nonatomic, strong) NSArray *imagesArr;
/** tag值数组*/
@property (nonatomic, strong) NSArray *tagsArr;

@end

@implementation ZWBShowItemView

- (instancetype)init {
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170)]) {
        
        [self setupBase];
        
        [self creatUIView];

    }
    return self;
}

#pragma mark - initialize
- (void)setupBase {
    
    self.backgroundColor = COLOR_WHITE;
    // 初始化图标的个数
    self.showCount = self.titlesArr.count;
}

#pragma mark - 创建UI
- (void)creatUIView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, 155)];
    scrollView.backgroundColor = COLOR_WHITE;
    scrollView.delegate = self;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    [self addSubview:scrollView];
    _scrollView = scrollView;

    NSInteger pageCount = (self.showCount - 1) / 10 + 1;
    scrollView.contentSize = CGSizeMake(self.width * pageCount, scrollView.zwb_height);
    //指定位置
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    CGSize pageControlSize = CGSizeMake(20, 15);
    pageControl.size = pageControlSize;
//    pageControl.hidden = pageCount > 1 ? NO : YES;
    pageControl.center = CGPointMake(self.width / 2, 155);
    pageControl.numberOfPages = pageCount;//指定页面个数
    pageControl.currentPage = 0;//指定pagecontroll的值，默认选中的小白点（第一个）
    pageControl.pageIndicatorTintColor = COLOR_MAIN_BG;
    pageControl.currentPageIndicatorTintColor = COLOR_MAIN_COLOR;
    [self addSubview:pageControl];
    _pageControl = pageControl;
    
    
    CGFloat width = (self.width - Padding * 6) / 5;
    CGFloat height = 60;
//    width = width > height ? width : height;
    for (NSInteger i = 0; i < self.showCount; i++) {
        NSInteger currentPage = i / 10;
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(currentPage * self.width + Padding + (i % 5) * (width + Padding),  Padding + (i - 10 * currentPage) / 5 * (height + Padding), width, height)];
        contentView.backgroundColor = COLOR_WHITE;
        [scrollView addSubview:contentView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGSize buttonSize = CGSizeMake(40, 40);
        button.size = buttonSize;
        button.center = CGPointMake(width / 2, 22);
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [button setImage:IMAGE(self.imagesArr[i]) forState:UIControlStateNormal];
        button.tag = [self.tagsArr[i] integerValue];
        [button addTarget:self action:@selector(buttonClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:button];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, button.bottom, width, 20)];
        titleLabel.text = self.titlesArr[i];
        titleLabel.font = FONT_SYSTEM(13.0f);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = COLOR_333;
        [contentView addSubview:titleLabel];
    }
}


#pragma mark - Setter Getter Methods
- (void)setShowCount:(NSInteger)showCount {
    _showCount = showCount;
    
    _showCount = self.titlesArr.count;
}

- (NSInteger)getButtonIndexByTag:(NSInteger)buttonTag {
    
    return [self.tagsArr indexOfObject:@(buttonTag)];
}

#pragma mark - Action
- (void)buttonClickHandler:(UIButton *)button {
    if (self.clickItemBlock) {
        NSInteger clickIndex = [self getButtonIndexByTag:button.tag];
        self.clickItemBlock(clickIndex, button.tag);
    }
}


#pragma mark - Lazy load
- (NSArray *)titlesArr {
    if (!_titlesArr) {
        _titlesArr = [NSArray arrayWithObjects:
                      @"快店", @"商城", @"餐饮", @"积分商城", @"预约",
                      @"优惠券", @"交友约会", @"酒店", @"身边微店", @"生活缴费", nil];
    }
    return _titlesArr;
}

- (NSArray *)imagesArr {
    if (!_imagesArr) {
        _imagesArr = [NSArray arrayWithObjects:
                      @"nav1", @"nav2", @"nav3", @"nav4", @"nav5",
                      @"nav6", @"nav7", @"nav8", @"nav9", @"nav10", nil];
    }
    return _imagesArr;
}

- (NSArray *)tagsArr {
    if (!_tagsArr) {
        _tagsArr = [NSArray arrayWithObjects:
                @(Home_FastStore), @(Home_ShoppingMall), @(Home_FoodIndustry),
                @(Home_IntegralMall), @(Home_Bespeak), @(Home_Coupon),
                @(Home_Dating), @(Home_WineShop), @(Home_NearbyShop),
                @(Home_LifePayment),nil];
    }
    return _tagsArr;
}

#pragma mark - UIScrollViewDelegate
//pagecontroll的委托方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    //    NSLog(@"%d", page);
    
    // 设置页码
    _pageControl.currentPage = page;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
