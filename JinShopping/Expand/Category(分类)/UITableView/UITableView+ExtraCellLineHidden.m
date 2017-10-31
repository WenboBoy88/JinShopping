//
//  UITableView+ExtraCellLineHidden.m
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/9.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "UITableView+ExtraCellLineHidden.h"

@implementation UITableView (ExtraCellLineHidden)

- (void)setExtraCellLineHidden {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    self.tableFooterView = view;
}

@end
