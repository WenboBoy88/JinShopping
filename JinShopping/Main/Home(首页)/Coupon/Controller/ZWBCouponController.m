//
//  ZWBCouponController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/11.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBCouponController.h"

@interface ZWBCouponController ()

@end

@implementation ZWBCouponController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
}

#pragma mark - 初始化导航栏
- (void)setupNav {
    self.navigationItem.title = @"优惠券";
    
}

#pragma mark - 初始化界面
- (void)setupUI {
    
}

#pragma mark - LoadData
- (void)loadData {
    
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
