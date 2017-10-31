//
//  ZWBMineCustomerItemView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/20.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBMineCustomerItemView.h"

@interface ZWBMineCustomerItemView()

/** 图片*/
@property (nonatomic, strong) UIImageView *imageView;
/** 标题*/
@property (nonatomic, strong) UILabel *titleLabel;
/** 显示个数*/
@property (nonatomic, strong) UILabel *showCountLabel;

@end

@implementation ZWBMineCustomerItemView


#pragma mark - Initinal
- (instancetype)init {
    if (self = [super init]) {
        
        // 初始化
        [self setupBase];
        // 创建界面
        [self setupUI];
        // 设置约束
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - Initialize
- (void)setupBase {
    self.backgroundColor = COLOR_WHITE;
}

#pragma mark - 创建界面
- (void)setupUI {
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = COLOR_WHITE;
    [self addSubview:imageView];
    self.imageView = imageView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = PFR_FONT(14.0f);
    titleLabel.textColor = COLOR_333;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *showCountLabel = [[UILabel alloc] init];
    showCountLabel.textAlignment = NSTextAlignmentCenter;
    showCountLabel.font = PFR_FONT(13.0f);
    showCountLabel.textColor = COLOR_666;
    [self addSubview:showCountLabel];
    self.showCountLabel = showCountLabel;
}

#pragma mark - AutoLayout
- (void)setupAutoLayout {
    self.imageView.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self, 5)
    .widthIs(30)
    .autoHeightRatio(0.76);
    
    self.titleLabel.sd_layout
    .topSpaceToView(self.imageView, 3)
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .heightIs(22);
    
    self.showCountLabel.sd_layout
    .topSpaceToView(self.titleLabel, 2)
    .leftEqualToView(self.titleLabel)
    .rightEqualToView(self.titleLabel)
    .heightIs(16);
    
    [self setupAutoHeightWithBottomView:self.showCountLabel bottomMargin:8];
}

#pragma mark - Setter Getter Methods
- (void)setModel:(ZWBMineSectionItemModel *)model {
    _model = model;
    self.imageView.image = IMAGE(model.image);
    self.titleLabel.text = model.title;
    
    NSString *showCountText = [NSString stringWithFormat:@"共%@张", model.count];
    self.showCountLabel.attributedText = [ZWBUtil getAttribugedString:showCountText range:NSMakeRange(1, showCountText.length - 2) color:COLOR_MAIN_RED];
    self.showCountLabel.hidden = model.isHiddenLastInfo;
}


#pragma mark - Add Target
- (void)addTarget:(id)target action:(SEL)action {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}

#pragma mark - 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

@end
