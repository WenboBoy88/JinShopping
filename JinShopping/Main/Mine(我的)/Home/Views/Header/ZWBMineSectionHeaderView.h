//
//  ZWBMineSectionHeaderView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/19.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBMineSectionHeaderView : UIView

@property (nonatomic, copy) dispatch_block_t clickBlock;

@property (nonatomic, assign) NSInteger section;

@property (nonatomic, strong) NSDictionary *infoDict;

@end
