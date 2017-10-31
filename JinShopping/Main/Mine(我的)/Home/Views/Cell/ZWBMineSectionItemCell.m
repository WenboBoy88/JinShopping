//
//  ZWBMineSectionItemCell.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/20.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBMineSectionItemCell.h"

// Views
#import "ZWBMineCustomerItemView.h"

@interface ZWBMineSectionItemCell ()

@property (nonatomic, strong) UIView *containView;

@end

@implementation ZWBMineSectionItemCell

#pragma mark - Initinal
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        // 初始化
        [self setupBase];
        // 创建界面
        [self setupUI];
    }
    return self;
}

#pragma mark - Initialize
- (void)setupBase {
    self.contentView.backgroundColor = COLOR_WHITE;
    
}

#pragma mark - 更新界面
- (void)setupUI {
    self.containView = [[UIView alloc] init];
    self.containView.backgroundColor = COLOR_WHITE;
    [self.contentView addSubview:self.containView];
    self.containView.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView);
}

#pragma mark - Setter Getter Methods
- (void)setItemArr:(NSArray *)itemArr {
    _itemArr = itemArr;

    NSMutableArray *saveViewArr = [NSMutableArray array];
    WeakSelf(self);
    [itemArr enumerateObjectsUsingBlock:^(ZWBMineSectionItemModel *item, NSUInteger idx, BOOL * _Nonnull stop) {
        ZWBMineCustomerItemView *cusView = [[ZWBMineCustomerItemView alloc] init];
        cusView.model = item;
        [weakSelf.containView addSubview:cusView];
        [saveViewArr addObject:cusView];
        cusView.sd_layout.heightIs(90);
    }];
    
    [self.containView setupAutoWidthFlowItems:saveViewArr withPerRowItemsCount:4 verticalMargin:0 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
    [self setupAutoHeightWithBottomView:self.containView bottomMargin:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
