//
//  ZWBMineController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/17.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBMineController.h"
// Controllers
#import "ZWBSettingController.h" // 设置
// Models

// Views
#import "ZWBMineHeaderView.h" // 个人中心头部视图
#import "ZWBMineSectionHeaderView.h" // 区头

#import "ZWBMineWalletCell.h"   // 钱包头
#import "ZWBMineSectionItemCell.h" // ItemCell
#import "ZWBMineListCell.h"

// Vendors

// Categories

// Others
static NSString *ZWBMineWalletCellID = @"ZWBMineWalletCell";
static NSString *ZWBMineSectionItemCellID = @"ZWBMineSectionItemCell";
static NSString *ZWBMineListCellID = @"ZWBMineListCell";


@interface ZWBMineController ()

@property (nonatomic, strong) ZWBMineHeaderView *headerView;

/** 区头*/
@property (nonatomic, strong) NSArray *sectionArr;
/** 内容*/
@property (nonatomic, strong) NSMutableArray *sectionItemArr;

@end

@implementation ZWBMineController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置导航栏
    [self setupNav];
    // 初始化头部设置
    [self setupTableView];
}

#pragma mark - 导航栏处理
- (void)setupNav {
    self.navigationItem.title = @"个人中心";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:IMAGE(@"cen_shezhi") target:self action:@selector(settingItemClick:)];
}

#pragma mark - init TableView
- (void)setupTableView {
    UIView *tabHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"ZWBMineHeaderView" owner:nil options:nil] firstObject];
    [tabHeaderView addSubview:self.headerView];
    self.tableView.tableHeaderView = tabHeaderView;
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBMineWalletCell" bundle:nil] forCellReuseIdentifier:ZWBMineWalletCellID];
    [self.tableView registerClass:[ZWBMineSectionItemCell class] forCellReuseIdentifier:ZWBMineSectionItemCellID];
    [self.tableView registerClass:[ZWBMineListCell class] forCellReuseIdentifier:ZWBMineListCellID];
}


#pragma mark - 设置
- (void)settingItemClick:(UIButton *)item {
    NSLog(@"设置");
    ZWBSettingController *setVC = [[ZWBSettingController alloc] init];
    setVC.nickName = @"么么哒";
    [self.navigationController pushViewController:setVC animated:YES];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 2) { // 钱包 订单 卡券
        return 1;
    } else if (section == 3 || section == 4) { // 功能菜单
        return [(NSArray *)self.sectionItemArr[section-1] count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tabCell = nil;
    if (indexPath.section == 0) { // 钱包
        ZWBMineWalletCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBMineWalletCellID forIndexPath:indexPath];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;        
        tabCell = cell;
    } else if (indexPath.section == 1 || indexPath.section == 2) { // 订单 卡券
        ZWBMineSectionItemCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBMineSectionItemCellID];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (!cell) {
            cell = [[ZWBMineSectionItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZWBMineSectionItemCellID];
        }
        cell.itemArr = self.sectionItemArr[indexPath.section - 1];
        
        tabCell = cell;
    } else if (indexPath.section == 3 || indexPath.section == 4) {
        ZWBMineListCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBMineListCellID];
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        if (!cell) {
            cell = [[ZWBMineListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZWBMineListCellID];
        }
        cell.itemModel = self.sectionItemArr[indexPath.section - 1][indexPath.row];
        tabCell = cell;
    }
    
    return tabCell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 60;
    } else if (indexPath.section == 1 || indexPath.section == 2) { // 订单 卡券
        return [tableView cellHeightForIndexPath:indexPath model:self.sectionItemArr[indexPath.section - 1] keyPath:@"itemArr" cellClass:[ZWBMineSectionItemCell class] contentViewWidth:[ZWBUtil cellContentViewWidth]];
    } else {
        return 44.0f;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 2) {
        ZWBMineSectionHeaderView *headerView = [[ZWBMineSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        [headerView setClickBlock:^{
            
        }];
        headerView.infoDict = self.sectionArr[section];
        return headerView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 2) {
        return 50.0f;
    }
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0f;
}

#pragma mark - Lazy load
- (NSArray *)sectionArr {
    if (!_sectionArr) {
        _sectionArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MineSection" ofType:@"plist"]];
    }
    return _sectionArr;
}

- (NSMutableArray *)sectionItemArr {
    if (!_sectionItemArr) {
        _sectionItemArr = [[NSMutableArray alloc] init];
        
        NSArray *secArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MineSectionItem" ofType:@"plist"]];
        for (NSArray *itemArr in secArr) {
            NSMutableArray *tempArr = [NSMutableArray array];
            for (NSDictionary *infoDict in itemArr) {
                ZWBMineSectionItemModel *model = [ZWBMineSectionItemModel modelWithDictionary:infoDict];
                [tempArr addObject:model];
            }
            [_sectionItemArr addObject:tempArr];
        }
    }
    return _sectionItemArr;
}

#pragma 设置StatusBar为白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
