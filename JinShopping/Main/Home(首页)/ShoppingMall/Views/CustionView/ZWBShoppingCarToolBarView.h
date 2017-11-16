//
//  ZWBShoppingCarToolBarView.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/14.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZWBShoppingCarToolBarDelegate <NSObject>

@required

@optional
/** 点击全选按钮的操作*/
- (void)selectAllButtonClick:(BOOL)isSelected;
/** 点击结算按钮的操作*/
- (void)balanceButtonClick;
/** 删除物品的操作*/
- (void)deleteSelectGoodsClick;

@end

@interface ZWBShoppingCarToolBarView : UIView

//结算
@property (nonatomic, strong) UIButton *balanceButton;
//全选
@property (nonatomic, strong) UIButton *selectAllButton;
//删除
@property (nonatomic, strong) UIButton *deleteButton;
//价格
@property (nonatomic, retain) UILabel *allMoneyLabel;

@property (nonatomic, assign) id<ZWBShoppingCarToolBarDelegate> delegate;

@property (nonatomic, assign) float money;


@end
