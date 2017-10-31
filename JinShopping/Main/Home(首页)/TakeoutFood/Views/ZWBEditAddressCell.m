//
//  ZWBEditAddressCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/30.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBEditAddressCell.h"

@implementation ZWBEditAddressCell

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
    
    self.isSelected = YES;
    
    UIImageView *selectImageView = [[UIImageView alloc] initWithImage:IMAGE(@"selectedPay")];
    [self.contentView addSubview:selectImageView];
    self.selectImageView = selectImageView;
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = PFR_FONT(15.0f);
    titleLabel.textColor = COLOR_333;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

#pragma mark - 布局
- (void)setupAutoLayout {
    
    self.selectImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, 12)
    .widthIs(16)
    .autoHeightRatio(1.0);

    self.titleLabel.sd_layout
    .topSpaceToView(self.contentView, 8)
    .leftSpaceToView(self.selectImageView, 8)
    .bottomSpaceToView(self.contentView, 8)
    .rightSpaceToView(self.contentView, 12);

    [self setupAutoHeightWithBottomView:self.titleLabel bottomMargin:0];
    [self layoutSubviews];
    
}

#pragma mark - Getter Setter Methods
- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    
    if (isSelected) {
        self.selectImageView.image = IMAGE(@"selectedPay");
    } else {
        self.selectImageView.image = IMAGE(@"unSelectedPay");
    }
    
    if (self.selectStatusBlock) {
        self.selectStatusBlock(isSelected);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.isSelected = selected;
    // Configure the view for the selected state
}

@end
