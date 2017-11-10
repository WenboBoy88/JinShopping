//
//  ZWBStoreCustionView.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/10.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBStoreCustionView.h"
// Views
#import "ZWBOverlayView.h" // 遮罩图层

// Other

static NSString *TableViewCellID = @"TableViewCell";

@interface ZWBStoreCustionView ()<UITableViewDelegate, UITableViewDataSource>

/** 遮罩层*/
@property (nonatomic, strong) UIView *overlayView;
/* 选中的Btn*/
@property (nonatomic, strong) UIButton *selectBtn;
/** 按钮背景*/
@property (nonatomic, strong) UIView *buttonView;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ZWBStoreCustionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化
        [self setupUI];
        
    }
    return self;
}

#pragma mark - 初始化界面
- (void)setupUI {
    self.backgroundColor = COLOR_MAIN_RED;

    self.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[@"分类",@"销量",@"价格"];
    self.categoryArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"1",@"2",@"3",@"4",@"5",@"6"];
    NSArray *normalImage = @[@"",@"",@""];
    NSArray *selectImage = @[@"",@"",@""];
    CGFloat btnW = self.zwb_width / titles.count;
    CGFloat btnH = self.zwb_height;
    CGFloat btnY = 0;
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        if (i == 0) {
            [button setTitleColor:COLOR_MAIN_YELLOW forState:UIControlStateNormal];
        } else {
            [button setTitleColor:COLOR_333         forState:UIControlStateNormal];
        }
        [button setImage:[UIImage imageNamed:normalImage[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectImage[i]] forState:UIControlStateSelected];
        button.titleLabel.font = PFR_FONT(15.0f);
        button.tag = i;
        CGFloat btnX = i * btnW;
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    [ZWBSpeedy zwb_setupAcrossPartingLineWith:self lineColor:[[UIColor lightGrayColor]colorWithAlphaComponent:0.4]];
}

#pragma mark - 按钮点击
- (void)buttonClick:(UIButton *)button {
    
    button.selected  = !button.selected;
    
    self.selectBtn = button;
    NSInteger clickIndex = button.tag;

    if (clickIndex == 0) {
        if (button.selected) { // 选中状态
//            [button setTitleColor:COLOR_RED forState:UIControlStateNormal];

            [UIView animateWithDuration:0.2 animations:^{
                [self.superview addSubview:self.overlayView];
                [self.overlayView.superview addSubview:self];
                
            } completion:^(BOOL finished) {
                self.tableView.contentOffset = CGPointMake(0, 0);
                [self.tableView reloadData];
            }];
        } else {
            [UIView animateWithDuration:0.2 animations:^{
                [self.overlayView removeFromSuperview];
            } completion:^(BOOL finished) {
                
            }];
        }
    } else {
        
    }
    
    _selectBtn = button;
}

#pragma mark - 初始化数据


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoryArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellID forIndexPath:indexPath];
    cell.textLabel.textColor = COLOR_333;
    cell.textLabel.font = PFR_FONT(14.0f);
    cell.textLabel.text = self.categoryArr[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



#pragma mark - Tap Click
- (void)dismissTapClick:(UITapGestureRecognizer *)tap {
    [UIView animateWithDuration:0.5 animations:^{
        self.selectBtn.selected = !self.selectBtn.selected;
        [self.overlayView removeFromSuperview];
    }];
}

#pragma mark - Lazy load
- (UIView *)overlayView {
    if (!_overlayView) {
        _overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, self.zwb_bottom, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        UITapGestureRecognizer *dissTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissTapClick:)];
        [_overlayView addGestureRecognizer:dissTap];
        NSLog(@"%@", self);
    }
    return _overlayView;
}

- (UITableView *)tableView {
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) style:UITableViewStylePlain];
        [_tableView setExtraCellLineHidden];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = COLOR_MAIN_BG;
        _tableView.scrollEnabled = YES;
        [self.overlayView addSubview:_tableView];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellID];
    }
    return _tableView;
}

//- (NSMutableArray *)categoryArr {
//    if (!_categoryArr) {
//        _categoryArr = [[NSMutableArray alloc] init];
//    }
//    return _categoryArr;
//}


@end
