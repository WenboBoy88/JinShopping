//
//  ZWBStoreHomeController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/9.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBStoreHomeController.h"

// Controller
#import "ZWBStoreGoodsController.h"
#import "ZWBStoreCommentController.h"
#import "ZWBTakeoutStoreInfoController.h"

// Views
#import "ZWBStoreHeaderView.h"

@interface ZWBStoreHomeController ()<UIScrollViewDelegate>

/** 底视图ScrollView*/
@property (nonatomic, strong) UIScrollView *bgScrollerView;
/** 存放内容的ScrollView*/
@property (nonatomic, strong) UIScrollView *scrollerView;
/** 头部*/
@property (nonatomic, strong) ZWBStoreHeaderView *headerView;
/* 搜索 */
@property (nonatomic, strong) UIButton *searchBtn;
/** 操作按钮*/
@property (nonatomic, strong) UIView *buttonView;
/** 记录上一次选中的Button */
@property (nonatomic, weak) UIButton *selectBtn;
/* 标题按钮地下的指示器 */
@property (nonatomic, weak) UIView *indicatorView;

@end

@implementation ZWBStoreHomeController

#pragma mark - Init
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
    // 初始化界面
    [self setupUI];
    // 创建按钮
    [self setupOperationButtonView];
    // 添加子控制器
    [self setupChildViewControllers];
    // 加载视图
    [self addChildViewController];
}

#pragma mark - 初始化
- (void)setupNav {
    self.navigationItem.title = @"店铺首页";
    
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.searchBtn.frame = CGRectMake(0, 0, 40, 40);
    [self.searchBtn setImage:[UIImage imageNamed:@"waimai_search"] forState:UIControlStateNormal];
    [self.searchBtn addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.searchBtn];
}

#pragma mark - 创建界面
- (void)setupUI {
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    ZWBStoreHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"ZWBStoreHeaderView" owner:nil options:nil] firstObject];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
    self.headerView = headerView;
    [self.bgScrollerView addSubview:headerView];

}

#pragma mark - 创建按钮ButtonView
- (void)setupOperationButtonView {
    NSArray *titles = @[@"全部商品",@"评价",@"商家详情"];
    NSArray *normalImages = @[@"candai1", @"candai2", @"candai3"];
    NSArray *selectImages = @[@"candai1_hover", @"candai2_hover", @"candai3_hover"];

    self.buttonView = [[UIView alloc] init];
    self.buttonView.backgroundColor = COLOR_WHITE;
    self.buttonView.zwb_left = 0;
    self.buttonView.zwb_top = self.headerView.zwb_bottom;
    self.buttonView.zwb_width = SCREEN_WIDTH;
    self.buttonView.zwb_height = 50;
    [self.bgScrollerView addSubview:self.buttonView];
    CGFloat buttonW = self.buttonView.zwb_width / 3;
    CGFloat buttonH = self.buttonView.zwb_height;
    CGFloat buttonY = 0;

    for (NSInteger i = 0; i < titles.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:0];
        [button setImage:IMAGE(normalImages[i]) forState:UIControlStateNormal];
        [button setImage:IMAGE(selectImages[i]) forState:UIControlStateSelected];
        [button setTitleColor:COLOR_333 forState:UIControlStateNormal];
        [button setTitleColor:COLOR_MAIN_COLOR forState:UIControlStateSelected];
        button.tag = i;
        button.titleLabel.font = PFR_FONT(12.0f);
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button addTarget:self action:@selector(opeationClick:) forControlEvents:UIControlEventTouchUpInside];
        CGFloat buttonX = i * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.imageView.sd_layout
        .topSpaceToView(button, 8)
        .centerXEqualToView(button)
        .widthIs(26)
        .heightIs(18);
        button.titleLabel.sd_layout
        .topSpaceToView(button.imageView, 5)
        .bottomSpaceToView(button, 8)
        .centerXEqualToView(button)
        .widthIs(60);

        [self.buttonView addSubview:button];
    }
    
    UIButton *firstButton = self.buttonView.subviews[0];
    [self opeationClick:firstButton]; //默认选择第一个
    // 下划线
    UIView *indicatorView = [[UIView alloc]init];
    self.indicatorView = indicatorView;
    indicatorView.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    indicatorView.zwb_height = 1.5;
    indicatorView.zwb_top = self.buttonView.zwb_height - indicatorView.zwb_height;
    [firstButton.titleLabel sizeToFit];
    indicatorView.zwb_width = firstButton.zwb_width;
    indicatorView.zwb_centerX = firstButton.zwb_centerX;
    [self.buttonView addSubview:indicatorView];
    
    // 头视图 + 按钮  = 160
    self.bgScrollerView.contentSize = CGSizeMake(self.view.zwb_width, self.view.zwb_height + 100);
}

