//
//  ZWBMineHeaderView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/19.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBMineHeaderView.h"
// Controllers

// Models

// Views

// Vendors

// Categories

// Others

@interface ZWBMineHeaderView() {
    
}
// 标题
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
// 标题名称
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
// 手机
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
// 签到按钮
@property (weak, nonatomic) IBOutlet UIButton *signinBtn;

@end

@implementation ZWBMineHeaderView

#pragma mark - Intial
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = COLOR_MAIN_COLOR;
    
    [ZWBSpeedy zwb_setupBezierPathCircularLayerWith:self.headerImageView radiusSize:CGSizeMake(35, 35)];
    // 给签到切角
    [ZWBSpeedy zwb_setupBezierPathCircularLayerWith:self.signinBtn radiusSize:CGSizeMake(24, 13)];
}

#pragma mark - Action
// 签到
- (IBAction)signinButton:(UIButton *)sender {
    NSLog(@"签到");
    !self.signinBlock ? : self.signinBlock();
}

// 点击头部
- (IBAction)tapHeaderViewClick:(UITapGestureRecognizer *)sender {
    NSLog(@"点击头部");
    !self.tapHeaderBlock ? : self.tapHeaderBlock();

}

@end
