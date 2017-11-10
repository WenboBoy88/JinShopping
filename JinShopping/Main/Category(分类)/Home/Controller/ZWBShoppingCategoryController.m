//
//  ZWBShoppingCategoryController.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/17.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingCategoryController.h"

// Models

// Views
#import "ZWBBrandsSortHeadView.h"
#import "ZWBGoodsSortCell.h"
#import "ZWBGoodsItemCell.h"

// Others

#define TableView_W  100
static NSString *ZWBBrandsSortHeadViewID = @"ZWBBrandsSortHeadView";
static NSString *ZWBGoodsSortCellID = @"ZWBGoodsSortCell";
static NSString *ZWBGoodsItemCellID = @"ZWBGoodsItemCell";

@interface ZWBShoppingCategoryController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/* tableView */
@property (nonatomic, strong) UITableView *tableView;
/* collectionViw */
@property (nonatomic, strong) UICollectionView *collectionView;
/* 左边数据 */
@property (nonatomic, strong) NSMutableArray<ZWBGoodsItemModel *> *titleItemArr;
/* 右边数据 */
@property (nonatomic, strong) NSMutableArray<ZWBGoodsMainModel *> *mainItemArr;

@end

@implementation ZWBShoppingCategoryController

#pragma mark - Initinal
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
    
    [self setupUI];
    
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.navigationController.navigationBar.barTintColor == RGBA(231, 23, 37, 1.0)) return;
    self.navigationController.navigationBar.barTintColor = RGBA(231, 23, 37, 1.0);
}

#pragma mark - 初始化导航栏
- (void)setupNav {
    
}

#pragma mark - 初始化界面
- (void)setupUI {
    self.view.backgroundColor = COLOR_MAIN_BG;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - 加载数据
- (void)loadData {
    
}


#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleItemArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    DCClassCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:DCClassCategoryCellID forIndexPath:indexPath];
//    cell.titleItem = _titleItem[indexPath.row];
//    return cell;
    return nil;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    self.mainItemArr = [DCClassMianItem mj_objectArrayWithFilename:_titleItem[indexPath.row].fileName];
//    [self.collectionView reloadData];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.mainItemArr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.mainItemArr[section].goods.count;
    return 0;
}

#pragma mark - <UICollectionViewDelegate>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *gridcell = nil;
//    if ([self.mainItemArr[self.mainItemArr.count - 1].title isEqualToString:@"热门品牌"]) {
//        if (indexPath.section == _mainItem.count - 1) {//品牌
//            DCBrandSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCBrandSortCellID forIndexPath:indexPath];
//            cell.subItem = _mainItem[indexPath.section].goods[indexPath.row];
//            gridcell = cell;
//        } else {//商品
//            DCGoodsSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsSortCellID forIndexPath:indexPath];
//            cell.subItem = _mainItem[indexPath.section].goods[indexPath.row];
//            gridcell = cell;
//        }
//    } else {//商品
//        DCGoodsSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsSortCellID forIndexPath:indexPath];
//        cell.subItem = _mainItem[indexPath.section].goods[indexPath.row];
//        gridcell = cell;
//    }
    
    return gridcell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
//        DCBrandsSortHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCBrandsSortHeadViewID forIndexPath:indexPath];
//        headerView.headTitle = _mainItem[indexPath.section];
//        reusableview = headerView;
    }
    return reusableview;
}
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if ([self.mainItem[_mainItem.count - 1].title isEqualToString:@"热门品牌"]) {
//        if (indexPath.section == _mainItem.count - 1) {//品牌
//            return CGSizeMake((ScreenW - tableViewH - 6)/3, 60);
//        }else{//商品
//            return CGSizeMake((ScreenW - tableViewH - 6)/3, (ScreenW - tableViewH - 6)/3 + 20);
//        }
//    } else {
//        return CGSizeMake((ScreenW - tableViewH - 6)/3, (ScreenW - tableViewH - 6)/3 + 20);
//    }
    return CGSizeZero;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_WIDTH, 25);
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"点击了个第%zd分组第%zd几个Item",indexPath.section,indexPath.row);
//    DCGoodsSetViewController *goodSetVc = [[DCGoodsSetViewController alloc] init];
//    goodSetVc.goodPlisName = @"ClasiftyGoods.plist";
//    [self.navigationController pushViewController:goodSetVc animated:YES];
}

#pragma 设置StatusBar为白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


#pragma mark - LazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.frame = CGRectMake(0, 0, tableViewH, ScreenH - DCTopNavH - DCBottomTabH);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableView];
        
        [_tableView registerClass:[ZWBGoodsItemCell class] forCellReuseIdentifier:ZWBGoodsItemCellID];
        _tableView.sd_layout
        .topEqualToView(self.view)
        .leftEqualToView(self.view)
        .bottomEqualToView(self.view)
        .widthIs(TableView_W);
    }
    return _tableView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumInteritemSpacing = 3; //X
        layout.minimumLineSpacing = 5;  //Y
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_collectionView];
//        _collectionView.frame = CGRectMake(TableView_W, DCTopNavH, ScreenW - tableViewH, ScreenH - DCTopNavH - DCBottomTabH);
        //注册Cell
        [_collectionView registerClass:[ZWBGoodsSortCell class] forCellWithReuseIdentifier:ZWBGoodsSortCellID];
        //注册Header
        [_collectionView registerClass:[ZWBBrandsSortHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZWBBrandsSortHeadViewID];
        
        _collectionView.sd_layout
        .topEqualToView(self.view)
        .rightEqualToView(self.view)
        .bottomEqualToView(self.view)
        .leftSpaceToView(self.tableView, 0);
        
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
