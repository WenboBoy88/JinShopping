//
//  ZWBTakeoutFoodShopCarController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutFoodShopCarController.h"
// Controller

// Views
#import "ZWBTakeoutFoodShopCell.h"
#import "ZWBTakeoutFoodShoppingCarView.h"

// Models
#import "ZWBTakeoutFoodShopCarViewModel.h"
// Others
#import "ZWBThrowLineTool.h"

static NSString *ZWBTakeoutFoodShopCellID = @"ZWBTakeoutFoodShopCell";

@interface ZWBTakeoutFoodShopCarController ()<UITableViewDelegate, UITableViewDataSource, ZWBThrowLineToolDelegate>

@property (nonatomic, strong) ZWBThrowLineTool *throwLine;

/** 抛物线*/
@property (strong, nonatomic) UIImageView *animationView;
/** 订单数据*/
@property (nonatomic,strong) NSMutableArray *ordersArray;
/** 总数量*/
@property (nonatomic,assign) NSInteger totalOrders;

@property (nonatomic,strong) ZWBTakeoutFoodShoppingCarView *shopcarView;

@end

@implementation ZWBTakeoutFoodShopCarController

#pragma mark - ViewLoad
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupBase];
    [self setupUI];
    [self loadData];
}

- (void)dealloc {
    [kNotificationCenter removeObserver:self];
}

#pragma mark - Initinal
- (void)setupBase {
    // 初始化抛物线
    self.throwLine = [ZWBThrowLineTool sharedThrowLineTool];
    self.throwLine.delegate = self;
    
    // 监听刷新UI的通知
    [kNotificationCenter addObserver:self selector:@selector(refreshMainUI:) name:kZWBRefreshCurrentUI object:nil];
}

#pragma mark - 布局
- (void)setupUI {
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBTakeoutFoodShopCell" bundle:nil] forCellReuseIdentifier:ZWBTakeoutFoodShopCellID];
    self.shopcarView = [[ZWBTakeoutFoodShoppingCarView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 64 - 50, CGRectGetWidth(self.view.bounds), 50) parentView:self.view];
    [self.view addSubview:self.shopcarView];
    
    self.tableView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomSpaceToView(self.view, 50);
}

#pragma mark - Load Data
- (void)loadData {
    WeakSelf(self);
    [ZWBTakeoutFoodShopCarViewModel getShopData:^(NSMutableArray *array) {
        for (NSDictionary *infoDict in array) {
            ZWBTakeoutFoodOrderModel *model = [ZWBTakeoutFoodOrderModel modelWithDictionary:infoDict];
            [weakSelf.dataArray addObject:model];
        }
    }];
}

- (void)loadDataIsRefresh:(BOOL)isRefresh {
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWBTakeoutFoodShopCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBTakeoutFoodShopCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.orderModel = self.dataArray[indexPath.row];
    __weak typeof(cell) weakCell = cell;
    __weak typeof(self) weakSelf = self;
    [cell setPlusBlock:^(NSInteger count, BOOL animated) {

        ZWBTakeoutFoodOrderModel *model = weakSelf.dataArray[indexPath.row];
        // 给商品添加数量
        model.orderCount = [NSNumber numberWithInteger:count];
        // 坐标转换 得到起始点和终点
        CGRect fromRect = [weakCell convertRect:weakCell.addBtn.frame toView:weakSelf.view];
        CGRect toRect   = [weakSelf.shopcarView convertRect:weakSelf.shopcarView.shoppingCarBtn.frame toView:weakSelf.view];
        // 是否执行动画
        if (animated) {
            [weakSelf.view addSubview:weakSelf.animationView];
            [[ZWBThrowLineTool sharedThrowLineTool] throwObject:weakSelf.animationView from:fromRect.origin to:toRect.origin];
            weakSelf.ordersArray = [ZWBTakeoutFoodShopCarViewModel addOrderModel:model orderData:weakSelf.ordersArray isAdded:YES];
        } else {
            weakSelf.ordersArray = [ZWBTakeoutFoodShopCarViewModel addOrderModel:model orderData:weakSelf.ordersArray isAdded:NO];
        }
        
        weakSelf.shopcarView.goodsListView.orderArr = weakSelf.ordersArray;
        // 更新frame
        [weakSelf.shopcarView updateFrame:weakSelf.shopcarView.goodsListView];
        [weakSelf.shopcarView.goodsListView.tableView reloadData];
        weakSelf.shopcarView.badgeValue =  [ZWBTakeoutFoodShopCarViewModel countOthersWithOrderData:weakSelf.ordersArray];
        double price = [ZWBTakeoutFoodShopCarViewModel getTotalPrice:weakSelf.ordersArray];

        [weakSelf.shopcarView setTotalMoney:price];
    }];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

#pragma mark - Nofi Center
// 刷新界面
- (void)refreshMainUI:(NSNotification *)nofi {
    
}

#pragma mark - ZWBThrowLineToolDelegate
- (void)animationDidFinish {
    [self.animationView removeFromSuperview];
    WeakSelf(self);
    [UIView animateWithDuration:0.1 animations:^{
        weakSelf.shopcarView.shoppingCarBtn.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            weakSelf.shopcarView.shoppingCarBtn.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {

        }];
        
    }];

}


#pragma mark - Lazy load
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (NSMutableArray *)ordersArray {
    if (!_ordersArray) {
        _ordersArray = [[NSMutableArray alloc] init];
    }
    return _ordersArray;
}

- (UIImageView *)animationView {
    if (!_animationView) {
        _animationView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _animationView.image = [UIImage imageNamed:@"adddetail"];
        _animationView.layer.cornerRadius = 10;
    }
    return _animationView;
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
