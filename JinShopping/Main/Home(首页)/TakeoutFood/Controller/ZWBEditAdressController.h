//
//  ZWBEditAdressController.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseTableViewController.h"
// Model
#import "ZWBAddressModel.h"

@interface ZWBEditAdressController : ZWBBaseTableViewController

@property (nonatomic, assign) BOOL isEdited;

@property (nonatomic, strong) ZWBAddressModel *model;

@end
