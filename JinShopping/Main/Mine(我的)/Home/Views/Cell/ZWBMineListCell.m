//
//  ZWBMineListCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/21.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBMineListCell.h"

@interface ZWBMineListCell ()

/** 标题*/
@property (nonatomic, strong) UIImageView *logoImageView;
/** 名称*/
@property (nonatomic, strong) UILabel *titleLabel;
/** 界面*/
@property (nonatomic, strong) UIImageView *goImageView;

@end

@implementation ZWBMineListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

#pragma mark - Initinal
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
}

#pragma mark - 布局
- (void)setupAutoLayout {
    self.logoImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(20)
    .autoHeightRatio(1.0);
    
    self.goImageView.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, 15)
    .widthIs(9)
    .autoHeightRatio(1.6);
    
    self.titleLabel.sd_layout
    .topSpaceToView(self.contentView, 8)
    .leftSpaceToView(self.logoImageView, 10)
    .bottomSpaceToView(self.contentView, 8)
    .rightSpaceToView(self.goImageView, 10);
    
    [self setupAutoHeightWithBottomView:self.titleLabel bottomMargin:0];
    [self layoutSubviews];
}

#pragma mark - Setter Getter Methods
- (void)setItemModel:(ZWBMineSectionItemModel *)itemModel {
    _itemModel = itemModel;
    
    self.logoImageView.image = IMAGE(itemModel.image);
    self.titleLabel.text = itemModel.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
