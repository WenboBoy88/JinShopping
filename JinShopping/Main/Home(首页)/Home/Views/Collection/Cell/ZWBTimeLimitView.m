//
//  ZWBTimeLimitView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/18.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBTimeLimitView.h"

@interface ZWBTimeLimitView() {
    UILabel *_titleLabel;
    UILabel *_desLabel;
    UILabel *_timeLabel;
    UIImageView *_imageView;
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ZWBTimeLimitView

#pragma mark - Intial
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupView];
}
- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

#pragma mark - 初始化View
// 创建View
- (void)setupView {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = PFR_FONT(16.0f);
    titleLabel.textColor = COLOR_MAIN_RED;
    titleLabel.text = @"限时活动";
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    UILabel *desLabel = [[UILabel alloc] init];
    desLabel.font = PFR_FONT(15.0f);
    desLabel.textColor = COLOR_666;
    desLabel.text = @"时间有限 抓紧来抢";
    [self addSubview:desLabel];
    self.desLabel = desLabel;
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.font = PFR_FONT(14.0f);
    timeLabel.backgroundColor = COLOR_MAIN_RED;
    timeLabel.textColor = COLOR_WHITE;
    timeLabel.text = @"17:20:34";
    [self addSubview:timeLabel];
    self.timeLabel = timeLabel;
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = IMAGE(@"huodong1");
    imageView.backgroundColor = COLOR_CLEAR;
    [self addSubview:imageView];
    self.imageView = imageView;
}

#pragma mark - 更新frame
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.sd_layout
    .topSpaceToView(self, 12)
    .leftSpaceToView(self, 12)
    .widthIs(66)
    .heightIs(22);
    self.desLabel.sd_layout
    .topSpaceToView(self.titleLabel, 5)
    .leftEqualToView(self.titleLabel)
    .rightSpaceToView(self, 12)
    .heightIs(18);
    self.timeLabel.sd_layout
    .topSpaceToView(self.desLabel, 5)
    .leftEqualToView(self.titleLabel)
    .heightIs(16.0f);
    [self.timeLabel setSingleLineAutoResizeWithMaxWidth:100.0f];
    self.imageView.sd_layout
    .topSpaceToView(self.timeLabel, 10)
    .leftSpaceToView(self, 12)
    .rightSpaceToView(self, 12)
    .bottomSpaceToView(self, 12);
}

#pragma mark - Setter Getter Methods
- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.titleLabel.text = title;
}

- (void)setDes:(NSString *)des {
    _des = des;
    
    self.desLabel.text = des;
}

- (void)setStarTime:(NSString *)starTime {
    _starTime = starTime;
    
    self.timeLabel.text = starTime;
}

- (void)setImageUrl:(NSString *)imageUrl {
    _imageUrl = imageUrl;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:IMAGE(@"")];
}


@end
