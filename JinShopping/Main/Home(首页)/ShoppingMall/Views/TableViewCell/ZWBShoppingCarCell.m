//
//  ZWBShoppingCarCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/13.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingCarCell.h"

@interface ZWBShoppingCarCell () {
    NSInteger _numCount;
}

@property (nonatomic, assign) NSInteger numCount;

@end

@implementation ZWBShoppingCarCell

#pragma mark - Initinal
- (void)awakeFromNib {
    [super awakeFromNib];

    [self setupBase];
}

#pragma mark - 初始化操作
- (void)setupBase {
    _numCount = 1;
    
    [self.selectGoodsButton setImage:IMAGE(@"sc_circle_select") forState:UIControlStateSelected];
    [self.selectGoodsButton setImage:IMAGE(@"sc_circle_normal") forState:UIControlStateNormal];
    // 增加监听
//    [self addObserver:self forKeyPath:@"numCount" options:NSKeyValueObservingOptionNew | SKeyValueObservingOptionOld context:nil];
}

#pragma mark - Button Click
- (IBAction)selectClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    NSLog(@"点击Cell：%ld-%ld", self.indexPath.section, self.indexPath.row);
    
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
    
    if (numCount >= self.model.p_stock) {
        _numCount = self.model.p_stock;
    } else if (numCount < 0) {
        _numCount = 0;
    }
    
    self.model.p_quantity = _numCount;
    self.countLabel.text = [NSString stringWithFormat:@"%ld", _numCount];
    if (self.numberChangeBlock) {
        self.numberChangeBlock(numCount);
    }
    
}
// 填充数据
- (void)setModel:(ZWBShoppingCarModel *)model {
    _model = model;
    
    // 初始化现有的个数
    _numCount = model.p_quantity;
    self.goodsNameLabel.text             = model.p_name;
    self.goodsPriceLabel.text            = [NSString stringWithFormat:@"￥%.2f", model.p_price];
    self.countLabel.text                 = [NSString stringWithFormat:@"%ld",   model.p_quantity];
    self.selectGoodsButton.selected      = model.isSelect;

}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    /** 打印新老值 */
    NSLog(@"old : %@  new : %@",[change objectForKey:@"old"],
                                [change objectForKey:@"new"]);
    
}

- (void)dealloc {
//    [self removeObserver:self forKeyPath:@"numCount" context:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
