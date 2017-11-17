//
//  ZWBShoppingCarCell.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWBShoppingCarModel.h"


@class ZWBShoppingCarCell;
@protocol ZWBShoppingCarCellDelegate <NSObject>

@optional
- (void)clickButton:(UIButton *)button superView:(ZWBShoppingCarCell *)cell  selected:(BOOL)selected indexPath:(NSIndexPath *)indexPath;
- (void)operationSymbol:(UIButton *)button quantityCount:(NSInteger)quantityCount;

@end

@interface ZWBShoppingCarCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *selectGoodsButton;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, assign) id<ZWBShoppingCarCellDelegate> delegate;

@property (nonatomic, strong) ZWBShoppingCarModel *model;

@property (nonatomic, copy) void(^numberChangeBlock)(NSInteger numCount);

@end
