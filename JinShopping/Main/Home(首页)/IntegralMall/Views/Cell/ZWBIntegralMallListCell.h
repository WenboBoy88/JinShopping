//
//  ZWBIntegralMallListCell.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/12.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZWBTimeLimitView.h"

@interface ZWBIntegralMallListCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet ZWBTimeLimitView *newGoodsView;

@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *topSubLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomSubLabel;

@end
