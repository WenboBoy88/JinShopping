//
//  ZWBIntegralMallItemFooterView.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/12.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBIntegralMallItemFooterView : UICollectionReusableView

@property (nonatomic, copy) void (^moreButtonClickBlock)(NSInteger clickIndex);

@end
