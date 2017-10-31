//
//  ZWBGoodsListView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBGoodsListView.h"
#import "ZWBGoodsListCell.h"

#define CellID @"ZWBGoodsListCell"

@implementation ZWBGoodsListView


#pragma mark - Initinal
- (instancetype)initWithFrame:(CGRect)frame withOrderArr:(NSMutableArray *)orderArr{
    
    return [self initWithFrame:frame withOrderArr:orderArr canReorder:NO];
}

- (instancetype)initWithFrame:(CGRect)frame withOrderArr:(NSMutableArray *)orderArr canReorder:(BOOL)reOrder{
    
    if (self = [super initWithFrame:frame]) {
        
        self.orderArr = [NSMutableArray arrayWithArray:orderArr];
        [self setupUI];
    }
    return self;
}


#pragma mark - 布局界面
- (void)setupUI {
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBGoodsListCell" bundle:nil] forCellReuseIdentifier:CellID];
}

#pragma mark - Lazy load
- (UITableView *)tableView {
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.bounces = NO;
        self.tableView.showsHorizontalScrollIndicator = NO;
        self.tableView.showsVerticalScrollIndicator = NO;
        [self addSubview:self.tableView];
    }
    return _tableView;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.orderArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZWBGoodsListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.model = self.orderArr[indexPath.row];
    cell.operationBlock = ^(NSInteger number, BOOL plus){
        
        NSMutableDictionary * dic = self.orderArr[indexPath.row];
        //更新选中订单列表中的数量
        [dic setValue:[NSNumber numberWithInteger:number] forKey:@"orderCount"];
        
        NSMutableDictionary *notification = [[NSMutableDictionary alloc]init];
        [notification setValue:[NSNumber numberWithBool:plus] forKey:@"isAdd"];
        [notification setValue:dic forKey:@"update"];
        [[NSNotificationCenter defaultCenter] postNotificationName:kZWBRefreshCurrentUI object:self userInfo:notification];
    };
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark - Lazy load
- (NSMutableArray *)orderArr {
    if (!_orderArr) {
        _orderArr = [[NSMutableArray alloc] init];
    }
    return _orderArr;
}

@end
