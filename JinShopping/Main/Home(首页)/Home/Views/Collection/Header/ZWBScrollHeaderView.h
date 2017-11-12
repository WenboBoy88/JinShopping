//
//  ZWBScrollHeaderView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/18.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface ZWBScrollHeaderView : UIView

@property (nonatomic, strong) NSArray *imageURLArr;

@property (nonatomic, copy) NSString *placeHolderImageName;

/** 点击banner图回调*/
@property (nonatomic, copy) void(^clickBannerBlock)(NSInteger clickIndex);


@end
