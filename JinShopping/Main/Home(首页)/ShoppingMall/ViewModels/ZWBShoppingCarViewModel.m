//
//  ZWBShoppingCarViewModel.m
//  JinShopping
//
//  Created by 张文博 on 2017/11/15.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBShoppingCarViewModel.h"

@interface ZWBShoppingCarViewModel () {
    
    NSArray *_shopGoodsCount;
    NSArray *_goodsPicArray;
    NSArray *_goodsPriceArray;
    NSArray *_goodsQuantityArray;
    
}
//随机获取店铺下商品数
@property (nonatomic, assign) NSInteger random;

@end

@implementation ZWBShoppingCarViewModel

#pragma mark - Init
- (instancetype)init {
    if (self = [super init]) {
        //6
        _shopGoodsCount  = @[@(1),@(8),@(5),@(2),@(4),@(4)];
        _goodsPicArray  = @[@"http://pic.5tu.cn/uploads/allimg/1606/pic_5tu_big_2016052901023305535.jpg",
                            @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023303745.jpg",
                            @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_201605291711245481.jpg",
                            @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023285762.jpg",
                            @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg",
                            @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg"];
        _goodsPriceArray = @[@(30.45),@(120.09),@(7.8),@(11.11),@(56.1),@(12)];
        _goodsQuantityArray = @[@(12),@(21),@(1),@(10),@(3),@(5)];
    }
    return self;
}

- (NSInteger)random {
    
    NSInteger from = 0;
    NSInteger to   = 5;
    
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

#pragma mark - make data

- (void)getData {
    //数据个数
    NSInteger allCount = 20;
    NSMutableArray *storeArray = [NSMutableArray arrayWithCapacity:allCount];
    NSMutableArray *shopSelectAarry = [NSMutableArray arrayWithCapacity:allCount];
    //创造店铺数据
    for (int i = 0; i < allCount; i++) {
        //创造店铺下商品数据
        // 店铺下数据的个数
        NSInteger goodsCount = [_shopGoodsCount[self.random] intValue];
        NSMutableArray *goodsArray = [NSMutableArray arrayWithCapacity:goodsCount];
        for (int x = 0; x < goodsCount; x++) {
            ZWBShoppingCarModel *cartModel = [[ZWBShoppingCarModel alloc] init];
            cartModel.p_id = @"122115465400";
            cartModel.p_price = [_goodsPriceArray[self.random] floatValue];
            cartModel.p_name = [NSString stringWithFormat:@"%@这是一个很长很长的名字呀呀呀呀呀呀",@(x)];
            cartModel.p_stock = 22;
            cartModel.p_imageUrl = _goodsPicArray[self.random];
            cartModel.p_quantity = [_goodsQuantityArray[self.random] integerValue];
            [goodsArray addObject:cartModel];
        }
        [storeArray addObject:goodsArray];
        [shopSelectAarry addObject:@(NO)];
    }
    self.cartData = storeArray;
    self.shopSelectArray = shopSelectAarry;
}

- (float)getAllPrices {
    
    NSInteger storeCount = self.cartData.count;
    NSInteger storeSelectCount = self.shopSelectArray.count;
    if (storeSelectCount == storeCount && storeCount != 0) {
        self.isSelectAll = YES;
    }
    // 遍历
    float allPrices = 0;
    for (NSArray *storeArr in self.cartData) {
        for (ZWBShoppingCarModel *model in storeArr) {
            if (!model.isSelect) {
                self.isSelectAll = NO;
            }
            allPrices += model.p_quantity * model.p_price;
        }
    }
    self.allPrices = allPrices;
    
    return allPrices;
}

- (void)selectAll:(BOOL)isSelect{
    
    self.isSelectAll = isSelect;

    for (NSInteger i = 0; i < self.shopSelectArray.count; i++) {
        [self.shopSelectArray replaceObjectAtIndex:i withObject:@(isSelect)];
    }
    float allPrices = 0;
    for (NSMutableArray *storeArr in self.cartData) {
        for (ZWBShoppingCarModel *model in storeArr) {
            model.isSelect = isSelect;
            if (model.isSelect) {
                allPrices += model.p_quantity * model.p_price;
            }
        }
    }
    self.allPrices = allPrices;
    
    if (self.opertaionStatusBlock) {
        self.opertaionStatusBlock();
    }
}

- (void)rowSelect:(BOOL)isSelect indexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    NSMutableArray *goodsArray = self.cartData[section];
    NSInteger shopCount = goodsArray.count;
    ZWBShoppingCarModel *model = goodsArray[row];
    [model setValue:@(isSelect) forKey:@"isSelect"];
    //判断是都到达足够数量
    NSInteger isSelectShopCount = 0;
    for (ZWBShoppingCarModel *model in goodsArray) {
        if (model.isSelect) {
            isSelectShopCount++;
        }
    }
    [self.shopSelectArray replaceObjectAtIndex:section withObject:@(isSelectShopCount==shopCount?YES:NO)];
    
    if (self.opertaionStatusBlock) {
        self.opertaionStatusBlock();
    }
    
    self.allPrices = [self getAllPrices];
    
    
}

- (void)rowChangeQuantity:(NSInteger)quantity indexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    ZWBShoppingCarModel *model = self.cartData[section][row];
    
    [model setValue:@(quantity) forKey:@"p_quantity"];
    
    // 刷新界面
    if (self.opertaionStatusBlock) {
        self.opertaionStatusBlock();
    }
    
    self.allPrices = [self getAllPrices];
}


#pragma mark - Lazy load
- (NSMutableArray *)cartData {
    if (!_cartData) {
        _cartData = [[NSMutableArray alloc] init];
    }
    return _cartData;
}

- (NSMutableArray *)shopSelectArray {
    if (!_shopGoodsCount) {
        _shopGoodsCount = [[NSMutableArray alloc] init];
    }
    return _shopSelectArray;
}

@end
