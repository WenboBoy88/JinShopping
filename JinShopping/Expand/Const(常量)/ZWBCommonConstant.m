//
//  ZWBCommonConstant.m
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/8.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "ZWBCommonConstant.h"

@implementation ZWBCommonConstant

/** 当前纬度*/
NSString *const kZWBUserCurrentLatitude = @"kZWBUserCurrentLatitude";
/** 当前经度*/
NSString *const kZWBUserCurrentLongitude = @"kZWBUserCurrentLongitude";
/** 当前城市*/
NSString *const kZWBUserCurrentCity = @"kZWBUserCurrentCity";
/** 是否登陆*/
NSString *const kZWBHasLoginFlag = @"kZWBHasLoginFlag";
/** 是否第一次登陆*/
NSString *const kZWBHasFirstFlag = @"kZWBHasFirstFlag";
/** 网络请求成功*/
NSString *const kZWBRequestSuccessNotification = @"kZWBRequestSuccessNotification";
/** 网络请求失败*/
NSString *const kZWBRequestFailureNotification = @"kZWBRequestFailureNotification";
/** 监听变化*/
NSString *const kZWBKeyBoardChangeValue = @"kZWBKeyBoardChange";
/** 是否首次编辑资料*/
NSString *const kZWBIsFirstEditInfoFlag = @"kZWBIsFirstEditInfoFlag";
/** 是否刷新当前界面*/
NSString *const kZWBRefreshCurrentUI = @"kZWBRefreshCurrentUI";

/** 监听是否修改头像*/
NSString *const kZWBUploadHeaderIcon = @"kZWBUploadHeaderIcon";


@end
