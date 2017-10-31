//
//  ZWBHomeNavSearchBarView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/18.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBHomeNavSearchBarView.h"

@interface ZWBHomeNavSearchBarView() {
    UIImageView *_sousuoImageView;
}

/* 搜索图 */
@property (nonatomic, strong) UIImageView *sousuoImageView;
/* 语音按钮 */
@property (nonatomic, strong) UIButton *voiceImageBtn;
/* 占位文字 */
@property (nonatomic, strong) UILabel *placeholdLabel;

@end

@implementation ZWBHomeNavSearchBarView

#pragma mark - Intial
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setUpUI];
        
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(searchClick)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)setUpUI {
//    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    self.backgroundColor = COLOR_WHITE;
    
    _sousuoImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _sousuoImageView.image = IMAGE(@"sousuo");
    
    _placeholdLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _placeholdLabel.font = PFR_FONT(14.0);
    _placeholdLabel.adjustsFontSizeToFitWidth = YES;
    _placeholdLabel.textColor = COLOR_666;
    
    _voiceImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_voiceImageBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
    [_voiceImageBtn addTarget:self action:@selector(voiceButtonClick) forControlEvents:UIControlEventTouchUpInside];
    _voiceImageBtn.hidden = YES;
    
    [self addSubview:_sousuoImageView];
    [self addSubview:_placeholdLabel];
    [self addSubview:_voiceImageBtn];

//    _sousuoImageView.frame = CGRectMake(Margin, 5, 30, 30);
    _sousuoImageView.sd_layout
    .leftSpaceToView(self, Padding)
    .topSpaceToView(self, 7)
    .bottomSpaceToView(self, 7)
    .widthEqualToHeight();
    
    _voiceImageBtn.sd_layout
    .topSpaceToView(self, 5)
    .rightSpaceToView(self, Padding)
    .bottomSpaceToView(self, 5)
    .widthEqualToHeight();
    
    _placeholdLabel.sd_layout
    .topSpaceToView(self, 5)
    .leftSpaceToView(_sousuoImageView, Padding)
    .bottomSpaceToView(self, 5)
    .rightSpaceToView(_voiceImageBtn, Padding);
    
}


#pragma mark - Update Frame
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //设置边角
    [ZWBSpeedy zwb_setupBezierPathCircularLayerWith:self radiusSize:CGSizeMake(20, 20)];

}


#pragma mark - Setter Getter Methods
- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    
    self.placeholdLabel.text = placeholder;
}

#pragma mark - 点击回调
// 搜索回调
- (void)searchClick {
    !_searchViewBlock ? : _searchViewBlock();
}
// 语音回调
- (void)voiceButtonClick {
    !_voiceButtonClickBlock ? : _voiceButtonClickBlock();
}

@end
