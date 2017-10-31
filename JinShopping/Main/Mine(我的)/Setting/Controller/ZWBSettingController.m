//
//  ZWBSettingController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/23.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBSettingController.h"
// Controller

// Views
#import "ZWBListTableCell.h"
// Model

static NSString *ZWBListTableCellID = @"ZWBListTableCell";

@interface ZWBSettingController ()

@property (nonatomic, strong) NSArray *titles;

@end

@implementation ZWBSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化操作
    [self setupBase];
    // 初始化头部设置
    [self setupTableView];
}


#pragma mark - 导航栏处理
- (void)setupBase {
    self.view.backgroundColor = COLOR_CLEAR;
    self.navigationItem.title = @"设置";
    
}

#pragma mark - init TableView
- (void)setupTableView {
    
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    // 注册
//    [self.tableView registerClass:[ZWBListTableCell class] forCellReuseIdentifier:ZWBListTableCellID];
}




#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ZWBListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBListTableCellID];
    if (!cell) {
        cell = [[ZWBListTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZWBListTableCellID isShowLogoImageView:NO];
    }
    // 只有昵称显示 其余的不显示都隐藏掉
    cell.titleLabel.text = self.dataArray[indexPath.section][indexPath.row];
    cell.desLabel.hidden = indexPath.section == 0 && indexPath.row == 0 ? NO : YES;
    cell.desLabel.text = kStringIsEmpty(self.nickName) ? @"" : self.nickName;

    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Lazy load
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
        [_dataArray addObject:@[@"昵称", @"修改密码", @"修改手机号", @"收货地址", @"实名认证", @"车主认证", @"我的实体卡"]];
        [_dataArray addObject:@[@"关于我们"]];
        [_dataArray addObject:@[@"管理店铺"]];
    }
    return _dataArray;
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
