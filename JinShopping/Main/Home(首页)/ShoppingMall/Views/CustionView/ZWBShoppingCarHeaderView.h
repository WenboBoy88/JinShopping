//
//  ZWBShoppingCarHeaderView.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/14.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZWBShoppingCarHeaderView;
@protocol ZWBShoppingCarHeaderDelegate <NSObject>

@optional
/** 点击头部按钮的操作*/
- (void)clickStoreGoodsButton:(UIButton *)button headerView:(ZWBShoppingCarHeaderView *)currentView section:(NSInteger)section ;

@end


@interface ZWBShoppingCarHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) UIButton *selectStoreGoodsButton;

@property (nonatomic, assign) id<ZWBShoppingCarHeaderDelegate> delegate;

@property (nonatomic, assign) NSInteger section;

@property (nonatomic, assign) BOOL isButtonSelected;

+ (CGFloat)getCartHeaderHeight;


@end
