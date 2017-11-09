//
//  ZWBDetailContentCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/9.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBDetailContentCell.h"

@implementation ZWBDetailContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"图文详情";
    self.titleLabel.textColor = COLOR_333;
    self.titleLabel.font = PFR_FONT(15.0f);
    [self.contentView addSubview:self.titleLabel];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.text = @"图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情图文详情";
    self.contentLabel.textColor = COLOR_666;
    [UILabel changeLineSpaceForLabel:self.contentLabel withSpace:3];
    [self.contentView addSubview:self.contentLabel];
    self.titleLabel.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 12)
    .widthIs(100)
    .heightIs(24.0f);
    self.contentLabel.sd_layout
    .topSpaceToView(self.titleLabel, 10)
    .leftSpaceToView(self.contentView, 12)
    .rightSpaceToView(self.contentView, 12)
    .autoWidthRatio(0);
    
    [self.contentLabel setMaxNumberOfLinesToShow:0];
    self.contentLabel.isAttributedContent = YES;
    [self setupAutoHeightWithBottomView:self.contentLabel bottomMargin:10];
    [self updateLayout];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
