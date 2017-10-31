//
//  ZWBRequestManager.m
//  网络请求
//
//  Created by 张文博 on 16/9/20.
//  Copyright © 2016年 zhangwenbo. All rights reserved.
//

#import "ZWBRequestManager.h"

@interface AFHTTPSessionManager (Shared)

+ (instancetype)sharedManager;

@end

@implementation AFHTTPSessionManager (Shared)

+ (instancetype)sharedManager {
    static AFHTTPSessionManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return _manager;
}

@end

@implementation ZWBRequestManager

+ (void)GET:(NSString *)URLString parameters:(id)parameters responseSeializerType:(ZWBResponseSeializerType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    [manager.requestSerializer setValue:[self getRequestHeader] forHTTPHeaderField:@"Cookie"];
 
/**
    // 请求头
    NSString *value = [NSString stringWithFormat:@"Bearer %@",[CommonTool validStringWithObj:kUserInfo[@"token"]]];
    if (value) {
        [manager.requestSerializer setValue:value forHTTPHeaderField:@"Authorization"];
    }
     */
    if (type != ZWBResponseSeializerTypeJSON && type != ZWBResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    
/*
     // https证书设置
     AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
     policy.allowInvalidCertificates = YES;
     manager.securityPolicy  = policy;
     */
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];

}

+ (void)POST:(NSString *)URLString parameters:(id)parameters responseSeialierType:(ZWBResponseSeializerType)type success:(void (^)(id responseObject))success failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
    // 如果不是JSON 或者 不是Default 才设置解析器类型
    if (type != ZWBResponseSeializerTypeJSON && type != ZWBResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        // 如果返回的数据是二进制，则先进行解析 在使用
        if ([responseObject isKindOfClass:[NSData class]]) {
            // 解析有问题说明返回的数据responseObject为空
            @try {
                responseObject = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            } @catch (NSException *exception) {
                responseObject = @"";
            } @finally {
                NSLog(@"解析完成");
            }
        }
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // [MBProgressHUD hideAllHUDsInView:nil];
        // [MBProgressHUD showMessage:@"网络失败~请重新再试" toView:nil];
        // 失败
        if (failure) {
            failure(error);
        }
    }];

}

+ (void)POST:(NSString *)URLString parameters:(id)parameters responseSeialierType:(ZWBResponseSeializerType)type constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
// 请求头
//    NSString *value = [NSString stringWithFormat:@"Bearer %@",[CommonTool validStringWithObj:kUserInfo[@"token"]]];
//    if (value) {
//        [manager.requestSerializer setValue:value forHTTPHeaderField:@"Authorization"];
//    }
    
    // 如果不是JSON 或者 不是Default 才设置解析器类型
    if (type != ZWBResponseSeializerTypeJSON && type != ZWBResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (block) {
            block(formData);
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSData *data = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
//        //NSData 转NSString
//        NSString *result  = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"%@", result);
        id object = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (success) {
            success(object);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
//        [MBProgressHUD showMessage:@"网络出错" toView:[UIApplication sharedApplication].keyWindow];
        NSLog(@"%@", error);
        if (failure) {
            failure(error);
        }
        
    }];

}


+ (void)cancelAllRequests {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    [manager.operationQueue cancelAllOperations];
}

#pragma mark - Private Method
+ (NSString *)getRequestHeader {
    
    return @"";
}

+ (AFHTTPResponseSerializer *)responseSearalizerWithSerilizerType:(ZWBResponseSeializerType)serilizerType {
    
    switch (serilizerType) {
            
        case ZWBResponseSeializerTypeDefault: // default is JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case ZWBResponseSeializerTypeJSON: // JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case ZWBResponseSeializerTypeXML: // XML
            return [AFXMLParserResponseSerializer serializer];
            break;
            
        case ZWBResponseSeializerTypePlist: // Plist
            return [AFPropertyListResponseSerializer serializer];
            break;
            
        case ZWBResponseSeializerTypeData: // Data
            return [AFHTTPResponseSerializer serializer];
            break;
    
        case ZWBResponseSeializerTypeCompound: // Compound
            return [AFCompoundResponseSerializer serializer];
            break;
            
        case ZWBResponseSeializerTypeImage: // Image
            return [AFImageResponseSerializer serializer];
            break;
            
            
        default:  // 默认解析器为 JSON解析
            return [AFJSONResponseSerializer serializer];
            break;
    }
}
@end
