//
//  DLRequestSerVice.m
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRequestSerVice.h"

@implementation DLRequestSerVice
+ (void)setHeader:(NSDictionary <NSString *, NSString *> *)headerKV {
    
    [DLHttpRequest setHeader:^(AFHTTPRequestSerializer *requestSerializer) {
        for (NSString *key in headerKV.allKeys) {
            [requestSerializer setValue:[headerKV valueForKey:key] forHTTPHeaderField:key];
        }
    }];
}

// 此处设置请求头
+ (void)setReqHeader {
    
}

+ (void)GET:(NSString *)url
      param:(id)param
    success:(DLRequestSuccessHandler)successHandler
    failure:(DLRequestFailureHandler)failureHandler {
    
    id paramsJSON = [param mj_JSONObject];
    
    [self setReqHeader];
    [DLHttpRequest GET:url params:paramsJSON success:^(id responseData) {
        NSLog(@"GET:%@ -->请求成功，响应结果-->%@", url, responseData);
        
        successHandler ? successHandler(responseData) : nil;
        
    } failure:^(NSError *error) {
        //        NSLog(@"GET:%@ -->请求失败，错误:%@", url, error);
        NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"服务器的错误原因:%@",str);
        
        failureHandler ? failureHandler(error) : nil;
    }];
}
+ (void)POST:(NSString *)url
       param:(id)param
     success:(DLRequestSuccessHandler)successHandler
     failure:(DLRequestFailureHandler)failureHandler {
    
    id paramsJSON = [param mj_JSONObject];
    
    [self setReqHeader];
    [DLHttpRequest POST:url params:paramsJSON success:^(id responseData) {
        NSLog(@"POST:%@ -->请求成功，响应结果-->%@", url, responseData);
        
        successHandler ? successHandler(responseData) : nil;
        
    } failure:^(NSError *error) {
        //        NSLog(@"POST:%@ -->请求失败，错误:%@", url, error);
        NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"服务器的错误原因:%@",str);
        failureHandler ? failureHandler(error) : nil;
    }];
}


+ (void)POSTWithFormData:(NSString *)url
                   param:(id)param
                    dict:(NSDictionary *)dict
                 success:(DLRequestSuccessHandler)successHandler
                 failure:(DLRequestFailureHandler)failureHandler{
    
    id paramsJSON = [param mj_JSONObject];
    
    [self setReqHeader];
    
    [DLHttpRequest POSTWithFormData:url params:paramsJSON constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (NSString *key in dict.allKeys) {
            
            id value = dict[key];
            if ([value isKindOfClass:[NSArray class]]) {
                for (NSString *value in dict[key]) {
                    NSData *jsonData = [value dataUsingEncoding:NSUTF8StringEncoding];
                    [formData appendPartWithFormData:jsonData name:key];
                }
            } else {
                NSData *jsonData = [value dataUsingEncoding:NSUTF8StringEncoding];
                [formData appendPartWithFormData:jsonData name:key];
            }
        }
    } cachePolicy:HttpRequestDefault success:^(id responseData) {
        NSLog(@"POST:%@ -->请求成功，响应结果-->%@", url, responseData);
        
        successHandler ? successHandler(responseData) : nil;
        
    } failure:^(NSError *error) {
        NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"服务器的错误原因:%@",str);
        NSLog(@"POST:%@ -->请求失败，错误:%@", url, error);
        
        failureHandler ? failureHandler(error) : nil;
        
    }];
}


@end
