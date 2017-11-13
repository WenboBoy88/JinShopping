//
//  ZWBPresentListController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/12.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBPresentListController.h"
// Views
#import "ZWBPresentCell.h"
#import "ZWBCommonHeaderView.h" // CommenHeaderView

// Others
static NSString *ZWBPresentCellID = @"ZWBPresentCell";

@interface ZWBPresentListController ()

@property (nonatomic, strong) ZWBCommonHeaderView *headerView;

@end

@implementation ZWBPresentListController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
    
    [self setupUI];
}

- (void)setupNav {
    self.navigationItem.title = @"礼品列表";
    
}

- (void)setupUI {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZWBPresentCell" bundle:nil] forCellReuseIdentifier:ZWBPresentCellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWBPresentCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBPresentCellID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZWBCommonHeaderView *headerView = [[ZWBCommonHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50) titleArr:nil];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 50.0f;
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
