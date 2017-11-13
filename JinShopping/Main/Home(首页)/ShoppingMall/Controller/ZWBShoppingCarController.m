//
//  ZWBShoppingCarController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingCarController.h"
// Views
#import "ZWBUnGoodsCarView.h"

@interface ZWBShoppingCarController ()

/** 暂无图片的提示框*/
@property (nonatomic, strong) ZWBUnGoodsCarView *unGoodsView;

@end

@implementation ZWBShoppingCarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
}

#pragma mark - 初始化导航栏
- (void)setupNav {
    self.navigationItem.title = @"购物车";
    
}

- (void)setupUI {
    
}

#pragma mark - Lazy laod
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
