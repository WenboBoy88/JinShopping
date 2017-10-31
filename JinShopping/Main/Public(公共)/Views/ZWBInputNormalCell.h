//
//  ZWBInputNormalCell.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/23.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBInputNormalCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
/** 重要提示*/
@property (nonatomic, strong) UILabel *asteriskLabel;
/** 标题*/
@property (nonatomic, strong) UILabel *titleLabel;
/** 输入框*/
@property (nonatomic, strong) UITextField *inputTextField;

@property (nonatomic, strong) NSIndexPath *indexPath;


/**
 填充数据模型

 @param title 标题
 @param content 输入框内容
 @param placeholder 输入框占位符
 @param isShowAsterisk 是否显示必填项 YES显示 NO不显示
 */
- (void)setCellWithTitle:(NSString *)title content:(NSString *)content inputPlaceholder:(NSString *)placeholder asterisk:(BOOL)isShowAsterisk;


@end
