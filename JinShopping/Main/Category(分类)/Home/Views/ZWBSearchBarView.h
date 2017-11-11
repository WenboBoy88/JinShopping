//
//  ZWBSearchBarView.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/11.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, SearchViewType) {
    ShowImage,
    ShowButton
};


@interface ZWBSearchBarView : UIView


- (instancetype)initWithFrame:(CGRect)frame searchViewType:(SearchViewType)showType;

@property (nonatomic, assign) SearchViewType showType;

/** 搜索 */
@property (nonatomic, copy) dispatch_block_t selectTypeBlock;


@end
