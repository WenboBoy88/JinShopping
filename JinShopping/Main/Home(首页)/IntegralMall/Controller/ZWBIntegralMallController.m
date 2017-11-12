//
//  ZWBIntegralMallController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/12.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBIntegralMallController.h"

// Views
#import "ZWBIntegralMallHeaderView.h"
#import "ZWBIntegralDetailFooterView.h"
#import "ZWBIntegralMallItemHeaderView.h"
#import "ZWBIntegralMallItemFooterView.h"

#import "ZWBIntegralMallListCell.h"
#import "ZWBShoppingMallCell.h"

// Others
static NSString *ZWBIntegralMallHeaderViewID = @"ZWBIntegralMallHeaderView";
static NSString *ZWBIntegralDetailFooterViewID = @"ZWBIntegralDetailFooterView";
static NSString *ZWBIntegralMallItemHeaderViewID = @"ZWBIntegralMallItemHeaderView";
static NSString *ZWBIntegralMallItemFooterViewID = @"ZWBIntegralMallItemFooterView";
static NSString *ZWBIntegralMallListCellID = @"ZWBIntegralMallListCell";
static NSString *ZWBShoppingMallCellID     = @"ZWBShoppingMallCell";

// 间隔
static NSString *UICollectionElementKindSectionHeaderID = @"UICollectionElementKindSectionHeader";
static NSString *UICollectionElementKindSectionFooterID = @"UICollectionElementKindSectionFooter";

@interface ZWBIntegralMallController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ZWBIntegralMallController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化导航栏
    [self setupNav];
    // 初始化界面
    [self setupUI];
}
#pragma mark - 初始化导航栏
- (void)setupNav {
    self.navigationItem.title = @"积分商城";
 
    // 刷新
    [self.collectionView reloadData];
}

#pragma mark - 初始化界面
- (void)setupUI {
    self.view.backgroundColor = COLOR_WHITE;
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else if (section == 1) {
        return 1;
    } else {
        return self.dataArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    if (indexPath.section == 0) {
        return 0;
    } else if (indexPath.section == 1) {
        ZWBIntegralMallListCell *listCell = [collectionView dequeueReusableCellWithReuseIdentifier:ZWBIntegralMallListCellID forIndexPath:indexPath];
        
        cell = listCell;
    } else {
        ZWBShoppingMallCell *gridCell = [collectionView dequeueReusableCellWithReuseIdentifier:ZWBShoppingMallCellID forIndexPath:indexPath];
        gridCell.isHiddenConvertBtn = NO;
        cell = gridCell;
    }
    return cell;
}

#pragma mark - UICollectionViewDelegate
// 点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
}

#pragma mark - Header Footer
// 表头和标尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) { // Header
        if (indexPath.section == 0) {
            ZWBIntegralMallHeaderView *bannerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZWBIntegralMallHeaderViewID forIndexPath:indexPath];
            reusableview = bannerView;
        } else if (indexPath.section == 2) {
            ZWBIntegralMallItemHeaderView *itemHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZWBIntegralMallItemHeaderViewID forIndexPath:indexPath];
            reusableview = itemHeaderView;
        }
    } else if (kind == UICollectionElementKindSectionFooter) { // Footer
        if (indexPath.section == 0) {
            ZWBIntegralDetailFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ZWBIntegralDetailFooterViewID forIndexPath:indexPath];
            reusableview = footerView;
        } else if (indexPath.section == 2) {
            ZWBIntegralMallItemFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ZWBIntegralMallItemFooterViewID forIndexPath:indexPath];
            [footerView setMoreButtonClickBlock:^(NSInteger clickIndex) {
                
            }];
            reusableview = footerView;
        }
    }
    return reusableview;

}

// 列表高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeZero;
    } else if (indexPath.section == 1) {
        return CGSizeMake(SCREEN_WIDTH, 175);
    } else if (indexPath.section == 2) {
        return CGSizeMake((SCREEN_WIDTH - 4)/2, (SCREEN_WIDTH - 4)/2 + 40);
    }
    return CGSizeZero;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            layoutAttributes.size = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.35);
        } else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
            layoutAttributes.size = CGSizeMake(SCREEN_WIDTH * 0.5, SCREEN_WIDTH * 0.2);
        } else{
            layoutAttributes.size = CGSizeMake(SCREEN_WIDTH * 0.25, SCREEN_WIDTH * 0.35);
        }
    }
    return layoutAttributes;
}

// 头高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.39);
    } else if (section == 2) {
        return CGSizeMake(SCREEN_WIDTH, 50.0f);
    }
    return CGSizeZero;
}

// 尾高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 0 || section == 2) {
        return CGSizeMake(SCREEN_WIDTH, 60.0f);
    }
    return CGSizeZero;
}

#pragma mark - UICollectionViewDelegateFlowLayout
#pragma mark - X
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {

    return section == 2 ? 4 : 0;
}

#pragma mark - Y
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return section == 2 ? 4 : 0;
}

#pragma mark - 设置StatusBar为白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Lazy load
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing      = 0; //Y
        layout.minimumInteritemSpacing = 0; //X
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_collectionView];
        _collectionView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
        //注册header
        [_collectionView registerClass:[ZWBIntegralMallHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZWBIntegralMallHeaderViewID];
        [_collectionView registerClass:[ZWBIntegralMallItemHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZWBIntegralMallItemHeaderViewID];
        //注册Cell
        [_collectionView registerNib:[UINib nibWithNibName:@"ZWBIntegralMallListCell" bundle:nil] forCellWithReuseIdentifier:ZWBIntegralMallListCellID];
        [_collectionView registerClass:[ZWBShoppingMallCell class] forCellWithReuseIdentifier:ZWBShoppingMallCellID];
        // 注册Footer
        [_collectionView registerNib:[UINib nibWithNibName:@"ZWBIntegralDetailFooterView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ZWBIntegralDetailFooterViewID];
        [_collectionView registerClass:[ZWBIntegralMallItemFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ZWBIntegralMallItemFooterViewID];
        // 间隔
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:UICollectionElementKindSectionHeaderID];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:UICollectionElementKindSectionFooterID];
    }
    return _collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
