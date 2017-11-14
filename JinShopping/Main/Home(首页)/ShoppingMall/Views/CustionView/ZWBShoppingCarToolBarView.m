//
//  ZWBShoppingCarToolBarView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/14.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingCarToolBarView.h"

// Others

static NSInteger const BalanceButtonTag = 120;

static NSInteger const DeleteButtonTag = 121;

static NSInteger const SelectButtonTag = 122;


@interface ZWBShoppingCarToolBarView ()

@property (nonatomic, assign) BOOL isSelected;

@end

@implementation ZWBShoppingCarToolBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupBase];
        [self setBarUI];
    }
    return self;
}

#pragma mark - 基本操作
- (void)setupBase {
    self.isSelected = NO;
}

#pragma mark - UI
- (void)setBarUI{
    
    self.backgroundColor = COLOR_WHITE;
    /* 背景 */
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.userInteractionEnabled = NO;
    effectView.frame = self.bounds;
    [self addSubview:effectView];
    
    CGFloat wd = SCREEN_WIDTH * 2 / 7;
    
    /* 结算 */
    UIButton *balanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(SCREEN_WIDTH - wd, 0, wd, self.frame.size.height);
    [balanceButton setBackgroundImage:[UIImage imageWithColor:COLOR_MAIN_RED] forState:UIControlStateNormal];
    [balanceButton setBackgroundImage:[UIImage imageWithColor:COLOR_333] forState:UIControlStateDisabled];
    [balanceButton setTitle:@"去结算" forState:UIControlStateNormal];
    [balanceButton setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
    [balanceButton setTitleColor:COLOR_WHITE forState:UIControlStateDisabled];
    [balanceButton addTarget:self action:@selector(balanceClick:) forControlEvents:UIControlEventTouchUpInside];
    balanceButton.enabled = NO;
    balanceButton.tag = BalanceButtonTag;
    [self addSubview:balanceButton];
    self.balanceButton = balanceButton;
    balanceButton.sd_layout
    .topEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(wd);
    
    // 删除
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setBackgroundImage:[UIImage imageWithColor:COLOR_WHITE] forState:UIControlStateNormal];
    [deleteBtn setBackgroundImage:[UIImage imageWithColor:COLOR_WHITE] forState:UIControlStateDisabled];
//    [button1 setTitle:@"删除" forState:UIControlStateNormal];
//    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
//    [deleteBtn setFrame:CGRectMake(SCREEN_WIDTH - wd, 0, wd, self.frame.size.height)];
    [deleteBtn setImage:IMAGE(@"sc_delete") forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteClick:) forControlEvents:UIControlEventTouchUpInside];
    deleteBtn.enabled = NO;
    deleteBtn.hidden = YES;
    deleteBtn.tag = DeleteButtonTag;
    [self addSubview:deleteBtn];
    self.deleteButton = deleteBtn;
    deleteBtn.sd_layout
    .rightSpaceToView(balanceButton, 0)
    .centerYEqualToView(balanceButton)
    .widthIs(60)
    .heightEqualToWidth();
    
    UIView *lineView = [[UIView alloc] init];
//    lineView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.5);
    lineView.backgroundColor  = RGBA(210, 210, 210, 1);
    [self addSubview:lineView];
    lineView.sd_layout
    .rightSpaceToView(balanceButton, 0)
    .centerYEqualToView(deleteBtn)
    .widthIs(1.0)
    .heightIs(20);
    
    // 全选
    UIButton *selectAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    selectAllButton.frame = CGRectMake(0, 0, 78, self.frame.size.height);
//    [selectAllButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    selectAllButton.titleLabel.font = FONT_SYSTEM(14.0f);
    [selectAllButton setTitle:@"全选"         forState:UIControlStateNormal];
    [selectAllButton setTitle:@"取消全选"      forState:UIControlStateSelected];
    [selectAllButton setTitleColor:COLOR_333 forState:UIControlStateNormal];
    [selectAllButton setImage:[UIImage imageNamed:@"sc_circle_normal"] forState:UIControlStateNormal];
    [selectAllButton setImage:[UIImage imageNamed:@"sc_circle_select"] forState:UIControlStateSelected];
    [selectAllButton addTarget:self action:@selector(selectedStatusClick:) forControlEvents:UIControlEventTouchUpInside];
    selectAllButton.tag = SelectButtonTag;
    [self addSubview:selectAllButton];
    self.selectAllButton = selectAllButton;
    selectAllButton.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(80);
    selectAllButton.imageView.sd_layout
    .centerYEqualToView(selectAllButton)
    .leftSpaceToView(selectAllButton, 2)
    .widthIs(26)
    .heightEqualToWidth();
    selectAllButton.titleLabel.sd_layout
    .centerYEqualToView(selectAllButton)
    .leftSpaceToView(selectAllButton.imageView, 5)
    .rightSpaceToView(selectAllButton, 2)
    .heightIs(26);

    // 价格
    UILabel *priceLabel = [[UILabel alloc] init];
//    priceLabel.frame = CGRectMake(wd, 0, SCREEN_WIDTH - wd * 2 - 5, self.frame.size.height);
    priceLabel.text = [NSString stringWithFormat:@"合计￥:%@",@(0.00)];
    priceLabel.textColor = [UIColor blackColor];
    priceLabel.font = PFR_FONT(15);
    priceLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:priceLabel];
    self.allMoneyLabel = priceLabel;
    priceLabel.sd_layout
    .leftSpaceToView(selectAllButton, 5)
    .rightSpaceToView(lineView, 5)
    .centerYEqualToView(selectAllButton)
    .heightIs(26);
}

#pragma mark - Button Click
// 选中状态的事件
// 影响结算的操作按钮  如果 价钱 > 0 或者是 选中状态  则结算按钮可以进行操作，否则则不能进行操作
- (void)selectedStatusClick:(UIButton *)button {
    button.selected = !button.selected;
    
    self.isSelected = button.selected;
    if (button.selected) {
        self.balanceButton.enabled = YES;
    } else {
        self.balanceButton.enabled = NO;
    }
}

// 删除事件的操作
- (void)deleteClick:(UIButton *)button {
    
}

// 结算操作
- (void)balanceClick:(UIButton *)button {
    
}

#pragma mark - Getter Setter Methods
- (void)setMoney:(float)money {
    _money = money;
    
    self.allMoneyLabel.text = [NSString stringWithFormat:@"总计￥:%.2f", money];
    self.balanceButton.enabled = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
