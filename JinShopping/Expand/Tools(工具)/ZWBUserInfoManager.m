//
//  ZWBUserInfoManager.m
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/8.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "ZWBUserInfoManager.h"
#import "ZWBFileCacheManager.h"

@implementation ZWBUserInfoManager

static ZWBUserInfoManager *_sinleton = nil;

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sinleton = [[ZWBUserInfoManager alloc] init];
    });
    return _sinleton;
}

#if 0
/** 登录*/
- (void)didLoginInWithUserInfo:(id)userInfo {
    ZWBUserInfoModel *userModel = [ZWBUserInfoModel modelWithDictionary:userInfo];
    [userModel archive];
    [ZWBFileCacheManager saveUserData:@YES forKey:kZWBHasLoginFlag];
}

/** 退出登录*/
- (void)didLoginOut {
    [ZWBFileCacheManager removeObjectByFileName:NSStringFromClass([ZWBUserInfoModel class])];
    [ZWBFileCacheManager saveUserData:@NO forKey:kZWBHasLoginFlag];
}

/** 获取当前用户信息*/
- (ZWBUserInfoModel *)currentUserInfo {
    id obj = [ZWBFileCacheManager getObjectByFileName:NSStringFromClass([ZWBUserInfoModel class])];
    if (obj) return  obj;
    
    return nil;
}

/** 重置用户信息*/
- (void)resetUserInfoWithUserInfo:(ZWBUserInfoModel *)userModel {
    [userModel archive];
}

/** 判断是否是登陆状态*/
- (BOOL)isLogin {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kZWBHasLoginFlag];
}

- (BOOL)isCurrentUserWithUserId:(NSString *)userId {
    if ([self isLogin] == NO) {
        return NO;
    }
    
    if (kStringIsEmpty(userId)) {
        return [[self currentUserInfo].id isEqualToString:userId];
    } else {
        return NO;
    }
}
#endif

@end
