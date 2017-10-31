//
//  ZWBTakeoutFoodShoppingCartView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWBBadgeView.h"
#import "ZWBOverlayView.h"
#import "ZWBGoodsListView.h"

@interface ZWBTakeoutFoodShoppingCarView : UIView

/** 显示个数的View*/
@property (nonatomic, strong) ZWBBadgeView *badgeView;
/** 遮罩层*/
@property (nonatomic, strong) ZWBOverlayView *overlayView;
/** 商品列表*/
@property (nonatomic, strong) ZWBGoodsListView *goodsListView;

/** ga*/
@property (nonatomic, strong) UIButton *shoppingCarBtn;
/** 结算按钮*/
@property (nonatomic, strong) UIButton *payButton;
/** 价格*/
@property (nonatomic, strong) UILabel *moneyLabel;
/** 分割线*/
@property (nonatomic, strong) UIView *lineView;
/** 背景图层*/
@property (nonatomic, strong) UIView *parentView;
/** 是否点击购物车*/
@property (nonatomic, assign) BOOL isOpen;
/** 显示的个数*/
@property (nonatomic, assign) NSInteger badgeValue;
/** 最低起送价格*/
@property (nonatomic, assign) NSUInteger minFreeMoney;
/** 总价*/
@property (nonatomic, assign) CGFloat nTotal;

/** 初始化操作*/
- (instancetype)initWithFrame:(CGRect)frame parentView:(UIView *)parentView;
/** 消除动画*/
- (void)dismissAnimated:(BOOL)animated;
/** 设置价格*/
- (void)setTotalMoney:(CGFloat)nTotal;
/** 更新Frame*/
- (void)updateFrame:(ZWBGoodsListView *)goodsListView;

@end
