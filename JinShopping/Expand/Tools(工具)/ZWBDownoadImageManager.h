//
//  ZWBDownoadImageManager.h
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/27.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWBDownoadImageManager : NSObject

+ (void)downLoadImageWithURL:(NSURL *)URL finishHandle:(void(^)(BOOL finished, UIImage *finishedImage))finishHandle;


+ (void)downLoadImageWithUrl:(NSString *)url finishHandle:(void(^)(BOOL finished, UIImage *finishedImage))finishHandle;

+ (void)downLoadImageWithUrl:(NSString *)url finishHandle:(void(^)(BOOL finished, UIImage *finishedImage))finishHandle progressHandle:(void(^)(CGFloat progres))progressHandle;


+ (void)downLoadImageWithURL:(NSURL *)URL finishHandle:(void(^)(BOOL finished, UIImage *finishedImage))finishHandle progressHandle:(void(^)(CGFloat progres))progressHandle;


+ (UIImage *)cacheImageWithUrl:(NSString *)url;

+ (UIImage *)cacheImageWithURL:(NSURL *)URL;


@end
