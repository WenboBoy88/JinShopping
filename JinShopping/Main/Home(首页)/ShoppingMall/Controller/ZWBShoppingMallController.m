//
//  ZWBShoppingMallController.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/5.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingMallController.h"

// Views
#import "ZWBHoverFlowLayout.h"
#import "ZWBShoppingMallCell.h"     // 列表
#import "ZWBCustionHeadView.h"      // 头视图

// Vendors
#import "XWDrawerAnimator.h"
#import "UIViewController+XWTransition.h"

// Ohters

static NSString *ZWBCustionHeadViewID = @"ZWBCustionHeadView";
static NSString *ZWBShoppingMallCellID = @"ZWBShoppingMallCell";

@interface ZWBShoppingMallController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout> {
    CGFloat _lastContentOffset; // 滚动的偏移量
}

/* 搜索 */
@property (nonatomic, strong) UIButton *searchBtn;
/* 滚回顶部按钮 */
@property (strong, nonatomic) UIButton *backTopButton;
/* 足迹按钮 */
@property (strong, nonatomic) UIButton *footprintButton;
/* 具体商品数据 */
@property (strong, nonatomic) NSMutableArray<ZWBShoppingMallModel *> *itemArr;

@end

@implementation ZWBShoppingMallController

#pragma mark - Initinal
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
    [self setupUI];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    if (self.navigationController.navigationBar.barTintColor == DCBGColor)return;
//    self.navigationController.navigationBar.barTintColor = DCBGColor;
}

#pragma mark - 导航栏
- (void)setupNav {
    self.navigationItem.title = @"商城";

    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.searchBtn.frame = CGRectMake(0, 0, 40, 40);
    [self.searchBtn setImage:[UIImage imageNamed:@"waimai_search"] forState:UIControlStateNormal];
    [self.searchBtn addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.searchBtn];
}

#pragma mark - Initialize
- (void)setupUI {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = COLOR_MAIN_BG;
    
    // 设置悬浮按钮
    [self setupSuspendView];
}

#pragma mark - Button Click
// 搜索
- (void)searchClick:(UIButton *)button {
    
}

#pragma mark - Load Data
- (void)loadData {
    
}

#pragma mark - 悬浮按钮
- (void)setupSuspendView {
    self.backTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.backTopButton];
    [self.backTopButton addTarget:self action:@selector(scrollToTop) forControlEvents:UIControlEventTouchUpInside];
    [self.backTopButton setImage:[UIImage imageNamed:@"btn_UpToTop"] forState:UIControlStateNormal];
    self.backTopButton.hidden = YES;
    self.backTopButton.frame = CGRectMake(SCREEN_WIDTH - 50, SCREEN_WIDTH - 60, 40, 40);
}

#pragma mark - <UICollectionViewDataSource>
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
        
        ZWBCustionHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZWBCustionHeadViewID forIndexPath:indexPath];
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
    return CGSizeMake(SCREEN_WIDTH, 40); //头部
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
    return  0;
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


#pragma mark - <UIScrollViewDelegate>
#pragma mark - 滑动代理
//开始滑动的时候记录位置
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    _lastContentOffset = scrollView.contentOffset.y;
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
    if(scrollView.contentOffset.y > _lastContentOffset){
        [self.navigationController setNavigationBarHidden:YES animated:YES];
//        self.collectionView.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20);
        self.collectionView.sd_resetLayout.spaceToSuperView(UIEdgeInsetsZero);
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
//        self.collectionView.frame = CGRectMake(0, ZWB_TopNavH, SCREEN_WIDTH, SCREEN_HEIGHT - ZWB_TopNavH);
        self.collectionView.sd_resetLayout.spaceToSuperView(UIEdgeInsetsZero);
        self.view.backgroundColor = COLOR_MAIN_BG;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //判断回到顶部按钮是否隐藏
    _backTopButton.hidden = (scrollView.contentOffset.y > SCREEN_HEIGHT) ? NO : YES;
    
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        __strong typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.footprintButton.zwb_bottom = (strongSelf.backTopButton.hidden == YES) ? SCREEN_HEIGHT - 60 : SCREEN_HEIGHT - 110;
    }];
    
}

#pragma mark - collectionView滚回顶部
- (void)scrollToTop {
    [self.collectionView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}


#pragma mark - 转场动画弹出控制器
- (void)setUpAlterViewControllerWith:(UIViewController *)vc WithDistance:(CGFloat)distance {
    
    XWDrawerAnimatorDirection direction = XWDrawerAnimatorDirectionRight;
    XWDrawerAnimator *animator = [XWDrawerAnimator xw_animatorWithDirection:direction moveDistance:distance];
    animator.parallaxEnable = YES;
    [self xw_presentViewController:vc withAnimator:animator];
    __weak typeof(self)weakSelf = self;
    [animator xw_enableEdgeGestureAndBackTapWithConfig:^{
        [weakSelf selfAlterViewback];
    }];
}

#pragma 退出界面
- (void)selfAlterViewback{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - LazyLoad
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        ZWBHoverFlowLayout *layout = [ZWBHoverFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;

        [_collectionView registerClass:[ZWBCustionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZWBCustionHeadViewID]; //头部View
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
