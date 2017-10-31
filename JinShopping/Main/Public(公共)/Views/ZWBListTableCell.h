//
//  ZWBListTableCell.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/23.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWBListTableCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier isShowLogoImageView:(BOOL)isShow;

/** 标题*/
@property (nonatomic, strong) UIImageView *logoImageView;
/** 名称*/
@property (nonatomic, strong) UILabel *titleLabel;
/** 副标题*/
@property (nonatomic, strong) UILabel *desLabel;
/** 右边箭头*/
@property (nonatomic, strong) UIImageView *goImageView;


@end
