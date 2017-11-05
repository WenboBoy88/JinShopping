//
//  ZWBAffirmPayController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBAffirmPayController.h"

//Views
#import "ZWBTakeoutOrderLocationCell.h" // 订单定位
#import "ZWBTakeoutOrderInfoCell.h"     // 订单详情
#import "ZWBTakeoutOrderGoodCell.h"     // 订单商品
#import "ZWBTakeoutOrderFooterView.h"   // 底部提交栏

// Others
static NSString *ZWBTakeoutOrderLocationCellID = @"ZWBTakeoutOrderLocationCell";
static NSString *ZWBTakeoutOrderInfoCellID = @"ZWBTakeoutOrderInfoCell";
static NSString *ZWBTakeoutOrderGoodCellID = @"ZWBTakeoutOrderGoodCell";

@interface ZWBAffirmPayController ()

@property (nonatomic, strong) ZWBTakeoutOrderFooterView *footerView;

@end

@implementation ZWBAffirmPayController

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
    self.navigationItem.title = @"确认提交订单";
    
    
}

#pragma mark - init TableView
- (void)setupTableView {
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    ZWBTakeoutOrderFooterView *footerView = [[ZWBTakeoutOrderFooterView alloc] init];
    footerView.width = SCREEN_WIDTH;
    self.footerView = footerView;
    self.tableView.tableFooterView = footerView;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBTakeoutOrderLocationCell" bundle:nil] forCellReuseIdentifier:ZWBTakeoutOrderLocationCellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBTakeoutOrderInfoCell" bundle:nil] forCellReuseIdentifier:ZWBTakeoutOrderInfoCellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBTakeoutOrderGoodCell" bundle:nil] forCellReuseIdentifier:ZWBTakeoutOrderGoodCellID];

}

#pragma mark - 加载数据
- (void)loadData {
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        ZWBTakeoutOrderLocationCell *locationCell = [tableView dequeueReusableCellWithIdentifier:ZWBTakeoutOrderLocationCellID forIndexPath:indexPath];
        
        cell = locationCell;
    } else if (indexPath.section == 1) {
        ZWBTakeoutOrderInfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:ZWBTakeoutOrderInfoCellID forIndexPath:indexPath];
        
        cell = infoCell;
    } else if (indexPath.section == 2) {
        ZWBTakeoutOrderGoodCell *goodCell = [tableView dequeueReusableCellWithIdentifier:ZWBTakeoutOrderGoodCellID forIndexPath:indexPath];
        
        cell = goodCell;
    }

    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100.0f;
    } else if (indexPath.section == 1) {
        return 140.0f;
    } else if (indexPath.section == 2) {
        return 145.0f;
    }
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
    } else if (indexPath.section == 1) {
        
    } else {
        
    }
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
