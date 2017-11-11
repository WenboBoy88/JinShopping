//
//  ZWBGoodsItemModel.h
//  JinShopping
//
//  Created by 张文博 on 2017/11/10.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseModel.h"

@interface ZWBGoodsItemModel : ZWBBaseModel

/** 文标题  */
@property (nonatomic, copy ,readonly) NSString *title;
/** plist  */
@property (nonatomic, copy ,readonly) NSString *fileName;


@end
