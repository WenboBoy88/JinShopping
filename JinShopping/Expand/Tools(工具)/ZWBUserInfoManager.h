//
//  ZWBUserInfoManager.h
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/8.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ZWBUserInfoModel.h"

@interface ZWBUserInfoManager : NSObject

+ (instancetype)sharedManager;

#if 0
/** 登录成功*/
- (void)didLoginInWithUserInfo:(id)userInfo;

/** 退出登录*/
- (void)didLoginOut;

/** 获取当前用户信息*/
- (ZWBUserInfoModel *)currentUserInfo;

/** 重置用户信息*/
- (void)resetUserInfoWithUserInfo:(ZWBUserInfoModel *)userModel;

/** 判断是否是当前的用户*/
- (BOOL)isCurrentUserWithUserId:(NSString *)userId;

/** 用来记录是否是登陆状态 */
@property (nonatomic, assign) BOOL isLogin;
#endif


@end