#pragma mark - 操作按钮 点击事件
- (void)opeationClick:(UIButton *)button {
    if (self.selectBtn == button) {
        return ;
    }
    self.selectBtn.selected = !self.selectBtn.selected;
    button.selected = !button.selected;
    self.selectBtn = button;
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.indicatorView.zwb_width = button.zwb_width;
        weakSelf.indicatorView.zwb_centerX = button.zwb_centerX;
    }];
    
    CGPoint offset = self.scrollerView.contentOffset;
    offset.x = self.scrollerView.zwb_width * button.tag;
    [self.scrollerView setContentOffset:offset animated:YES];
}

#pragma mark - 添加子控制器
- (void)setupChildViewControllers {
    ZWBStoreGoodsController *storeParticularsVc = [[ZWBStoreGoodsController alloc] init];
    [self addChildViewController:storeParticularsVc];
    
    ZWBStoreGoodsController *storeCommentVc = [[ZWBStoreGoodsController alloc] init];
    [self addChildViewController:storeCommentVc];

    ZWBTakeoutStoreInfoController *storeInfoVc = [[ZWBTakeoutStoreInfoController alloc] init];
    [self addChildViewController:storeInfoVc];

    // 设置偏移量
    self.scrollerView.contentSize = CGSizeMake(self.view.zwb_width * self.childViewControllers.count, 0);
}

#pragma mark - Button Click
// 搜索
- (void)searchClick:(UIButton *)button {
    
}

#pragma mark - 添加子控制器View
- (void)addChildViewController {
    NSInteger index = self.scrollerView.contentOffset.x / self.scrollerView.zwb_width;
    UIViewController *childVc = self.childViewControllers[index];
    
    if (childVc.view.superview) return; //判断添加就不用再添加了
    childVc.view.frame = CGRectMake(index * self.scrollerView.zwb_width, 0, self.scrollerView.zwb_width, self.scrollerView.zwb_height);
    [self.scrollerView addSubview:childVc.view];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    [self addChildViewController];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.zwb_width;
    UIButton *button = self.buttonView.subviews[index];
    
    [self opeationClick:button];
    
    [self addChildViewController];
}



#pragma mark - Lazy Load
- (UIScrollView *)scrollerView {
    if (!_scrollerView) {
        _scrollerView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        _scrollerView.backgroundColor = COLOR_MAIN_BG;
        _scrollerView.frame = CGRectMake(0, self.buttonView.zwb_bottom, SCREEN_WIDTH, SCREEN_HEIGHT - self.headerView.zwb_bottom);
        _scrollerView.showsVerticalScrollIndicator = NO;
        _scrollerView.showsHorizontalScrollIndicator = NO;
        _scrollerView.pagingEnabled = YES;
        _scrollerView.delegate = self;
        // 存放控制器的ScrollView
        [self.bgScrollerView addSubview:_scrollerView];
    }
    return _scrollerView;
}

- (UIScrollView *)bgScrollerView {
    if (!_bgScrollerView) {
        _bgScrollerView = [[UIScrollView alloc] init];
        _bgScrollerView.frame = self.view.bounds;
        _bgScrollerView.backgroundColor = COLOR_MAIN_BG;
        _bgScrollerView.showsVerticalScrollIndicator = NO;
        _bgScrollerView.showsHorizontalScrollIndicator = NO;
        _bgScrollerView.bounces = NO;
        [self.view addSubview:_bgScrollerView];
    }
    return _bgScrollerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
