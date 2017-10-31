//
//  ZWBBaseCollectionViewController.h
//  JinShopping
//
//  Created by 张文博 on 2017/10/17.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBBaseViewController.h"

@interface ZWBBaseCollectionViewController : ZWBBaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    
    NSInteger _page;
    NSInteger _rows;
    NSMutableArray *_dataArray;
    UICollectionView *_collectionView;
    CGFloat _itemWH;
    CGFloat _margin;
}

@property (nonatomic) NSInteger page;

@property (nonatomic) NSInteger rows;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UICollectionView *collectionView;

/** 结束刷新*/
- (void)endRefresh;

@end
