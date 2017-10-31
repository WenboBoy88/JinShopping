//
//  ZWBMineSectionItemModel.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/20.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseModel.h"

@interface ZWBMineSectionItemModel : ZWBBaseModel

/** 区头*/
@property (nonatomic, copy) NSString *section;
/** 图片名称*/
@property (nonatomic, copy) NSString *image;
/** 标题*/
@property (nonatomic, copy) NSString *title;
/** 最后一行显示的个数*/
@property (nonatomic, copy) NSNumber *count;
/** tag*/
@property (nonatomic, copy) NSNumber *tag;
/** 是否显示最后一行的信息*/
@property (nonatomic, assign) BOOL isHiddenLastInfo;

@end
