//
//  ZWBFileCacheManager.m
//  智能核心理赔系统
//
//  Created by 张文博 on 16/10/8.
//  Copyright © 2016年 张文博. All rights reserved.
//

#import "ZWBFileCacheManager.h"
#import "NSFileManager+Path.h"

@implementation ZWBFileCacheManager

/** 把对象归档存到沙盒里Cache路径下*/
+ (BOOL)saveObject:(id)object byFileName:(NSString*)fileName {
    NSString *path  = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    BOOL success = [NSKeyedArchiver archiveRootObject:object toFile:path];
    return success;
}

/** 通过文件名从沙盒中找到归档的对象*/
+ (id)getObjectByFileName:(NSString*)fileName {
    NSString *path  = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    id obj =  [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return obj;
}

/** 根据文件名删除沙盒中的归档对象*/
+ (void)removeObjectByFileName:(NSString*)fileName {
    NSString *path  = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

// 拼接文件路径
+ (NSString *)appendFilePath:(NSString *)fileName {
    
    // 1. 沙盒缓存路径
    NSString *cachesPath = [NSFileManager cachesPath];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",cachesPath,fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    return filePath;
}


#pragma mark - User Default
/** 存储用户偏好设置 到 NSUserDefults*/
+ (void)saveUserData:(id)data forKey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

/** 读取用户偏好设置*/
+ (id)readUserDataForKey:(NSString*)key {
    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return obj;
}

/** 删除用户偏好设置*/
+ (void)removeUserDataForkey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
