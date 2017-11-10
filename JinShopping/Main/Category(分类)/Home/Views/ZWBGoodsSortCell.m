//
//  ZWBGoodsSortCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/10.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBGoodsSortCell.h"

@interface ZWBGoodsSortCell ()

/* imageView */
@property (nonatomic, strong) UIImageView *goodsImageView;
/* label */
@property (nonatomic, strong) UILabel *goodsTitleLabel;

@end

@implementation ZWBGoodsSortCell

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}
#pragma mark - UI
- (void)setupUI
{
    self.backgroundColor = COLOR_MAIN_BG;
    self.goodsImageView = [[UIImageView alloc] init];
    self.goodsImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.goodsImageView];
    
    self.goodsTitleLabel = [[UILabel alloc] init];
    self.goodsTitleLabel.font = PFR_FONT(13.0f);
    self.goodsTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.goodsTitleLabel];
    
}
#pragma mark - 布局
- (void)layoutSubviews {
//    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self);
//        [make.top.mas_equalTo(self)setOffset:5];
//        make.size.mas_equalTo(CGSizeMake(self.dc_width * 0.85, self.dc_width * 0.85));
//    }];
//
//    [_goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        [make.top.mas_equalTo(_goodsImageView.mas_bottom)setOffset:5];
//        make.width.mas_equalTo(_goodsImageView);
//        make.centerX.mas_equalTo(self);
//    }];
}


#pragma mark - Setter Getter Methods
- (void)setSubModel:(ZWBGoodsSubItemModel *)subModel {
    _subModel = subModel;
    if ([subModel.image_url containsString:@"http"]) {
        [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:subModel.image_url] placeholderImage:IMAGE(@"")];
    }else{
        self.goodsImageView.image = IMAGE(subModel.image_url);
    }
    self.goodsTitleLabel.text = subModel.goods_title;

}

@end
