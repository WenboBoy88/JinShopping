//
//  ZWBInputPasswordController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/22.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBInputPasswordController.h"

@interface ZWBInputPasswordController ()

@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;
@property (weak, nonatomic) IBOutlet UITextField *reaptTextField;

@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end

@implementation ZWBInputPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];


}

#pragma mark - Touch Began
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.codeTextField  resignFirstResponder];
    [self.passTextField  resignFirstResponder];
    [self.reaptTextField resignFirstResponder];
}


#pragma mark - Btn Click
/** 返回*/
- (IBAction)backClick:(UIButton *)sender {
    
}
/** 提交*/
- (IBAction)submitClick:(UIButton *)sender {
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
