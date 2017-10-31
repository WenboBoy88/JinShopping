//
//  ZWBTakeoutEvalCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTakeoutEvalCell.h"

@interface ZWBTakeoutEvalCell ()
/** 头像*/
@property (nonatomic, strong) UIImageView *iconImage;
/** 名称*/
@property (nonatomic, strong) UILabel *titleLabel;
/** 内容*/
@property (nonatomic, strong) UILabel *contentLabel;
/** 展示图片*/
@property (nonatomic, strong) ZWBPhotosContainerView *photosView;

@end

@implementation ZWBTakeoutEvalCell

#pragma mark - Init
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 设置界面
        [self setupUI];
        // 布局
        [self setupAutoLayout];
    }
    return self;
}


#pragma mark - 创建UI
- (void)setupUI {
    self.contentView.backgroundColor = COLOR_CLEAR;
    
    UIImageView *iconView = [[UIImageView alloc] init];\
    iconView.layer.masksToBounds = YES;
    [self.contentView addSubview:iconView];
    self.iconImage = iconView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = PFR_FONT(14.0f);
    titleLabel.textColor = COLOR_MAIN_COLOR;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = PFR_FONT(14.0f);
    contentLabel.textColor = COLOR_333;
    contentLabel.numberOfLines = 0;
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    ZWBPhotosContainerView *photosView = [[ZWBPhotosContainerView alloc] initWithMaxItemsCount:9];
    [self.contentView addSubview:photosView];
    self.photosView = photosView;
}

#pragma mark - 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)setupAutoLayout {
    self.iconImage.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 15)
    .widthIs(20)
    .heightEqualToWidth();
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.iconImage, 12)
    .centerYEqualToView(self.iconImage)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(20);
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.iconImage, 10)
    .leftEqualToView(self.iconImage)
    .leftEqualToView(self.titleLabel)
    .autoHeightRatio(0);
    [self.contentLabel setMaxNumberOfLinesToShow:4];
    
    self.photosView.sd_layout
    .leftEqualToView(self.contentLabel)
    .rightEqualToView(self.contentLabel)
    .topSpaceToView(self.contentLabel, 10);
    
}


#pragma mark - Getter Setter Methods
- (void)setEvalModel:(ZWBTakeoutEvalModel *)evalModel {
    _evalModel = evalModel;
    
//    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:evalModel.iconPath] placeholderImage:IMAGE(@"")];
//    self.titleLabel.text = evalModel.title;
//    self.contentLabel.text = evalModel.content;
//
//    UIView *bottomView = self.contentLabel;
//    self.photosView.photoNamesArray = evalModel.imagePathsArray;
//    if (evalModel.imagePathsArray.count > 0) {
//        self.photosView.hidden = NO;
//        bottomView = self.photosView;
//    } else {
//        self.photosView.hidden = YES;
//    }
//
//    [self setupAutoHeightWithBottomView:bottomView bottomMargin:10];
    
}


#pragma mark - Getter Setter Methods


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
