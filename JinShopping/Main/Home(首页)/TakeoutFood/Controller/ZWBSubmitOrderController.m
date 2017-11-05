//
//  ZWBSubmitOrderController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBSubmitOrderController.h"
// Views
#import "ZWBTakeoutPayStoreHeaderView.h"
#import "ZWBTakeoutPayFooterView.h"
#import "ZWBTakeoutPayCalCell.h"
#import "ZWBPayMethodsCell.h"

// Others
static NSString *ZWBTakeoutPayCalCellID = @"ZWBTakeoutPayCalCell";
static NSString *ZWBPayMethodsCellID = @"ZWBPayMethodsCell";

@interface ZWBSubmitOrderController ()

@property (nonatomic, strong) ZWBTakeoutPayStoreHeaderView *headerView;
@property (nonatomic, strong) ZWBTakeoutPayFooterView *footerView;

@property (nonatomic, strong) NSArray *sectionArr;

@end

@implementation ZWBSubmitOrderController

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
    self.navigationItem.title = @"确定支付";
    
    self.sectionArr = @[@"结算信息", @"选择支付方式"];
}

#pragma mark - init TableView
- (void)setupTableView {
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 头视图
    ZWBTakeoutPayStoreHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"ZWBTakeoutPayStoreHeaderView" owner:nil options:nil] lastObject];
    self.headerView = headerView;
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120);
    self.tableView.tableHeaderView = headerView;
    // 尾视图
    ZWBTakeoutPayFooterView *footerView = [[ZWBTakeoutPayFooterView alloc] init];
    self.footerView = footerView;
    self.tableView.tableFooterView = footerView;
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBTakeoutPayCalCell" bundle:nil] forCellReuseIdentifier:ZWBTakeoutPayCalCellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBPayMethodsCell" bundle:nil] forCellReuseIdentifier:ZWBPayMethodsCellID];
}

#pragma mark - 加载数据
- (void)loadData {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        ZWBTakeoutPayCalCell *payCell = [tableView dequeueReusableCellWithIdentifier:ZWBTakeoutPayCalCellID forIndexPath:indexPath];

        cell = payCell;
    } else {
        ZWBPayMethodsCell *methodCell = [tableView dequeueReusableCellWithIdentifier:ZWBPayMethodsCellID forIndexPath:indexPath];
        
        cell = methodCell;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 145.0f;
    } else {
        return 100.0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    sectionView.backgroundColor = COLOR_WHITE;
    
    UILabel *titleLabel = [ZWBFactory creatLabelWithFrame:CGRectMake(10, 10, 200, 24) text:self.sectionArr[section] textColor:COLOR_333 font:14.0f];
    [sectionView addSubview:titleLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = COLOR_MAIN_BG;
    [sectionView addSubview:lineView];
    return sectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0f;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
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
