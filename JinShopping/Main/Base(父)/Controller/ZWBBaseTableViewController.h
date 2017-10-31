//
//  ZWBBaseTableViewController.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/17.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseViewController.h"

@interface ZWBBaseTableViewController : ZWBBaseViewController <UITableViewDelegate, UITableViewDataSource> {
    
    NSInteger _page;
    NSInteger _rows;
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}

@property (nonatomic) NSInteger page;

@property (nonatomic) NSInteger rows;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

/** 结束刷新*/
- (void)endRefresh;

@end
