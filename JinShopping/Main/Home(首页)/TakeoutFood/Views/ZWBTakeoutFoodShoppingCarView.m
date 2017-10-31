//
//  ZWBTakeoutFoodShoppingCartView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutFoodShoppingCarView.h"

@interface ZWBTakeoutFoodShoppingCarView ()

@end

@implementation ZWBTakeoutFoodShoppingCarView

#pragma mark - Initinal
- (instancetype)initWithFrame:(CGRect)frame parentView:(UIView *)parentView {
    if (self = [super initWithFrame:frame]) {
        // 背景图层
        self.parentView = parentView;
        // 设置界面
        [self setupUI];
    }
    return self;
}

#pragma mark - 设置界面
- (void)setupUI {
    self.backgroundColor = COLOR_333;
    // 最低起送价格
    self.minFreeMoney = 20;
    // 分割线
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    self.lineView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.lineView.layer.borderWidth = 0.25;
    [self addSubview:self.lineView];
    
    //购物金额提示框
    self.moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, self.bounds.size.width -140, 30)];
    [self.moneyLabel setTextColor:[UIColor grayColor]];
    [self.moneyLabel setText:@"购物车空空如也~"];
    [self.moneyLabel setFont:[UIFont systemFontOfSize:13.0]];
    [self addSubview:self.moneyLabel];
    
    //结账按钮
    self.payButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.payButton.frame = CGRectMake(self.bounds.size.width - 100, 5, 90,35);
    [self.payButton addTarget:self action:@selector(payClick:) forControlEvents:UIControlEventTouchUpInside];
    self.payButton.layer.cornerRadius = 5;
    self.payButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.payButton.backgroundColor = [UIColor lightGrayColor];
    [self.payButton setTitle:[NSString stringWithFormat:@"还差￥%ld",(unsigned long)self.minFreeMoney] forState:UIControlStateNormal];
    self.payButton.enabled = NO;
    [self addSubview:self.payButton];
    
    //购物车
    self.shoppingCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.shoppingCarBtn setUserInteractionEnabled:NO];
    [self.shoppingCarBtn setBackgroundImage:[UIImage imageNamed:@"gouwuche"] forState:UIControlStateNormal];
    self.shoppingCarBtn.frame = CGRectMake(10, -10, 50,50);
    [self.shoppingCarBtn addTarget:self action:@selector(shoppingCarClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.shoppingCarBtn];
    
    //小圆点
    self.badgeView = [[ZWBBadgeView alloc] initWithFrame:CGRectMake(self.shoppingCarBtn.frame.size.width - 18, 5, 18, 18) withString:nil];
    [self.shoppingCarBtn addSubview:self.badgeView];
    self.badgeView.hidden = YES;
    
    int maxHeight = self.parentView.frame.size.height - 250;
    self.goodsListView = [[ZWBGoodsListView alloc] initWithFrame:CGRectMake(0,self.parentView.bounds.size.height - maxHeight, self.bounds.size.width, maxHeight) withOrderArr:nil canReorder:YES];
    
    self.overlayView = [[ZWBOverlayView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 50)];
    self.overlayView.shoppingCarView = self;
    [self.overlayView addSubview:self];
    [self.parentView addSubview:self.overlayView];
    self.overlayView.alpha = 0.0;
    // 初始化为不点击状态
    self.isOpen = NO;
}

#pragma mark - Button Click
// 支付
- (void)payClick:(UIButton *)button {
    NSLog(@"%@", self.goodsListView.orderArr);
}

// 购物车
- (void)shoppingCarClick:(UIButton *)button {
    if (self.badgeValue <= 0) {
        [self.shoppingCarBtn setUserInteractionEnabled:NO];
        return;
    }
    
    [self updateFrame:self.goodsListView];
    [self.overlayView addSubview:self.goodsListView];
    WeakSelf(self);
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint point = self.shoppingCarBtn.center;
        CGPoint labelPoint = self.moneyLabel.center;
        point.y -= (self.goodsListView.frame.size.height + 50);
        labelPoint.x -= 60;
        weakSelf.overlayView.alpha = 1.0;
        [weakSelf.shoppingCarBtn setCenter:point];
        [weakSelf.moneyLabel setCenter:labelPoint];
    } completion:^(BOOL finished) {
        weakSelf.isOpen = YES;
    }];
}

