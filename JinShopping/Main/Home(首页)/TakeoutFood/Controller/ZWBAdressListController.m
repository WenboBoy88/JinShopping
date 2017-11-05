//
//  ZWBAdressListController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBAdressListController.h"
#import "ZWBAddressListCell.h"


static NSString *ZWBAddressListCellID = @"ZWBAddressListCell";

@interface ZWBAdressListController ()

@end

@implementation ZWBAdressListController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化操作
    [self setupBase];
    // 初始化头部设置
    [self setupTableView];
    
    [self loadData];
}


#pragma mark - 导航栏处理
- (void)setupBase {
    self.view.backgroundColor = COLOR_CLEAR;
    self.navigationItem.title = @"";
    
    
}

#pragma mark - init TableView
- (void)setupTableView {
    
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBAddressListCell" bundle:nil] forCellReuseIdentifier:ZWBAddressListCellID];
}

#pragma mark - 加载数据
- (void)loadData {
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZWBAddressListCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBAddressListCellID forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
