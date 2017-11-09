//
//  ZWBShoppingHomeController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/17.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingHomeController.h"

// Controllers
#import "PYSearchViewController.h"    // 搜索
#import "ZWBSearchViewController.h"
#import "ZWBTakeoutFoodController.h"  // 外卖栏目
#import "ZWBShoppingMallController.h" // 商城

#import "ZWBStoreHomeController.h" //临时需要
// Models

// Views
#import "ZWBHomeNavSearchBarView.h"
#import "ZWBHomeHeaderView.h"

#import "ZWBTimeLimitCell.h"
#import "ZWBHomeCategoryCell.h"

// Vendors

// Categories

// Others
static NSString *ZWBTimeLimitCellID = @"ZWBTimeLimitCell";
static NSString *ZWBHomeCategoryCellID = @"ZWBHomeCategoryCell";

@interface ZWBShoppingHomeController ()<PYSearchViewControllerDelegate>

@property (nonatomic, strong) ZWBHomeHeaderView *headerView;

@end



@implementation ZWBShoppingHomeController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置导航栏
    [self setupNav];
    // 初始化头部设置
    [self setupTableView];
}

#pragma mark - initialize


#pragma mark - init TableView
- (void)setupTableView {
    
    ZWBHomeHeaderView *homeHeaderView = [[ZWBHomeHeaderView alloc] init];
    self.headerView = homeHeaderView;
    self.tableView.tableHeaderView = homeHeaderView;
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBTimeLimitCell" bundle:nil] forCellReuseIdentifier:ZWBTimeLimitCellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBHomeCategoryCell" bundle:nil] forCellReuseIdentifier:ZWBHomeCategoryCellID];
}

#pragma mark - 导航栏处理
- (void)setupNav {
    self.navigationItem.title = nil;
    
    self.navigationItem.leftBarButtonItems = @[
       [UIBarButtonItem itemWithImage:IMAGE(@"dingwei") target:self action:@selector(locationItemClick)],
       [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil]];
    
    self.navigationItem.rightBarButtonItems = @[
        [UIBarButtonItem itemWithTitle:@"快报" frame:CGRectMake(0, 0, 45, 30) layercornerRadius:15 layerBorderWitdth:1.3 layerBorderColor:COLOR_WHITE target:self action:@selector(newsflashItemClick)],
        [UIBarButtonItem itemWithImage:IMAGE(@"saoyisao") target:self action:@selector(richScanItemClick)],
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil]];
    
    ZWBHomeNavSearchBarView *searchBarVc = [[ZWBHomeNavSearchBarView alloc] init];
    searchBarVc.placeholder = @"请输入搜索内容";
    searchBarVc.frame = CGRectMake(60, 25, SCREEN_WIDTH - 110, 35);
    WeakSelf(self);
    searchBarVc.voiceButtonClickBlock = ^{
        NSLog(@"语音点击回调");
    };
    searchBarVc.searchViewBlock = ^{
        NSLog(@"搜索");
        [weakSelf clickHeaderSearch];
    };
    
    self.navigationItem.titleView = searchBarVc;
}

#pragma mark - Action
// 扫描二维码
- (void)richScanItemClick {
    ZWBTakeoutFoodController *takeoutFoodVC = [[ZWBTakeoutFoodController alloc] init];
    [self.navigationController pushViewController:takeoutFoodVC animated:YES];
}
// 定位
- (void)locationItemClick {
#if 0
    ZWBShoppingMallController *mallVC = [[ZWBShoppingMallController alloc] init];
    [self.navigationController pushViewController:mallVC animated:YES];
#else
    ZWBStoreHomeController *storeVC = [[ZWBStoreHomeController alloc] init];
    [self.navigationController pushViewController:storeVC animated:YES];
#endif
    
}

// 快报
- (void)newsflashItemClick {
    
}

#pragma mark - 创建搜索
- (void)clickHeaderSearch {
    NSArray *hotSeaches = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:NSLocalizedString(@"PYExampleSearchPlaceholderText", @"搜索编程语言") didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {

        [searchViewController.navigationController pushViewController:[[ZWBSearchViewController alloc] init] animated:YES];
    }];
    searchViewController.hotSearchStyle     = PYHotSearchStyleARCBorderTag;
    searchViewController.searchHistoryStyle = PYHotSearchStyleDefault;
    searchViewController.delegate = self;

    ZWBNavigationController *nav = [[ZWBNavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - PYSearchViewControllerDelegate
- (void)searchViewController:(PYSearchViewController *)searchViewController searchTextDidChange:(UISearchBar *)seachBar searchText:(NSString *)searchText {
    if (searchText.length) {
        // Simulate a send request to get a search suggestions

    }
}

#pragma mark - Setter Getter Method


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *listCell = nil;
    if (indexPath.section == 0) {
        ZWBTimeLimitCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBTimeLimitCellID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        listCell = cell;
    } else if (indexPath.section == 1) {
        ZWBHomeCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBHomeCategoryCellID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        listCell = cell;
    } else {
        
    }
    
    return listCell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 175.0f;
    } else if (indexPath.section == 1) {
        return 130.0f;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0f;
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
