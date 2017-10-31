//
//  UIImage+Expand.h
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/18.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Expand)

/** 返回一张自由拉伸的图片*/
+ (UIImage *)resizeImageWithName:(NSString *)name;
/** 截图图片*/
+ (UIImage *)imageWithScreenShotInView:(UIView *)view;
/** 修改图片的大小，返回新的图片*/
+ (UIImage *)resizeImageToSize:(CGSize)size sizeOfImage:(UIImage*)image;

/** 通过视频链接加载第一帧*/
+ (UIImage*)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;

@end
