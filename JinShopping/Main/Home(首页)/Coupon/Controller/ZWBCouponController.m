//
//  ZWBCouponController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/11.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBCouponController.h"

// Views
#import "ZWBCouponCell.h"

// Others
static NSString *ZWBCouponCellID = @"ZWBCouponCell";

@interface ZWBCouponController ()

@end

@implementation ZWBCouponController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
}

#pragma mark - 初始化导航栏
- (void)setupNav {
    self.navigationItem.title = @"优惠券";
    
}

#pragma mark - 初始化界面
- (void)setupUI {
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBCouponCell" bundle:nil] forCellReuseIdentifier:ZWBCouponCellID];
}

#pragma mark - LoadData
- (void)loadData {
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWBCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBCouponCellID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0f;
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
