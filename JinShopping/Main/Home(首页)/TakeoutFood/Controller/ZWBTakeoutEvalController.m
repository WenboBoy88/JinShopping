//
//  ZWBTakeoutEvalController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutEvalController.h"
// Controller

// Views
#import "ZWBTakeoutEvalCell.h"
// Model

// Other
static NSString *ZWBTakeoutEvalCellID = @"ZWBTakeoutEvalCell";

@interface ZWBTakeoutEvalController ()

@end

@implementation ZWBTakeoutEvalController

#pragma mark - Initinal
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupBase];
    
    [self loadData];
}

#pragma mark - 初始化操作

- (void)setupBase {
    self.view.backgroundColor = COLOR_MAIN_BG;
    
    [self.tableView registerClass:[ZWBTakeoutEvalCell class] forCellReuseIdentifier:ZWBTakeoutEvalCellID];
}

#pragma mark - 加载数据
- (void)loadData {
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZWBTakeoutEvalCell *cell = [tableView dequeueReusableCellWithIdentifier:ZWBTakeoutEvalCellID forIndexPath:indexPath];
    cell.evalModel = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView cellHeightForIndexPath:indexPath model:self.dataArray[indexPath.row] keyPath:@"evalModel" cellClass:[ZWBTakeoutEvalCell class] contentViewWidth:[ZWBUtil cellContentViewWidth]];
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
