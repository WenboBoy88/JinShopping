//
//  ZWBBrandsSortHeadView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/10.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBrandsSortHeadView.h"

@interface ZWBBrandsSortHeadView ()

/* 头部标题Label */
@property (strong , nonatomic)UILabel *headLabel;

@end

@implementation ZWBBrandsSortHeadView

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI
- (void)setupUI {
    self.headLabel = [[UILabel alloc] init];
    self.headLabel.font = PFR_FONT(13.0f);
    self.headLabel.textColor = COLOR_MAIN_BG;
    [self addSubview:self.headLabel];
    
    self.headLabel.frame = CGRectMake(Padding, 0, 230, self.zwb_height);
}

#pragma mark - Setter Getter Methods
- (void)setMainModel:(ZWBGoodsMainModel *)mainModel {
    _mainModel = mainModel;
    
    self.headLabel.text = mainModel.title;
}



@end
