//
//  ZWBLoginController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/21.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBLoginController.h"
// Controllers
#import "ZWBInputPasswordController.h"
#import "ZWBForgetPasswordController.h"

@interface ZWBLoginController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UITextField *telTextField;
@property (weak, nonatomic) IBOutlet UILabel *passLabel;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *showPassBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ZWBLoginController

#pragma mark - Initinal
- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

#pragma mark - Touch Began
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.telTextField  resignFirstResponder];
    [self.passTextField resignFirstResponder];
}

#pragma mark - Btn Action
/** 返回*/
- (IBAction)backClick:(UIButton *)sender {
    
}

/** 是否显示明文、密文*/
- (IBAction)showPasswordClick:(UIButton *)sender {
    
}
/** 注册*/
- (IBAction)registClick:(UIButton *)sender {

    
}

/** 忘记密码*/
- (IBAction)forgetClick:(UIButton *)sender {
    ZWBForgetPasswordController *forgetVC = [[ZWBForgetPasswordController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
}

/** 登录*/
- (IBAction)loginClick:(UIButton *)sender {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        kKeyWindow.rootViewController = [[ZWBTabBarController alloc] init];
    });
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