#pragma  mark - 计算价格
- (void)setTotalMoney:(CGFloat)nTotal {
    self.nTotal = nTotal;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    NSString *amount = [formatter stringFromNumber:[NSNumber numberWithFloat:nTotal]];
    
    if(self.nTotal > 0) {
        self.moneyLabel.font = [UIFont systemFontOfSize:20.0f];
        self.moneyLabel.textColor = [UIColor redColor];
        self.moneyLabel.text = [NSString stringWithFormat:@"共￥%@",amount];
        CGFloat value = self.minFreeMoney - self.nTotal;
        if (value > 0) {
            self.payButton.enabled = NO;
            [self.payButton setTitle:[NSString stringWithFormat:@"还差￥%ld",(long)value] forState:UIControlStateNormal];
            [self.payButton setBackgroundColor:[UIColor grayColor]];
        } else {
            self.payButton.enabled = YES;
            [self.payButton setTitle:@"选好了" forState:UIControlStateNormal];
            [self.payButton setBackgroundColor:[UIColor redColor]];
        }
        [self.shoppingCarBtn setUserInteractionEnabled:YES];
    } else {
        [self.moneyLabel setTextColor:[UIColor grayColor]];
        [self.moneyLabel setText:@"购物车空空如也~"];
        [self.moneyLabel setFont:[UIFont systemFontOfSize:13.0]];
        
        self.payButton.enabled = NO;
        [self.payButton setTitle:[NSString stringWithFormat:@"还差￥%ld",(unsigned long)self.minFreeMoney] forState:UIControlStateNormal];
        [self.payButton setBackgroundColor:[UIColor grayColor]];
        
        [self.shoppingCarBtn setUserInteractionEnabled:NO];
    }
    
}

#pragma mark - Getter Setter Methods
// 设置显示个数的标签
- (void)setBadgeValue:(NSInteger)badgeValue{
    _badgeValue = badgeValue;
    
    self.badgeView.badgeValue = [NSString stringWithFormat:@"%lu",(unsigned long)badgeValue];
    if (badgeValue > 0)
        self.badgeView.hidden = NO;
    else
        self.badgeView.hidden = YES;
}


#pragma mark - 更新Frame
- (void)updateFrame:(ZWBGoodsListView *)goodsListView {
    if(goodsListView.orderArr.count == 0){
        [self dismissAnimated:YES];
        return;
    }
    
    float height = 0;
    height = [goodsListView.orderArr count] * 50;
    int maxHeight = self.parentView.frame.size.height - 250;
    if (height >= maxHeight) {
        height = maxHeight;
    }
    
    float orignY = self.goodsListView.frame.origin.y;
    
    self.goodsListView.frame = CGRectMake(self.goodsListView.frame.origin.x, self.parentView.bounds.size.height - height - 50, self.goodsListView.frame.size.width, height);
    float currentY = self.goodsListView.frame.origin.y;
    
    if (self.isOpen) {
        WeakSelf(self);
        [UIView animateWithDuration:0.5 animations:^{
            CGPoint point = self.shoppingCarBtn.center;
            point.y -= orignY - currentY;
            [weakSelf.shoppingCarBtn setCenter:point];
        } completion:^(BOOL finished) {
            
        }];
    }
}

#pragma mark - Dismiss Animation
- (void)dismissAnimated:(BOOL)animated {
    
    [self.shoppingCarBtn bringSubviewToFront:self.overlayView];
    WeakSelf(self);
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.overlayView.alpha = 0.0;
        weakSelf.shoppingCarBtn.frame = CGRectMake(10, -10, 50, 50);
        weakSelf.moneyLabel.frame = CGRectMake(70, 10, self.bounds.size.width, 30);
    } completion:^(BOOL finished) {
        weakSelf.isOpen = NO;
    }];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
