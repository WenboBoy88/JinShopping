//
//  ZWBShoppingCarHeaderView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/14.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingCarHeaderView.h"

@interface ZWBShoppingCarHeaderView ()

@property (nonatomic, strong) UIButton *storeNameButton;

@end

@implementation ZWBShoppingCarHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setHeaderUI];
    }
    return self;
}

- (void)setHeaderUI {
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.selectStoreGoodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectStoreGoodsButton.backgroundColor = [UIColor clearColor];
    [self.selectStoreGoodsButton setImage:[UIImage imageNamed:@"sc_circle_normal"]
                                 forState:UIControlStateNormal];
    [self.selectStoreGoodsButton setImage:[UIImage imageNamed:@"sc_circle_select"]
                                 forState:UIControlStateSelected];
    [self.selectStoreGoodsButton addTarget:self action:@selector(selectShopGoodsClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.selectStoreGoodsButton];
    self.selectStoreGoodsButton.sd_layout
    .centerYEqualToView(self)
    .leftSpaceToView(self, 8)
    .widthIs(22)
    .heightEqualToWidth();
    
    self.storeNameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.storeNameButton.frame = CGRectZero;
    [self.storeNameButton setTitle:@"店铺名字_____" forState:UIControlStateNormal];
    [self.storeNameButton setTitleColor:COLOR_333 forState:UIControlStateNormal];
    [self.storeNameButton setImage:IMAGE(@"waimai_go") forState:UIControlStateNormal];
    self.storeNameButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.storeNameButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    self.storeNameButton.titleLabel.font = PFR_FONT(13);
    [self addSubview:self.storeNameButton];

    self.storeNameButton.sd_layout
    .leftSpaceToView(self.selectStoreGoodsButton, 0)
    .centerYEqualToView(self.selectStoreGoodsButton)
    .rightSpaceToView(self, 12)
    .heightIs(28);
    self.storeNameButton.titleLabel.sd_layout
    .topSpaceToView(self.storeNameButton, 4)
    .bottomSpaceToView(self.storeNameButton, 4)
    .leftSpaceToView(self.storeNameButton, 4);
    [self.storeNameButton.titleLabel setSingleLineAutoResizeWithMaxWidth:200.0f];
    self.storeNameButton.imageView.sd_layout
    .centerYEqualToView(self.storeNameButton)
    .leftSpaceToView(self.storeNameButton.titleLabel, 8)
    .widthIs(8)
    .heightIs(14);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.selectStoreGoodsButton.frame = CGRectMake(0, 0, 36, 30);
//
//    self.storeNameButton.frame = CGRectMake(40, 0, SCREEN_WIDTH - 40, 30);
}


#pragma mark - UIButton Click
- (void)selectShopGoodsClick:(UIButton *)button {
    button.selected = !button.selected;
    NSLog(@"点击头部: %ld  选中状态: %d", self.section, self.selectStoreGoodsButton.selected);
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickStoreGoodsButton:headerView:section:)]) {
        [self.delegate clickStoreGoodsButton:self.selectStoreGoodsButton headerView:self section:self.section];
    }
}


#pragma mark - Setter Getter Methods
+ (CGFloat)getCartHeaderHeight{
    
    return 50;
}

- (void)setIsButtonSelected:(BOOL)isButtonSelected {
    _isButtonSelected = isButtonSelected;
    
    self.selectStoreGoodsButton.selected = isButtonSelected;
}



@end
