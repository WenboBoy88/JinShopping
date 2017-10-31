//
//  ZWBForgetPasswordController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/22.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBForgetPasswordController.h"

@interface ZWBForgetPasswordController ()

@property (weak, nonatomic) IBOutlet UIButton *sendMessageBtn;
@property (weak, nonatomic) IBOutlet UITextField *telTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;

@end

@implementation ZWBForgetPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];

    
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
/** 返回立即登录*/
- (IBAction)loginClick:(UIButton *)sender {
    
}
// 发送并下一步
- (IBAction)sendMessageClick:(UIButton *)sender {
    
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
