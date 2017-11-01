//
//  ZWBAdressListController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBAdressListController.h"
// Controller
#import "ZWBEditAdressController.h"

// Views
#import "ZWBAddressListCell.h"

// Model

// Other

static NSString *ZWBAddressListCellID = @"ZWBAddressListCell";

@interface ZWBAdressListController ()



@end

@implementation ZWBAdressListController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupBase];
    
    [self loadData];
}

#pragma mark - 初始化操作

- (void)setupBase {
    self.view.backgroundColor = COLOR_MAIN_BG;
    self.navigationItem.title = @"地址选择";
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBAddressListCell" bundle:nil] forCellReuseIdentifier:ZWBAddressListCellID];
}

#pragma mark - 加载数据
- (void)loadData {
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWBEditAdressController *editVC = [[ZWBEditAdressController alloc] init];
    editVC.model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:editVC animated:YES];
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
