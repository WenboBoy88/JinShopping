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

@end

@implementation ZWBEditAdressController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupBase];
}

#pragma mark - 初始化
- (void)setupBase {
    self.title = self.isEditing ? @"编辑地址" : @"添加地址";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.tableView registerNib:[<#(nullable UINib *)#>] forCellReuseIdentifier:<#(nonnull NSString *)#>
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
