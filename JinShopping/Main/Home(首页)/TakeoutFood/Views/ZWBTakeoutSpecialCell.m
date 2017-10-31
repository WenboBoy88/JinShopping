//
//  ZWBTakeoutSpecialCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/30.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutSpecialCell.h"

@interface ZWBTakeoutSpecialCell () {
    
}

@end

@implementation ZWBTakeoutSpecialCell

#pragma mark - Initinal
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化操作
        [self setupBase];
        // 布局
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - 初始化界面
- (void)setupBase {
    UIImageView *showImageView = [[UIImageView alloc] initWithImage:IMAGE(@"waimai_zhekou")];
    [self.contentView addSubview:showImageView];
    self.showImageView = showImageView;
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = PFR_FONT(15.0f);
    titleLabel.textColor = COLOR_333;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

#pragma mark - 布局
- (void)setupAutoLayout {
    
    self.titleLabel.sd_layout
    .topSpaceToView(self.contentView, 8)
    .leftSpaceToView(self.contentView, 12)
    .bottomSpaceToView(self.contentView, 8);
    [self.titleLabel setSingleLineAutoResizeWithMaxWidth:200.0f];
    
    self.showImageView.sd_layout
    .centerYEqualToView(self.titleLabel)
    .leftSpaceToView(self.titleLabel, 8)
    .widthIs(16)
    .autoHeightRatio(1.0);
    
    [self setupAutoHeightWithBottomView:self.titleLabel bottomMargin:0];
    [self layoutSubviews];
    
}

#pragma mark - Getter Setter Methods

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
