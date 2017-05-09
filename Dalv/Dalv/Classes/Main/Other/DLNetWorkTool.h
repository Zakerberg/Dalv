//
//  DLNetWorkTool.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <AFNetworking.h>

// 请求方式枚举
typedef NS_ENUM(NSUInteger, NetworkMethod) {
    GET,
    POST
};
@interface DLNetWorkTool : AFHTTPSessionManager

// 全局访问点
+ (instancetype)shared;

- (void)requestMethod:(NetworkMethod )method urlString: (NSString *)urlString parameters:(id) parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


// 登录接口
- (void)testLoginForUserName: (NSString *)userName password:(NSString *)password success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


@end
