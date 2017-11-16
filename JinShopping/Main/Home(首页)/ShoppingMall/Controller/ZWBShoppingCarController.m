//
//  ZWBShoppingCarController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingCarController.h"
// Views
#import "ZWBShoppingCarToolBarView.h" // 底部的菜单
#import "ZWBUnGoodsCarView.h"
#import "ZWBShoppingCarHeaderView.h"
#import "ZWBShoppingCarFooterView.h"
#import "ZWBShoppingCarCell.h"
// Models

// ViewModels
#import "ZWBShoppingCarViewModel.h"

// Others
static NSString *ZWBShoppingCarHeaderViewID = @"ZWBShoppingCarHeaderView";
static NSString *ZWBShoppingCarFooterViewID = @"ZWBShoppingCarFooterView";
static NSString *ZWBShoppingCarCellID       = @"ZWBShoppingCarCell";

@interface ZWBShoppingCarController ()<UITableViewDelegate, UITableViewDataSource, ZWBShoppingCarToolBarDelegate, ZWBShoppingCarHeaderDelegate, ZWBShoppingCarCellDelegate>

@property (nonatomic, strong) ZWBShoppingCarViewModel *cartViewModel;
/** 底部的导航菜单的*/
@property (nonatomic, strong) ZWBShoppingCarToolBarView *toolBarView;
/** 暂无图片的提示框*/
@property (nonatomic, strong) ZWBUnGoodsCarView *unGoodsView;

@end

@implementation ZWBShoppingCarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupBase];
    
    [self setupUI];
    
    [self loadData];
}

#pragma mark - 初始化
- (void)setupBase {
    self.navigationItem.title = @"购物车";
    
    
}

- (void)setupUI {
    // 注册
    [self.tableView registerClass:[ZWBShoppingCarHeaderView class] forHeaderFooterViewReuseIdentifier:ZWBShoppingCarHeaderViewID];
    [self.tableView registerClass:[ZWBShoppingCarFooterView class] forHeaderFooterViewReuseIdentifier:ZWBShoppingCarFooterViewID];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBShoppingCarCell" bundle:nil] forCellReuseIdentifier: ZWBShoppingCarCellID];
}

- (void)loadData {
    if (kArrayIsEmpty(self.dataArray)) {

    }
    
}



#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cartViewModel.cartData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cartViewModel.cartData[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWBShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBShoppingCarCellID forIndexPath:indexPath];
    cell.delegate = self;
    cell.indexPath = indexPath;
    // 填充数据
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

// 创建Cell
- (void)configureCell:(ZWBShoppingCarCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *shopArray = self.cartViewModel.cartData[indexPath.section];
    ZWBShoppingCarModel *model = shopArray[indexPath.row];
    //数量改变
    WeakSelf(self);
    [cell setNumberChangeBlock:^(NSInteger numCount) {
        [weakSelf.cartViewModel rowChangeQuantity:numCount indexPath:indexPath];
    }];
    
    // 刷新界面
    [self.cartViewModel setOpertaionStatusBlock:^{
        [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
    }];
    
    cell.model = model;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}
/** 头视图*/
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ZWBShoppingCarHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ZWBShoppingCarHeaderViewID];
    headerView.delegate = self;
    headerView.section = section;
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [ZWBShoppingCarHeaderView getCartHeaderHeight];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    NSMutableArray *shopArray = self.cartViewModel.cartData[section];
    ZWBShoppingCarFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ZWBShoppingCarFooterViewID];
    footerView.shopGoodsArray = shopArray;

    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [ZWBShoppingCarFooterView getCartFooterHeight];
}

#pragma mark - ZWBShoppingCarCellDelegate
- (void)clickButton:(UIButton *)button superView:(ZWBShoppingCarCell *)cell selected:(BOOL)selected indexPath:(NSIndexPath *)indexPath {
    
    // 更新当前的View
    [self.cartViewModel rowSelect:selected indexPath:indexPath];
    // 操作成功后进行刷新
    WeakSelf(self);
    [self.cartViewModel setOpertaionStatusBlock:^{
        [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
    }];
}

// 店铺头部的代理
#pragma mark - ZWBShoppingCarHeaderDelegate
- (void)clickStoreHeaderView:(ZWBShoppingCarHeaderView *)currentView isSelected:(BOOL)isSelected section:(NSInteger)section {
    // 店铺的数据
    NSMutableArray *shopArray = self.cartViewModel.cartData[section];
    // 替换数组中存放的当前点击的数据
    [self.cartViewModel.shopSelectArray replaceObjectAtIndex:section withObject:@(isSelected)];
    // 替换选中的状态
    for (ZWBShoppingCarModel *model in shopArray) {
        model.isSelect = isSelected;
    }
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
    
    self.cartViewModel.allPrices = [self.cartViewModel getAllPrices];
    //店铺选中状态
    currentView.selectStoreGoodsButton.selected = [self.cartViewModel.shopSelectArray[section] boolValue];
    
}

// 底部操作栏目的代理
#pragma mark - ZWBShoppingCarToolBarDelegate
// 全选操作
- (void)selectAllButtonClick:(BOOL)isSelected {
    
    [self.cartViewModel selectAll:isSelected];
}

// 删除
- (void)deleteSelectGoodsClick {
    
}
// 结算
- (void)balanceButtonClick {
    
}

#pragma mark - Lazy laod
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = COLOR_MAIN_BG;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
        _tableView.sd_layout
        .topEqualToView(self.view)
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .bottomSpaceToView(self.toolBarView, 0);
    }
    return _tableView;
}

- (ZWBUnGoodsCarView *)unGoodsView {
    if (!_unGoodsView) {
        _unGoodsView = [[ZWBUnGoodsCarView alloc] init];
        [self.tableView addSubview:_unGoodsView];
        _unGoodsView.sd_layout
        .centerXEqualToView(self.tableView)
        .centerYEqualToView(self.tableView)
        .widthRatioToView(self.tableView, 0.7)
        .heightEqualToWidth();
    }
    return _unGoodsView;
}

- (ZWBShoppingCarToolBarView *)toolBarView {
    if (!_toolBarView) {
        _toolBarView = [[ZWBShoppingCarToolBarView alloc] init];
        _toolBarView.delegate = self;
        [self.view addSubview:_toolBarView];
        _toolBarView.sd_layout
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .bottomEqualToView(self.view)
        .heightIs(50.0f);
    }
    return _toolBarView;
}

- (ZWBShoppingCarViewModel *)cartViewModel {
    if (!_cartViewModel) {
        _cartViewModel = [[ZWBShoppingCarViewModel alloc] init];
    }
    return _cartViewModel;
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
