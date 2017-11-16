//
//  ZWBNummberCount.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/16.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBNummberCount.h"

static CGFloat const Button_Width_Height = 28;

@interface ZWBNummberCount ()<UITextFieldDelegate>
//加
@property (nonatomic, strong) UIButton    *addButton;
//减
@property (nonatomic, strong) UIButton    *subButton;
//数字按钮
@property (nonatomic, strong) UITextField *numberTT;

@end

@implementation ZWBNummberCount

#pragma mark - Initinal
- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


#pragma mark -  UI
- (void)setupUI{
    
    self.backgroundColor = [UIColor clearColor];
    self.currentCountNumber = 0;
    self.totalNum = 0;
    
    /************************** 加 ****************************/
    self.subButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.subButton.frame = CGRectMake(0, 0, Button_Width_Height, Button_Width_Height);
    [self.subButton setBackgroundImage:[UIImage imageNamed:@"product_detail_sub_normal"]
                          forState:UIControlStateNormal];
    [self.subButton addTarget:self action:@selector(subClick:) forControlEvents:UIControlEventTouchUpInside];
    self.subButton.tag = 0;
    [self addSubview:self.subButton];
    
    /************************** 内容 ****************************/
    self.numberTT = [[UITextField alloc]init];
    self.numberTT.frame = CGRectMake(self.subButton.zwb_right, 0, Button_Width_Height * 1.5, self.subButton.frame.size.height);
    self.numberTT.keyboardType = UIKeyboardTypeNumberPad;
    self.numberTT.text = [NSString stringWithFormat:@"%@",@(0)];
    self.numberTT.backgroundColor = [UIColor whiteColor];
    self.numberTT.textColor = [UIColor blackColor];
    self.numberTT.adjustsFontSizeToFitWidth = YES;
    self.numberTT.textAlignment = NSTextAlignmentCenter;
    self.numberTT.layer.borderColor = RGBA(201, 201, 201, 1).CGColor;
    self.numberTT.layer.borderWidth = 1.3;
    self.numberTT.font= PFR_FONT(15.0);
    self.numberTT.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:@"UITextFieldTextDidEndEditingNotification" object:self.numberTT];
    [self addSubview:self.numberTT];
    
    /************************** 加 ****************************/
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addButton.frame = CGRectMake(self.numberTT.zwb_right, 0, Button_Width_Height, Button_Width_Height);
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"product_detail_add_normal"]
                          forState:UIControlStateNormal];
    self.addButton.tag = 1;
    [self.addButton addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.addButton];
    
}

#pragma mark - Button Click
- (void)subClick:(UIButton *)button {
    self.currentCountNumber--;
    if (self.numberChangeBlock) {
        self.numberChangeBlock(self.currentCountNumber);
    }
}

- (void)addClick:(UIButton *)button {
    self.currentCountNumber++;
    
    if (self.numberChangeBlock) {
        self.numberChangeBlock(self.currentCountNumber);
    }
    
}

#pragma mark - Getter Setter Methdos
- (void)setCurrentCountNumber:(NSInteger)currentCountNumber {
    _currentCountNumber = currentCountNumber;
    
    self.numberTT.text = [NSString stringWithFormat:@"%ld", currentCountNumber];
    
    if (currentCountNumber > 1) {
        self.subButton.enabled = YES;
    } else {
        self.subButton.enabled = NO;
    }
    
    if (currentCountNumber < self.totalNum) {
        self.addButton.enabled = YES;
    } else {
        self.addButton.enabled = NO;
    }
}



#pragma mark - Nofi
- (void)textChange:(NSNotification *)nofi {
    UITextField *numTextField = [nofi object];
    NSString *text = numTextField.text;
    NSInteger changeNum = 0;
    if (text.integerValue > self.totalNum && self.totalNum != 0) {
        self.currentCountNumber = self.totalNum;
        self.numberTT.text = [NSString stringWithFormat:@"%@", @(self.totalNum)];
        changeNum = self.totalNum;
    } else if (text.integerValue < 1){
        self.numberTT.text = @"1";
        changeNum = 1;
    } else {
        self.currentCountNumber = text.integerValue;
        changeNum = self.currentCountNumber;
    }
    
    if (self.numberChangeBlock) {
        self.numberChangeBlock(changeNum);
    }

}


@end
