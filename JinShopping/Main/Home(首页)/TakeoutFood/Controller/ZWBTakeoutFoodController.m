//
//  ZWBTakeoutFoodController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/24.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutFoodController.h"
// Controller
#import "ZWBTakeoutFoodShopCarController.h"

// Views
#import "DOPDropDownMenu.h"
#import "ZWBTakeoutFoodHeaderView.h" // 外卖头部
#import "ZWBTakeoutFoodStoreCell.h"  // 店家的Cell

// Model

// Other
static NSString *ZWBTakeoutFoodStoreCellID = @"ZWBTakeoutFoodStoreCell";

@interface ZWBTakeoutFoodController () <DOPDropDownMenuDelegate, DOPDropDownMenuDataSource>

@property (nonatomic, strong) NSArray *classifys;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;
@property (nonatomic, strong) NSArray *areas;
@property (nonatomic, strong) NSArray *sorts;

@end

@implementation ZWBTakeoutFoodController

#pragma mark - Initinal
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupBase];

    [self setupTab];
    
    [self loadData];
}

#pragma mark - 初始化
- (void)setupBase {
    self.title = @"外卖";
    self.view.backgroundColor = COLOR_MAIN_BG;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:IMAGE(@"") target:self action:@selector(searchClick:)];
}

- (void)setupTab {
    ZWBTakeoutFoodHeaderView *headerView = [[ZWBTakeoutFoodHeaderView alloc] init];
    headerView.clickBannerBlock = ^{
        
    };
    self.tableView.tableHeaderView = headerView;
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBTakeoutFoodStoreCell" bundle:nil] forCellReuseIdentifier:ZWBTakeoutFoodStoreCellID];
}

#pragma mark - Load Data
- (void)loadData {
    self.classifys = @[@"美食",@"今日新单",@"电影",@"酒店"];
    self.cates = @[@"自助餐",@"快餐",@"火锅",@"日韩料理",@"西餐",@"烧烤小吃"];
    self.movices = @[@"内地剧",@"港台剧",@"英美剧"];
    self.hostels = @[@"经济酒店",@"商务酒店",@"连锁酒店",@"度假酒店",@"公寓酒店"];
    self.areas = @[@"全城",@"芙蓉区",@"雨花区",@"天心区",@"开福区",@"岳麓区"];
    self.sorts = @[@"默认排序",@"离我最近",@"好评优先",@"人气优先",@"最新发布"];

}

- (void)loadDataIsRefresh:(BOOL)isRefresh {
    
}


#pragma mark - Customer Action
- (void)searchClick:(UIButton *)button {
    NSLog(@"外卖搜索");
    
}

#pragma mark - DOPDropDownMenuDataSource
/**
 *  返回 menu 有多少列
 */
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu {
    return 3;
}

// 返回 menu 第column列有多少行
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    if (column == 0) {
        return self.classifys.count;
    } else if (column == 1){
        return self.areas.count;
    } else {
        return self.sorts.count;
    }

}

//  返回menu 第column列 每行title
- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath {
    if (indexPath.column == 0) {
        return self.classifys[indexPath.row];
    } else if (indexPath.column == 1){
        return self.areas[indexPath.row];
    } else {
        return self.sorts[indexPath.row];
    }
}

- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0 || indexPath.column == 1) {
        return [NSString stringWithFormat:@"ic_filter_category_%ld",(long)indexPath.row];
    }
    return nil;
}

- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath {
    if (indexPath.column == 0 && indexPath.item >= 0) {
        return [NSString stringWithFormat:@"ic_filter_category_%ld",(long)indexPath.item];
    }
    return nil;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column {
    if (column == 0) {
        if (row == 0) {
            return self.cates.count;
        } else if (row == 2){
            return self.movices.count;
        } else if (row == 3){
            return self.hostels.count;
        }
    }
    return 0;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath {
    if (indexPath.column == 0) {
        if (indexPath.row == 0) {
            return self.cates[indexPath.item];
        } else if (indexPath.row == 2){
            return self.movices[indexPath.item];
        } else if (indexPath.row == 3){
            return self.hostels[indexPath.item];
        }
    }
    return nil;
}

#pragma mark - DOPDropDownMenuDelegate
- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath {
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",(long)indexPath.column,(long)indexPath.row,(long)indexPath.item);
    } else {
        NSLog(@"点击了 %ld - %ld 项目",(long)indexPath.column,(long)indexPath.row);
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWBTakeoutFoodStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBTakeoutFoodStoreCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWBTakeoutFoodShopCarController *shopVC = [[ZWBTakeoutFoodShopCarController alloc] init];
    
    [self.navigationController pushViewController:shopVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DOPDropDownMenu *menuView = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:44];
    menuView.delegate = self;
    menuView.dataSource = self;
    menuView.willShowBackgroundViewBlock = ^{
        tableView.scrollEnabled = NO;
    };
    menuView.willEndBackgroundViewBlock = ^{
        tableView.scrollEnabled = YES;
    };
    menuView.finishedBlock = ^(DOPIndexPath *indexPath){
        if (indexPath.item >= 0) {
            NSLog(@"收起:点击了 %ld - %ld - %ld 项目",(long)indexPath.column,(long)indexPath.row,(long)indexPath.item);
        } else {
            NSLog(@"收起:点击了 %ld - %ld 项目",(long)indexPath.column,(long)indexPath.row);
        }
        
    };
//     创建menu 第一次显示 不会调用点击代理，可以用这个手动调用
//    [menu selectDefalutIndexPath];
//    [menuView selectIndexPath:[DOPIndexPath indexPathWithCol:0 row:0 item:0]];

    return menuView;
}


#pragma mark - Lazy load
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tabView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [tabView setExtraCellLineHidden];
        tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tabView.dataSource = self;
        tabView.delegate = self;
        tabView.backgroundColor = COLOR_MAIN_BG;
        [self.view addSubview:tabView];
        _tableView = tabView;
        _tableView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    }
    return _tableView;
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

