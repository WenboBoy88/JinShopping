//
//  ZWBDetailCommentCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/9.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBDetailCommentCell.h"

@interface ZWBDetailCommentCell ()



@end

@implementation ZWBDetailCommentCell

#pragma mark - Initinal
- (void)awakeFromNib {
    [super awakeFromNib];

}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)setupUI {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = PFR_FONT(14.0f);
    self.titleLabel.textColor = COLOR_666;
    [self.contentView addSubview:self.titleLabel];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.text = @"查看全部";
    contentLabel.font = PFR_FONT(14.0f);
    contentLabel.textColor = COLOR_666;
    [self.contentView addSubview:contentLabel];

    UIImageView *accessoryView = [[UIImageView alloc] initWithImage:IMAGE(@"youjian")];
    [self.contentView addSubview:accessoryView];
    
    accessoryView.sd_layout
    .rightSpaceToView(self.contentView, 12)
    .centerYEqualToView(self.contentView)
    .widthIs(16)
    .heightEqualToWidth();
    contentLabel.sd_layout
    .rightSpaceToView(accessoryView, 2)
    .centerYEqualToView(accessoryView)
    .widthIs(80)
    .heightIs(22);
    self.titleLabel.sd_layout
    .topSpaceToView(self.contentView, 12)
    .leftSpaceToView(self.contentView, 12)
    .bottomSpaceToView(self.contentView, 12)
    .rightSpaceToView(contentLabel, 10);
    [self setupAutoHeightWithBottomView:self.titleLabel bottomMargin:0];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
