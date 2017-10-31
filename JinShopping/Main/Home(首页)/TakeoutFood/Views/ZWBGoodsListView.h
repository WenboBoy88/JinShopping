//
//  ZWBGoodsListView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBGoodsListView : UIView <UITableViewDataSource, UITableViewDelegate>

/** 保存的数组*/
@property (nonatomic, strong) NSMutableArray *orderArr;

@property (nonatomic, strong) UITableView *tableView;

- (instancetype)initWithFrame:(CGRect)frame withOrderArr:(NSMutableArray *)orderArr;

- (instancetype)initWithFrame:(CGRect)frame withOrderArr:(NSMutableArray *)orderArr canReorder:(BOOL)reOrder;


@end
