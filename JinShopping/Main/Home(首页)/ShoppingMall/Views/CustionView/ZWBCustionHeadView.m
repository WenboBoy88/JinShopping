//
//  ZWBCustionHeadView.m
//  JinShopping
//
//  Created by apple on 2017/6/12.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//


#import "ZWBCustionHeadView.h"

// Controllers

// Models

// Views
#import "ZWBCustionButton.h"

// Vendors

// Categories

// Others
#define AuxiliaryNum 100

@interface ZWBCustionHeadView ()

/** 记录上一次选中的Button */
@property (nonatomic , strong) ZWBCustionButton *selectBtn;
/** 记录上一次选中的Button底部View */
@property (nonatomic , strong) UIView *selectBottomRedView;

@end

@implementation ZWBCustionHeadView

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    self.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[@"水果餐饮",@"家用电器",@"数码产品",@"汽车配件"];
    NSArray *noImage = @[@"icon_Arrow2",@"",@"",@"icon_shaixuan"];
    CGFloat btnW = self.zwb_width / titles.count;
    CGFloat btnH = self.zwb_height;
    CGFloat btnY = 0;
    for (NSInteger i = 0; i < titles.count; i++) {
        ZWBCustionButton *button = [ZWBCustionButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = PFR_FONT(15.0f);
        [self addSubview:button];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:noImage[i]] forState:UIControlStateNormal];
        button.tag = i + AuxiliaryNum;
        CGFloat btnX = i * btnW;
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [self buttonClick:button]; //默认选择第一个
        }
    }
    [ZWBSpeedy zwb_setupAcrossPartingLineWith:self lineColor:[[UIColor lightGrayColor]colorWithAlphaComponent:0.4]];
}

#pragma mark - 按钮点击
- (void)buttonClick:(ZWBCustionButton *)button
{
    if (button.tag == 3 + AuxiliaryNum) { //筛选
        !_filtrateClickBlock ? : _filtrateClickBlock();
    }else{
        _selectBottomRedView.hidden = YES;
        [_selectBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        UIView *bottomRedView = [[UIView alloc] init];
        [self addSubview:bottomRedView];
        bottomRedView.backgroundColor = [UIColor redColor];
        bottomRedView.zwb_width = button.zwb_width;
        bottomRedView.zwb_height = 3;
        bottomRedView.zwb_left = button.zwb_height - bottomRedView.zwb_height;
        bottomRedView.zwb_left = button.zwb_left;
        bottomRedView.hidden = NO;
        
        _selectBtn = button;
        _selectBottomRedView = bottomRedView;
    }
}


#pragma mark - Setter Getter Methods

@end
