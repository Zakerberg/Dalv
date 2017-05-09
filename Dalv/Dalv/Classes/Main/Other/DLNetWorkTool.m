//
//  DLNetWorkTool.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLNetWorkTool.h"

@implementation DLNetWorkTool


// 全局访问点
+ (instancetype)shared{
    static dispatch_once_t onceToken;
    static DLNetWorkTool *instance;
    dispatch_once(&onceToken, ^{
        instance = [DLNetWorkTool new];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        instance.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return instance;
}



- (void)requestMethod:(NetworkMethod )method urlString: (NSString *)urlString parameters:(id) parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    // GET
    if (method == GET) {
        [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            id rueslt = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            success(rueslt);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }else{
        // POST
        [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            id rueslt = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            success(rueslt);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}

// 登录接口
- (void)testLoginForUserName: (NSString *)userName password:(NSString *)password success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    NSString *urlString = @"http://www.baidu.com/123456789";
    NSDictionary *dict = @{@"nameqwerty": userName, @"passwd":password};
    
    [self requestMethod:GET urlString:urlString parameters:dict success:success failure:failure];
}



@end
