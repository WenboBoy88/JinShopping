//
//  ZWBInputNormalCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/23.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBInputNormalCell.h"

@implementation ZWBInputNormalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化界面
        [self setupUI];
        // 布局
        [self setupAutoLayout];
        
    }
    return self;
}

#pragma mark - 初始化界面
- (void)setupUI {
    self.contentView.backgroundColor = COLOR_CLEAR;
    
    UILabel *asteriskLabel = [[UILabel alloc] init];
    asteriskLabel.text = @"*";
    asteriskLabel.textColor = COLOR_MAIN_RED;
    asteriskLabel.font = PFR_FONT(12.0f);
    [self.contentView addSubview:asteriskLabel];
    self.asteriskLabel = asteriskLabel;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = PFR_FONT(14.0f);
    titleLabel.textColor = COLOR_333;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UITextField *inputTextField = [[UITextField alloc] init];
    inputTextField.placeholder = @"请输入内容";
    inputTextField.font = PFR_FONT(14.0f);
    inputTextField.textColor = COLOR_666;
    [self.contentView addSubview:inputTextField];
    self.inputTextField = inputTextField;
}

#pragma mark - 布局
- (void)setupAutoLayout {
    self.asteriskLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(5)
    .autoHeightRatio(1.0);
    
    self.titleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.asteriskLabel, 0)
    .widthIs(85)
    .heightIs(24.0f);
    
    self.inputTextField.sd_layout
    .topSpaceToView(self.contentView, 5)
    .leftSpaceToView(self.titleLabel, 15)
    .bottomSpaceToView(self.contentView, 5)
    .rightSpaceToView(self.contentView, 15.0f);
    
    [self setupAutoHeightWithBottomView:self.titleLabel bottomMargin:0];
    [self layoutSubviews];
}


- (void)setCellWithTitle:(NSString *)title content:(NSString *)content inputPlaceholder:(NSString *)placeholder asterisk:(BOOL)isShowAsterisk {
    self.titleLabel.text = title;
    self.inputTextField.text = content;
    self.inputTextField.placeholder = placeholder;
    self.asteriskLabel.hidden = !isShowAsterisk;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
