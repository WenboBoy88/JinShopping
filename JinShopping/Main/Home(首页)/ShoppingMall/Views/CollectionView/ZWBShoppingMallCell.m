//
//  ZWBShoppingMallCell.m
//  CDDMall
//
//  Created by apple on 2017/6/14.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "ZWBShoppingMallCell.h"

// Controllers

// Models

// Views

// Vendors
#import <UIImageView+WebCache.h>

// Categories

// Others

@interface ZWBShoppingMallCell ()

/* 商品图片 */
@property (strong , nonatomic) UIImageView *gridImageView;
/* 商品标题 */
@property (strong , nonatomic) UILabel *gridLabel;
/* 价格 */
@property (strong , nonatomic) UILabel *priceLabel;
/* 销售数量 */
@property (strong , nonatomic) UILabel *saleNumLabel;

@end

@implementation ZWBShoppingMallCell

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    self.gridImageView = [[UIImageView alloc] init];
    self.gridImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.gridImageView];
    
    self.gridLabel = [[UILabel alloc] init];
    self.gridLabel.font = PFR_FONT(14.0f);
    self.gridLabel.numberOfLines = 1;
    [self addSubview:self.gridLabel];
    
    self.priceLabel = [[UILabel alloc] init];
    self.priceLabel.font = PFR_FONT(13.0f);
    self.priceLabel.textColor = [UIColor redColor];
    [self addSubview:self.priceLabel];
    
    self.saleNumLabel = [[UILabel alloc] init];
    NSInteger pNum = arc4random() % 10000;
    self.saleNumLabel.text = [NSString stringWithFormat:@"已售%zd单",pNum];
    self.saleNumLabel.font = PFR_FONT(14.0f);
    self.saleNumLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:self.saleNumLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    [_gridImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self);
//        [make.top.mas_equalTo(self)setOffset:DCMargin];
//        make.size.mas_equalTo(CGSizeMake(self.dc_width * 0.8, self.dc_width * 0.8));
//    }];
//
//    [_autotrophyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        [make.left.mas_equalTo(self)setOffset:DCMargin];
//        [make.top.mas_equalTo(_gridImageView.mas_bottom)setOffset:DCMargin];
//    }];
//
//    [_gridLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self);
//        make.centerY.mas_equalTo(_autotrophyImageView);
//        [make.right.mas_equalTo(self)setOffset:-DCMargin];
//    }];
//
//    [_freeSuitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_autotrophyImageView);
//        [make.top.mas_equalTo(_gridLabel.mas_bottom)setOffset:2];
//    }];
//
//    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_autotrophyImageView);
//        [make.top.mas_equalTo(_freeSuitImageView.mas_bottom)setOffset:2];
//    }];
//
//    [_commentNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_autotrophyImageView);
//        [make.top.mas_equalTo(_priceLabel.mas_bottom)setOffset:2];
//    }];

    
}

#pragma mark - Setter Getter Methods
- (void)setMallModel:(ZWBShoppingMallModel *)mallModel {
    _mallModel = mallModel;
    [_gridImageView sd_setImageWithURL:[NSURL URLWithString:mallModel.image_url]];
    _priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[mallModel.price floatValue]];
    _gridLabel.text = mallModel.main_title;
    //首行缩进
    [ZWBSpeedy zwb_setupLabel:_gridLabel content:mallModel.main_title indentationFortheFirstLineWith:_gridLabel.font.pointSize * 3.5];
}


@end
