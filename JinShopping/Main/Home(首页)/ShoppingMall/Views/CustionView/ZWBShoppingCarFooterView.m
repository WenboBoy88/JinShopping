//
//  ZWBShoppingCarFooterView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/14.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingCarFooterView.h"

@interface ZWBShoppingCarFooterView ()

@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation ZWBShoppingCarFooterView

#pragma mark - Initnal
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self initCartFooterView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}


#pragma mark - UI
- (void)initCartFooterView{
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.priceLabel = [[UILabel alloc] init];
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    self.priceLabel.text = @"合计 ￥0";
    self.priceLabel.textColor = COLOR_333;
    self.priceLabel.attributedText = [ZWBUtil getAttribugedString:_priceLabel.text range:NSMakeRange(3, 2) color:COLOR_MAIN_RED];
    
    [self addSubview:self.priceLabel];
}


#pragma mark - Update Frame
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.priceLabel.frame = CGRectMake(10, 0.5, SCREEN_WIDTH - 20, 30);
}

#pragma mark - Getter Setter Methods
- (void)setShopGoodsArray:(NSMutableArray *)shopGoodsArray{
    
    _shopGoodsArray = shopGoodsArray;
    
    NSNumber *shopPrice = nil;
    float finalPrice = 0 ;
    for (ZWBShoppingCarModel *model in shopGoodsArray) {
        shopPrice = @(model.p_quantity * model.p_price);
        finalPrice += shopPrice.floatValue;
    }
    
    self.priceLabel.text = [NSString stringWithFormat:@"合计:￥%.2f", finalPrice];
}

// 获取高度
+ (CGFloat)getCartFooterHeight{
    
    return 50;
}


@end
