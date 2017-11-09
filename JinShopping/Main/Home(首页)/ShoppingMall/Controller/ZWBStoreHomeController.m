//
//  ZWBStoreHomeController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/9.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBStoreHomeController.h"

// Views
#import "ZWBStoreHeaderView.h"

@interface ZWBStoreHomeController ()

@property (nonatomic, strong) UIScrollView *scrollView;
/** 头部*/
@property (nonatomic, strong) ZWBStoreHeaderView *headerView;
/* 搜索 */
@property (nonatomic, strong) UIButton *searchBtn;

@end

@implementation ZWBStoreHomeController

#pragma mark - Init
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
    
    [self setupUI];
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
    ZWBStoreHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"ZWBStoreHeaderView" owner:nil options:nil] firstObject];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120);
    self.headerView = headerView;
    
    
}

#pragma mark - Button Click
// 搜索
- (void)searchClick:(UIButton *)button {
    
}

#pragma mark - Lazy load


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
