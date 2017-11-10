//
//  ZWBStoreGoodsController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/9.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBStoreGoodsController.h"

// Views
#import "ZWBHoverFlowLayout.h"
#import "ZWBShoppingMallCell.h"     // 列表
#import "ZWBStoreCustionView.h"      // 头视图

// Vendors
#import "XWDrawerAnimator.h"
#import "UIViewController+XWTransition.h"

// Ohters

static NSString *ZWBStoreCustionViewID = @"ZWBStoreCustionView";
static NSString *ZWBShoppingMallCellID = @"ZWBShoppingMallCell";

@interface ZWBStoreGoodsController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    CGFloat _lastContentOffset; // 滚动的偏移量
}

/* 滚回顶部按钮 */
@property (strong, nonatomic) UIButton *backTopButton;
/* 具体商品数据 */
@property (strong, nonatomic) NSMutableArray<ZWBShoppingMallModel *> *itemArr;

@end

@implementation ZWBStoreGoodsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化导航栏
    [self setupNav];
    [self setupUI];
}

- (void)setupNav {
    self.navigationItem.title = @"全部商品";
}

#pragma mark - Initialize
- (void)setupUI {
    
    [self.collectionView reloadData];
}


#pragma mark - Load Data
- (void)loadData {
    
}


#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

#pragma mark - <UICollectionViewDelegate>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZWBShoppingMallCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZWBShoppingMallCellID forIndexPath:indexPath];
    cell.mallModel = self.dataArray[indexPath.row];
    
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        ZWBStoreCustionView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZWBStoreCustionViewID forIndexPath:indexPath];
        reusableview = headerView;
    }
    return reusableview;
}

#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((SCREEN_WIDTH - 4)/2, (SCREEN_WIDTH - 4)/2 + 60);
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_WIDTH, 44); //头部
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}


#pragma mark - 边间距属性默认为0
#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
    
}
#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了商品第%zd",indexPath.row);
    
//    DCGoodDetailViewController *dcVc = [[DCGoodDetailViewController alloc] init];
//    dcVc.goodTitle = _setItem[indexPath.row].main_title;
//    dcVc.goodPrice = _setItem[indexPath.row].price;
//    dcVc.goodSubtitle = _setItem[indexPath.row].goods_title;
//    dcVc.shufflingArray = _setItem[indexPath.row].images;
//    dcVc.goodImageView = _setItem[indexPath.row].image_url;
//
//    [self.navigationController pushViewController:dcVc animated:YES];
//
//    __weak typeof(self)weakSelf = self;
//    [UIView animateWithDuration:0.3 animations:^{
//        weakSelf.colonView.dc_x = ScreenW;
//    }completion:^(BOOL finished) {
//        [weakSelf.colonView removeFromSuperview];
//    }];
}

#pragma mark - LazyLoad
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        ZWBHoverFlowLayout *layout = [ZWBHoverFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = COLOR_MAIN_BG;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ZWBStoreCustionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZWBStoreCustionViewID]; //头部View
        [_collectionView registerClass:[ZWBShoppingMallCell class] forCellWithReuseIdentifier:ZWBShoppingMallCellID];//cell
        [self.view addSubview:_collectionView];
        _collectionView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    }
    return _collectionView;
}

- (NSMutableArray<ZWBShoppingMallModel *> *)itemArr {
    if (!_itemArr) {
        _itemArr = [[NSMutableArray alloc] init];
    }
    return _itemArr;
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
