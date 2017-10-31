//
//  ZWBPhotosContainerView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBPhotosContainerView : UIView

- (instancetype)initWithMaxItemsCount:(NSInteger)count;

@property (nonatomic, strong) NSArray *photoNamesArray;

@property (nonatomic, assign) NSInteger maxItemsCount;


@end
