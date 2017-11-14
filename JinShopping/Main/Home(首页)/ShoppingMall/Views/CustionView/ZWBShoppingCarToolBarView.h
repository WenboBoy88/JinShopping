//
//  ZWBShoppingCarToolBarView.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/14.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBShoppingCarToolBarView : UIView

//结算
@property (nonatomic, strong) UIButton *balanceButton;
//全选
@property (nonatomic, strong) UIButton *selectAllButton;
//价格
@property (nonatomic, retain) UILabel *allMoneyLabel;
//删除
@property (nonatomic, strong) UIButton *deleteButton;

@property (nonatomic, assign) float money;


@end
