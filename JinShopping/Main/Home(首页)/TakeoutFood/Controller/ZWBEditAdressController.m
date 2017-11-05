//
//  ZWBEditAdressController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBEditAdressController.h"
// View
#import "ZWBEditAddressCell.h"

//
static NSString *ZWBEditAddressCellID = @"ZWBEditAddressCell";

@interface ZWBEditAdressController ()

@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSMutableArray *contentArr;
@property (nonatomic, strong) NSMutableArray *idsArr;

@end

@implementation ZWBEditAdressController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupBase];
    
    [self fillData];
}

#pragma mark - 初始化
- (void)setupBase {
    self.title = self.isEditing ? @"编辑地址" : @"添加地址";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);

    [self.tableView registerClass:[ZWBEditAddressCell class] forCellReuseIdentifier:ZWBEditAddressCellID];
}

#pragma mark - 填充数据
- (void)fillData {
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.row == self.titleArr.count - 1) {
        ZWBEditAddressCell *selectCell = [tableView dequeueReusableCellWithIdentifier:ZWBEditAddressCellID forIndexPath:indexPath];
        
        cell = selectCell;
    } else {
        
    }
    
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
    
    ZWBEditAdressController *editVC = [[ZWBEditAdressController alloc] init];
    editVC.model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:editVC animated:YES];
}


#pragma mark - Lazy load
- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"姓名", @"电话", @"省份", @"城市", @"区县", @"位置", @"地址", @"邮编", @""];
    }
    return _titleArr;
}

- (NSMutableArray *)contentArr {
    if (!_contentArr) {
        _contentArr = [[NSMutableArray alloc] init];
    }
    return _contentArr;
}

- (NSMutableArray *)idsArr {
    if (!_idsArr) {
        _idsArr = [[NSMutableArray alloc] init];
    }
    return _idsArr;
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
