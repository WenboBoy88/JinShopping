//
//  ZWBPhotosContainerView.m
//  JinShopping
//
//  Created by 张文博 on 2017/10/28.
//  Copyright © 2017年 张文博. All rights reserved.
//

#import "ZWBPhotosContainerView.h"

@implementation ZWBPhotosContainerView {
    // 图片名称数组
    NSMutableArray *_imageViewsArray;
}

#pragma mark - Initinal
- (instancetype)initWithMaxItemsCount:(NSInteger)count {
    if (self = [super init]) {
        self.maxItemsCount = count;
    }
    return self;
}

#pragma mark - Getter Setter Methods
- (void)setPhotoNamesArray:(NSArray *)photoNamesArray {
    _photoNamesArray = photoNamesArray;
    
    if (!_imageViewsArray) {
        _imageViewsArray = [NSMutableArray new];
    }
    
    int needsToAddItemsCount = (int)(_photoNamesArray.count - _imageViewsArray.count);
    
    if (needsToAddItemsCount > 0) {
        for (int i = 0; i < needsToAddItemsCount; i++) {
            UIImageView *imageView = [UIImageView new];
            [self addSubview:imageView];
            [_imageViewsArray addObject:imageView];
        }
    }
    
    NSMutableArray *temp = [NSMutableArray new];
    
    [_imageViewsArray enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        if (idx < _photoNamesArray.count) {
            imageView.hidden = NO;
            imageView.sd_layout.autoHeightRatio(1);
            imageView.image = [UIImage imageNamed:_photoNamesArray[idx]];
            [temp addObject:imageView];
        } else {
            [imageView sd_clearAutoLayoutSettings];
            imageView.hidden = YES;
        }
    }];
    
    [self setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:3 verticalMargin:10 horizontalMargin:10 verticalEdgeInset:0 horizontalEdgeInset:0];
}


#pragma mark - Lazy load


@end
