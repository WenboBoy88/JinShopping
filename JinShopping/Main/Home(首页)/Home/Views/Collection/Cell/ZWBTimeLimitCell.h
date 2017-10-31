//
//  ZWBTimeLimitCell.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/18.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWBTimeLimitView.h"

@interface ZWBTimeLimitCell : UITableViewCell

@property (weak, nonatomic) IBOutlet ZWBTimeLimitView *timeLimitView;

@property (weak, nonatomic) IBOutlet UILabel *storeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *storeDesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *storeImageView;

@property (weak, nonatomic) IBOutlet UILabel *buyTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyDesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *buyImageView;

@end
