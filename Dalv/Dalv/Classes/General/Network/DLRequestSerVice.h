//
//  DLRequestSerVice.h
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLHttpRequest.h"
/**
 *  请求成功Handler
 */
typedef void (^DLRequestSuccessHandler)(id responseData);

/**
 *  请求失败Handler
 */
typedef void (^DLRequestFailureHandler) (NSError *error);


@interface DLRequestSerVice : NSObject

/**
 *  设置请求头
 *
 *  @param headerKV  请求头Key-Value
 */
+ (void)setHeader:(NSDictionary <NSString *, NSString *> *)headerKV;

#pragma mark - GET
/**
 *  GET请求 -> 需要自己做模型转换操作
 *
 *  @param url        请求地址
 *  @param param      请求参数 ->字典 或 模型
 *   success    请求成功回调
 *   failure    请求失败回调
 */
+ (void)GET:(NSString *)url
      param:(id)param
    success:(DLRequestSuccessHandler)successHandler
    failure:(DLRequestFailureHandler)failureHandler;


/**
 *  POST请求  -> 需要自己做模型转换操作
 *
 *  @param url        请求地址
 *  @param param      请求参数 ->字典 或 模型
 *   success    请求成功回调
 *   failure    请求失败回调
 */
+ (void)POST:(NSString *)url
       param:(id)param
     success:(DLRequestSuccessHandler)successHandler
     failure:(DLRequestFailureHandler)failureHandler;

+ (void)POSTWithFormData:(NSString *)url
                   param:(id)param
                    dict:(NSDictionary *)dict
                 success:(DLRequestSuccessHandler)successHandler
                 failure:(DLRequestFailureHandler)failureHandler;



@end
