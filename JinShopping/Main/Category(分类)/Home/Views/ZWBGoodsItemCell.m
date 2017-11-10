//
//  ZWBGoodsItemCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/10.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBGoodsItemCell.h"

@interface ZWBGoodsItemCell ()

/* 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/* 指示View */
@property (nonatomic, strong) UIView *indicatorView;

@end


@implementation ZWBGoodsItemCell

#pragma mark - Intial
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupUI];
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

#pragma mark - UI
- (void)setupUI
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = PFR_FONT(15.0f);
    [self addSubview:self.titleLabel];
    
    self.indicatorView = [[UIView alloc] init];
    self.indicatorView.hidden = NO;
    self.indicatorView.backgroundColor = [UIColor redColor];
    [self addSubview:self.indicatorView];
}

#pragma mark - 布局
- (void)layoutSubviews {
    [super layoutSubviews];
//    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(self);
//    }];
//
//    [_indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self);
//        make.top.mas_equalTo(self);
//        make.height.mas_equalTo(self);
//        make.width.mas_equalTo(5);
//    }];
}


#pragma mark - Setter Getter Methods
- (void)setItemModel:(ZWBGoodsItemModel *)itemModel {
    _itemModel = itemModel;
    
    self.titleLabel.text = itemModel.title;
}

#pragma mark - cell点击
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        _indicatorView.hidden = NO;
        _titleLabel.textColor = [UIColor redColor];
        self.backgroundColor = [UIColor whiteColor];
    } else {
        _indicatorView.hidden = YES;
        _titleLabel.textColor = [UIColor blackColor];
        self.backgroundColor = [UIColor clearColor];
    }
}

@end
