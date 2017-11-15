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

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)setHeaderUI {
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.selectStoreGoodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectStoreGoodsButton.frame = CGRectZero;
    [self.selectStoreGoodsButton setImage:[UIImage imageNamed:@"sc_circle_normal"]
                                 forState:UIControlStateNormal];
    [self.selectStoreGoodsButton setImage:[UIImage imageNamed:@"sc_circle_select"]
                                 forState:UIControlStateSelected];
    self.selectStoreGoodsButton.backgroundColor=[UIColor clearColor];
    [self.selectStoreGoodsButton addTarget:self action:@selector(selectShopGoodsClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.selectStoreGoodsButton];
    self.selectStoreGoodsButton.sd_layout
    .centerYEqualToView(self)
    .leftSpaceToView(self, 12)
    .widthIs(26)
    .heightEqualToWidth();
    
    self.storeNameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.storeNameButton.frame = CGRectZero;
    [self.storeNameButton setTitle:@"店铺名字_____" forState:UIControlStateNormal];
    [self.storeNameButton setTitleColor:COLOR_333 forState:UIControlStateNormal];
    [self.storeNameButton setImage:IMAGE(@"waimai_go") forState:UIControlStateNormal];
    self.storeNameButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.storeNameButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    self.storeNameButton.titleLabel.font = PFR_FONT(13);

    self.storeNameButton.sd_layout
    .leftSpaceToView(self.selectStoreGoodsButton, 8)
    .centerYEqualToView(self)
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
    .widthIs(16)
    .heightEqualToWidth();
    
    [self addSubview:self.storeNameButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.selectStoreGoodsButton.frame = CGRectMake(0, 0, 36, 30);
//
//    self.storeNameButton.frame = CGRectMake(40, 0, SCREEN_WIDTH - 40, 30);
}


#pragma mark - UIButton Click
- (void)selectShopGoodsClick:(UIButton *)button {
    
}


#pragma mark - Setter Getter Methods
+ (CGFloat)getCartHeaderHeight{
    
    return 50;
}



@end
