//
//  ZWBBaseTableViewController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/17.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseTableViewController.h"

@interface ZWBBaseTableViewController ()

@end

@implementation ZWBBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化数据
    [self setUpBase];

}

#pragma mark - initialize
- (void)setUpBase {
    self.view.backgroundColor = COLOR_MAIN_BG;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
//    UIView *backgroundView = self.navigationController.navigationBar.subviews.firstObject;
//    backgroundView.alpha = 1.0;
//    self.clearsSelectionOnViewWillAppear = NO;
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, 0.01f)];
    self.tableView.tableFooterView = [UIView new];
    
}


#pragma mark - 加载数据


#pragma mark - 结束刷新
- (void)endRefresh {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - Lazy load
- (UITableView *)tableView {
    if(!_tableView){
        UITableView *tab = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [tab setExtraCellLineHidden];
        tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        tab.dataSource = self;
        tab.delegate = self;
        tab.backgroundColor = COLOR_MAIN_BG;
        [self.view addSubview:tab];
        _tableView = tab;
        _tableView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
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
