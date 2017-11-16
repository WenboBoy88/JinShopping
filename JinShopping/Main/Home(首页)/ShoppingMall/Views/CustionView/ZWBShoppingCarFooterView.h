//
//  ZWBShoppingCarFooterView.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/14.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWBShoppingCarModel.h"

@interface ZWBShoppingCarFooterView : UITableViewHeaderFooterView

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) NSMutableArray *shopGoodsArray;

+ (CGFloat)getCartFooterHeight;

@end
