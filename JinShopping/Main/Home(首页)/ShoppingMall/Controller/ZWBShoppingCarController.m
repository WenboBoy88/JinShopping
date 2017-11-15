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

// Others
static NSString *ZWBShoppingCarHeaderViewID = @"ZWBShoppingCarHeaderView";
static NSString *ZWBShoppingCarFooterViewID = @"ZWBShoppingCarFooterView";
static NSString *ZWBShoppingCarCellID = @"ZWBShoppingCarCell";

@interface ZWBShoppingCarController ()<UITableViewDelegate, UITableViewDataSource>

/** 底部的导航菜单的*/
@property (nonatomic, strong) ZWBShoppingCarToolBarView *toolBarView;
/** 暂无图片的提示框*/
@property (nonatomic, strong) ZWBUnGoodsCarView *unGoodsView;

@end

@implementation ZWBShoppingCarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
    
    [self loadData];
}

#pragma mark - 初始化导航栏
- (void)setupNav {
    self.navigationItem.title = @"购物车";
    
}

- (void)loadData {
    if (kArrayIsEmpty(self.dataArray)) {

    }
    
}



#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWBShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBShoppingCarCellID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZWBShoppingCarHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ZWBShoppingCarHeaderViewID];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [ZWBShoppingCarHeaderView getCartHeaderHeight];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    ZWBShoppingCarFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ZWBShoppingCarFooterViewID];
    
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [ZWBShoppingCarFooterView getCartFooterHeight];
}

#pragma mark - Lazy laod
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = COLOR_MAIN_BG;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        // 注册
        [self.tableView registerClass:[ZWBShoppingCarHeaderView class] forHeaderFooterViewReuseIdentifier:ZWBShoppingCarHeaderViewID];
        [self.tableView registerClass:[ZWBShoppingCarFooterView class] forHeaderFooterViewReuseIdentifier:ZWBShoppingCarFooterViewID];
        [self.tableView registerNib:[UINib nibWithNibName:@"ZWBShoppingCarCell" bundle:nil] forCellReuseIdentifier: ZWBShoppingCarCellID];
        
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
        
        [self.view addSubview:_toolBarView];
        _toolBarView.sd_layout
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .bottomEqualToView(self.view)
        .heightIs(50.0f);
    }
    return _toolBarView;
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
