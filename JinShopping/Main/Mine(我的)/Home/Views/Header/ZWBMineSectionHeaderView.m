//
//  ZWBMineSectionHeaderView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/19.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBMineSectionHeaderView.h"

@interface ZWBMineSectionHeaderView()

// logo图片
@property (nonatomic, strong) UIImageView *imageView;
// 标题
@property (nonatomic, strong) UILabel *titleLabel;
// 返回图片
@property (nonatomic, strong) UIImageView *goImageView;

@end

@implementation ZWBMineSectionHeaderView

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupBase];
        
        [self setupUI];
    }
    return self;
}

- (void)setupBase {
    self.backgroundColor = COLOR_WHITE;
    
}


#pragma mark - 创建界面
- (void)setupUI {
    self.imageView = [[UIImageView alloc] init];
    [self addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = PFR_FONT(15.0f);
    self.titleLabel.textColor = COLOR_333;
    [self addSubview:self.titleLabel];
    
    self.goImageView = [[UIImageView alloc] init];
    self.goImageView.image = IMAGE(@"youjian");
    [self addSubview:self.goImageView];
    
    self.imageView.sd_layout
    .leftSpaceToView(self, 12)
    .centerYEqualToView(self)
    .widthIs(26)
    .heightEqualToWidth();
    self.titleLabel.sd_layout
    .leftSpaceToView(self.imageView, 8)
    .centerYEqualToView(self)
    .widthIs(120)
    .heightIs(24);
    self.goImageView.sd_layout
    .rightSpaceToView(self, 12)
    .centerYEqualToView(self)
    .widthIs(8)
    .heightIs(16);
    
}

#pragma mark - 更新Frame
- (void)layoutSubviews {
    [super layoutSubviews];
    

    NSLog(@"更新frame");
}

#pragma mark - Setter Getter Methods
// 填充数据
- (void)setInfoDict:(NSDictionary *)infoDict {
    _infoDict = infoDict;
    
    self.imageView.image    = IMAGE(infoDict[@"image"]);
    self.titleLabel.text    = infoDict[@"title"];
    self.goImageView.hidden = [infoDict[@"isHidden"] boolValue];
}

// 设置区头
- (void)setSection:(NSInteger)section {
    _section = section;
    
    if (section == 0) { // 只有是第0分区添加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [self addGestureRecognizer:tap];
    }
}

#pragma mark - Action
- (void)tapClick:(UITapGestureRecognizer *)tap {
    if (!self.goImageView.hidden) {
        !self.clickBlock ? : self.clickBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
