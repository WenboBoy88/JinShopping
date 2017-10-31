//
//  ZWBHomeNavSearchBarView.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/18.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBHomeNavSearchBarView : UIView


/** 提示字*/
@property (nonatomic, copy) NSString *placeholder;

/** 语音点击回调Block */
@property (nonatomic, copy) dispatch_block_t voiceButtonClickBlock;
/** 搜索 */
@property (nonatomic, copy) dispatch_block_t searchViewBlock;


@end
