//
//  ZWBListTableCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/23.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBListTableCell.h"

@interface ZWBListTableCell ()


@end

@implementation ZWBListTableCell

#pragma mark - Initinal
- (void)awakeFromNib {
    [super awakeFromNib];

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier isShowLogoImageView:(BOOL)isShow {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化操作
        [self setupBase];
        // 布局
        [self setupAutoLayout:isShow];
        
    }
    return self;
}

#pragma mark - 初始化界面
- (void)setupBase {
    UIImageView *logoImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:logoImageView];
    self.logoImageView = logoImageView;
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = PFR_FONT(15.0f);
    titleLabel.textColor = COLOR_333;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    UIImageView *goImageView = [[UIImageView alloc] init];
    goImageView.image = IMAGE(@"youjian");
    [self.contentView addSubview:goImageView];
    self.goImageView = goImageView;
    UILabel *desLabel = [[UILabel alloc] init];
    desLabel.font = PFR_FONT(15.0f);
    desLabel.textColor = COLOR_666;
    desLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:desLabel];
    self.desLabel = desLabel;
}

#pragma mark - 布局
- (void)setupAutoLayout:(BOOL)isShow {
    if (isShow) {
        self.logoImageView.sd_layout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, 15)
        .widthIs(20)
        .autoHeightRatio(1.0);
    }
    
    self.goImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, 15)
    .widthIs(9)
    .autoHeightRatio(1.6);
    
    self.titleLabel.sd_layout
    .topSpaceToView(self.contentView, 8)
    .leftSpaceToView(self.logoImageView?self.logoImageView:self.contentView, self.logoImageView?10:12)
    .bottomSpaceToView(self.contentView, 8)
    .widthIs(90.0f);
    
    self.desLabel.sd_layout
    .topSpaceToView(self.contentView, 8)
    .leftSpaceToView(self.titleLabel, 10)
    .rightSpaceToView(self.goImageView, 10)
    .bottomSpaceToView(self.contentView, 8);
    
    [self setupAutoHeightWithBottomView:self.titleLabel bottomMargin:0];
    [self layoutSubviews];

}


#pragma mark - 选中
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
