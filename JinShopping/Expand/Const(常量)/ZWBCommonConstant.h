//
//  ZWBCommonConstant.h
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/8.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWBCommonConstant : NSObject

/** 当前纬度*/
UIKIT_EXTERN NSString *const kZWBUserCurrentLatitude;
/** 当前经度*/
UIKIT_EXTERN NSString *const kZWBUserCurrentLongitude;
/** 当前城市*/
UIKIT_EXTERN NSString *const kZWBUserCurrentCity;
/** 是否登陆*/
UIKIT_EXTERN NSString *const kZWBHasLoginFlag;
/** 是否第一次登陆*/
UIKIT_EXTERN NSString *const kZWBHasFirstFlag;
/** 网络请求成功*/
UIKIT_EXTERN NSString *const kZWBRequestSuccessNotification;
/** 网络请求失败*/
UIKIT_EXTERN NSString *const kZWBRequestFailureNotification;
/** 键盘变化*/
UIKIT_EXTERN NSString *const kZWBKeyBoardChangeValue;
/** 是否首次编辑资料*/
UIKIT_EXTERN NSString *const kZWBIsFirstEditInfoFlag;
/** 是否刷新当前界面*/
UIKIT_EXTERN NSString *const kZWBRefreshCurrentUI;

/** 监听头像的修改*/
UIKIT_EXTERN NSString *const kZWBUploadHeaderIcon;





@end
