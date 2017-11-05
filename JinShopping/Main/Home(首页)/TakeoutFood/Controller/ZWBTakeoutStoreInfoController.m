//
//  ZWBTakeoutStoreInfoController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutStoreInfoController.h"
// Controller

// Views
#import "ZWBListTableCell.h"
#import "ZWBTakeoutSpecialCell.h"
// Model

// Other
static NSString *ZWBListTableCellID = @"ZWBListTableCell";
static NSString *ZWBTakeoutSpecialCellID = @"ZWBTakeoutSpecialCell";

@interface ZWBTakeoutStoreInfoController ()

@property (nonatomic, strong) NSMutableArray *contentArr;

@end

@implementation ZWBTakeoutStoreInfoController

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
}

#pragma mark - 加载数据
- (void)loadData {
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) { // 正常Cell
        ZWBListTableCell *listCell = [tableView dequeueReusableCellWithIdentifier:ZWBListTableCellID];
        if (!listCell) {
            listCell = [[ZWBListTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZWBListTableCellID isShowLogoImageView:NO];
        }
        listCell.desLabel.hidden = indexPath.section == 0 && indexPath.row == 0 ? YES : NO;
        listCell.goImageView.hidden = indexPath.section == 0 && (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2) ? NO : YES;
        listCell.titleLabel.text = self.dataArray[indexPath.section][indexPath.row];
        listCell.desLabel.text = self.contentArr[indexPath.section][indexPath.row];

        cell = listCell;
    } else {
        ZWBTakeoutSpecialCell *sepcialCell = [tableView dequeueReusableCellWithIdentifier:ZWBTakeoutSpecialCellID];
        if (!sepcialCell) {
            sepcialCell = [[ZWBTakeoutSpecialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZWBListTableCellID];
        }
        sepcialCell.titleLabel.text = self.contentArr[indexPath.section][indexPath.row];

        cell = sepcialCell;
    }
    
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
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0: {   // 官网
                
            }
                break;
            case 1: {   // 拨打电话
                
            }
                break;
            case 2: {   // 地址
                
            }
                break;
            default:
                break;
        }
    }
}

#pragma mark - Lazy load
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
        [_dataArray addObject:@[@"商家官网", @"店铺电话:", @"店铺地址:", @"营业时间:", @"配送服务:", @"店铺公告:", @"店铺认证:"]];
        [_dataArray addObject:@[@""]];
    }
    return _dataArray;
}

- (NSMutableArray *)contentArr {
    if (!_contentArr) {
        _contentArr = [[NSMutableArray alloc] init];
        [_contentArr addObject:@[@"http://www.baidu.com", @"156XXXXXXXX", @"新密市二幼", @"8:00 ~ 23:00", @"由本店提供配送服务", @"商品打折", @"已认证"]];
        [_contentArr addObject:@[@""]];
    }
    return _contentArr;
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
