//
//  ZWBBadgeView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/26.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBadgeView.h"

@interface ZWBBadgeView ()


@property (nonatomic,strong) UILabel *textLabel;

@end

@implementation ZWBBadgeView


#pragma mark - Initinal
- (instancetype)initWithFrame:(CGRect)frame withString:(NSString *)string {
    return [self initWithFrame:frame withString:string withTextColor:nil];
}

- (instancetype)initWithFrame:(CGRect)frame withString:(NSString *)string withTextColor:(UIColor *)textColor {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = frame.size.height /2;
        self.badgeValue = string;
        self.textColor = textColor;
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.textLabel.font = [UIFont systemFontOfSize:10.0f];
        self.textLabel.textColor = textColor ? textColor : [UIColor whiteColor];
        self.textLabel.text = string;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.textLabel];
    }
    return self;

}

#pragma mark - Getter Setter Methods
- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    
    self.textLabel.textColor = textColor;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    
    self.textLabel.text = badgeValue;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
