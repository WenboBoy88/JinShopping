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
@property (nonatomic, strong) UIImageView *gridImageView;
/* 商品标题 */
@property (nonatomic, strong) UILabel *gridLabel;
/* 价格 */
@property (nonatomic, strong) UILabel *priceLabel;
/* 销售数量 */
@property (nonatomic, strong) UILabel *saleNumLabel;
/* 马上兑换 */
@property (nonatomic, strong) UIButton *convertBtn;

@end

@implementation ZWBShoppingMallCell

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化设置
        [self setupBase];
        // 初始化界面
        [self setupUI];
        // 设置布局
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - 初始化设置
- (void)setupBase {
    // 默认隐藏
    self.isHiddenConvertBtn = YES;
}

#pragma mark - UI
- (void)setupUI {
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
    self.saleNumLabel.hidden = !self.isHiddenConvertBtn;
    self.saleNumLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:self.saleNumLabel];
    
    self.convertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.convertBtn.backgroundColor = COLOR_MAIN_RED;
    self.convertBtn.hidden = self.isHiddenConvertBtn;
    [self.convertBtn setTitle:@"马上兑换" forState:UIControlStateNormal];
    [self.convertBtn setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
    self.convertBtn.titleLabel.font = PFR_FONT(14.0f);
    [self.convertBtn addTarget:self action:@selector(convertClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.convertBtn];
}

#pragma mark - AutoLayout
- (void)setupAutoLayout {
    
}

- (void)layoutSubviews {
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

#pragma mark - Button Click
- (void)convertClick:(UIButton *)button {
    if (self.convertClickBlock) {
        self.convertClickBlock();
    }
}

#pragma mark - Setter Getter Methods
// 俩个按钮只能同时显示一个
- (void)setIsHiddenConvertBtn:(BOOL)isHiddenConvertBtn {
    _isHiddenConvertBtn = isHiddenConvertBtn;
    
    self.saleNumLabel.hidden = !isHiddenConvertBtn;
    self.convertBtn.hidden   = isHiddenConvertBtn;
}

- (void)setMallModel:(ZWBShoppingMallModel *)mallModel {
    _mallModel = mallModel;
    [_gridImageView sd_setImageWithURL:[NSURL URLWithString:mallModel.image_url]];
    _priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[mallModel.price floatValue]];
    _gridLabel.text = mallModel.main_title;
    //首行缩进
    [ZWBSpeedy zwb_setupLabel:_gridLabel content:mallModel.main_title indentationFortheFirstLineWith:_gridLabel.font.pointSize * 3.5];
}



@end
