//
//  ZWBDetailShoppingMallController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/8.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBDetailShoppingMallController.h"

// Views
#import "ZWBDetailShufflingHeadView.h"
#import "ZWBDetailFooterView.h"
#import "ZWBDetailHeaderCell.h"
#import "ZWBDetailCommentCell.h"
#import "ZWBDetailStoreCell.h"
#import "ZWBDetailContentCell.h"

// Ohters
static NSString *ZWBDetailHeaderCellID  = @"ZWBDetailHeaderCell";
static NSString *ZWBDetailCommentCellID = @"ZWBDetailCommentCell";
static NSString *ZWBDetailStoreCellID   = @"ZWBDetailStoreCell";
static NSString *ZWBDetailContentCellID = @"ZWBDetailContentCell";

@interface ZWBDetailShoppingMallController ()

@property (nonatomic, strong) ZWBDetailFooterView *footerView;
@property (nonatomic, strong) ZWBDetailShufflingHeadView *headerView;

@end

@implementation ZWBDetailShoppingMallController

#pragma mark - Initinal
- (void)viewDidLoad {
    [super viewDidLoad];

    [self seupBase];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - Init
- (void)seupBase {
    // 头视图
    ZWBDetailShufflingHeadView *headerView = [[ZWBDetailShufflingHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [headerView setBackBlock:^(void){
        
    }];
    headerView.width = SCREEN_WIDTH;
    self.headerView = headerView;
    self.tableView.tableHeaderView = headerView;
    
    ZWBDetailFooterView *footerView = [[ZWBDetailFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    [footerView setClickFooterBlock:^(NSInteger clickIndex) {
        
    }];
    self.footerView = footerView;
    self.tableView.tableFooterView = footerView;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBDetailHeaderCell" bundle:nil] forCellReuseIdentifier:ZWBDetailHeaderCellID];
    [self.tableView registerClass:[ZWBDetailCommentCell class] forCellReuseIdentifier:ZWBDetailCommentCellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBDetailStoreCell" bundle:nil] forCellReuseIdentifier:ZWBDetailStoreCellID];
    [self.tableView registerClass:[ZWBDetailContentCell class] forCellReuseIdentifier:ZWBDetailContentCellID];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        ZWBDetailHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:ZWBDetailHeaderCellID forIndexPath:indexPath];
        
        cell = headerCell;
    } else if (indexPath.section == 1) {
        ZWBDetailCommentCell *commentCell = [tableView dequeueReusableCellWithIdentifier:ZWBDetailCommentCellID forIndexPath:indexPath];
        
        cell = commentCell;
    } else if (indexPath.section == 2) {
        ZWBDetailStoreCell *storeCell = [tableView dequeueReusableCellWithIdentifier:ZWBDetailStoreCellID forIndexPath:indexPath];
        
        cell = storeCell;
    } else if (indexPath.section == 3) {
        ZWBDetailContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:ZWBDetailContentCellID forIndexPath:indexPath];
        
        cell = contentCell;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 130.0f;
    } else if (indexPath.section == 1) {
        return 44.0f;
    } else if (indexPath.section == 2) {
        return 105.0f;
    } else if (indexPath.section == 3) {
        return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:[ZWBUtil cellContentViewWidth] tableView:tableView];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
