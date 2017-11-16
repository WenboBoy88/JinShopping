//
//  ZWBShoppingCarCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingCarCell.h"

@interface ZWBShoppingCarCell ()

@property (nonatomic, assign) NSInteger numCount;

@end

@implementation ZWBShoppingCarCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.numCount = 1;
    
//    [self addObserver:self forKeyPath:@"numCount" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

#pragma mark - Button Click
- (IBAction)selectClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.selectButton setImage:IMAGE(@"sc_circle_select") forState:UIControlStateSelected];
    } else {
        [self.selectButton setImage:IMAGE(@"sc_circle_normal") forState:UIControlStateNormal];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickButton:superView:selected:indexPath:)]) {
        [self.delegate clickButton:sender superView:self selected:sender.selected indexPath:self.indexPath];
    }
}

- (IBAction)addClick:(UIButton *)sender {
    self.numCount++;

}

- (IBAction)subClick:(UIButton *)sender {
    self.numCount--;

}

#pragma mark - Setter Getter Methods
- (void)setNumCount:(NSInteger)numCount {
    _numCount = numCount;
    
    self.countLabel.text = [NSString stringWithFormat:@"%ld", numCount];
    if (self.numberChangeBlock) {
        self.numberChangeBlock(numCount);
    }

}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    /** 打印新老值 */
    NSLog(@"old : %@  new : %@",[change objectForKey:@"old"],
                                [change objectForKey:@"new"]);
    
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"numCount" context:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
