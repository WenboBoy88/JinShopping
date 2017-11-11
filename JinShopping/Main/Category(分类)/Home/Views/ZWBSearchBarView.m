//
//  ZWBSearchBarView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/11.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBSearchBarView.h"
#import "YBPopupMenu.h"

@interface ZWBSearchBarView() <UITextFieldDelegate, YBPopupMenuDelegate> {

}

@property (nonatomic, strong) UITextField *searchTextField;


@end


@implementation ZWBSearchBarView

#pragma mark - Intial
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.showType = ShowImage;
        [self setupUIForShowType:ShowImage];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame searchViewType:(SearchViewType)showType {
    if (self = [super initWithFrame:frame]) {
        
        [self setupUIForShowType:showType];
    }
    return self;
}

#pragma mark - 初始化界面
- (void)setupUIForShowType:(SearchViewType)showType {
    self.backgroundColor = COLOR_CLEAR;
    self.showType = showType;

    UIView *leftView = [[UIView alloc] init];
    if (showType == ShowImage) {
        leftView.frame = CGRectMake(0, 0, 40, self.zwb_height);
        UIImageView *sousuoImageView = [[UIImageView alloc] initWithImage:IMAGE(@"sousuo")];
        sousuoImageView.frame = CGRectMake(5, 6, 24, 24);
        [leftView addSubview:sousuoImageView];
    } else {
        leftView.frame = CGRectMake(0, 0, 70, self.zwb_height);
        UIButton *clickBtn = [ZWBFactory creatButtonWithFrame:CGRectMake(5, 0, 65, self.zwb_height) bgColor:COLOR_CLEAR textColor:COLOR_333 target:self sel:@selector(selectTypeClick:) tag:0 image:@"waimai_dropDown" title:@"图片"];
        clickBtn.titleLabel.font = PFR_FONT(14.0f);
        [clickBtn setTitleColor:COLOR_333 forState:UIControlStateNormal];
        [leftView addSubview:clickBtn];
        clickBtn.titleLabel.sd_layout
        .leftSpaceToView(clickBtn, 5)
        .centerYEqualToView(clickBtn)
        .widthIs(45)
        .heightIs(24);
        clickBtn.imageView.sd_layout
        .rightSpaceToView(clickBtn, 10)
        .centerYEqualToView(clickBtn)
        .widthIs(14)
        .heightIs(14);
    }
    
    self.searchTextField = [[UITextField alloc] initWithFrame:self.bounds];
    self.searchTextField.backgroundColor = COLOR_WHITE;
    self.searchTextField.font = PFR_FONT(14.0f);
    self.searchTextField.placeholder = @"商品名称";
    self.searchTextField.adjustsFontSizeToFitWidth = YES;
    self.searchTextField.textColor = COLOR_333;
    self.searchTextField.delegate = self;
    self.searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.searchTextField.leftViewMode = UITextFieldViewModeAlways;
    self.searchTextField.leftView = leftView;
    NSLog(@"%@", self.searchTextField.leftView.subviews);
    [self addSubview:self.searchTextField];
    
//    self.searchTextField.sd_layout
//    .topSpaceToView(self, 5)
//    .leftSpaceToView(self, Padding)
//    .bottomSpaceToView(self, 5)
//    .rightSpaceToView(self, Padding);
}


#pragma mark - Update Frame
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //设置边角
    [ZWBSpeedy zwb_setupBezierPathCircularLayerWith:self.searchTextField radiusSize:CGSizeMake(22, 22)];
    
}

#pragma mark - 点击响应
- (void)selectTypeClick:(UIButton *)button {
    [YBPopupMenu showRelyOnView:button titles:@[@"图片", @"内容"] icons:nil menuWidth:100 otherSettings:^(YBPopupMenu *popupMenu) {
        popupMenu.type = YBPopupMenuTypeDefault;
        popupMenu.borderWidth = 1;
        popupMenu.dismissOnSelected = YES;
        popupMenu.isShowShadow = NO;
        popupMenu.delegate = self;
        popupMenu.rectCorner = UIRectCornerBottomLeft | UIRectCornerBottomRight;
        popupMenu.arrowDirection = YBPopupMenuPriorityDirectionBottom;
    }];
}

#pragma mark - YBPopupMenuDelegate
- (void)ybPopupMenuDidSelectedAtIndex:(NSInteger)index ybPopupMenu:(YBPopupMenu *)ybPopupMenu {
    NSLog(@"index:%ld", index);
}

#pragma mark - Setter Getter Methods


#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    NSLog(@"结束编辑");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
