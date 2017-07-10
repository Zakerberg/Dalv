//
//  DLHttpRequest.h
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
/**
 *  请求成功block
 */
typedef void (^HttpRequestSuccessBlock)(id responseData);

/**
 *  请求失败block
 */
typedef void (^HttpRequestFailureBlock) (NSError *error);

/**
 *  请求响应block
 */
typedef void (^HttpResponseBlock)(id dataObj, NSError *error);

/**
 *  监听进度响应block
 */
typedef void (^HttpProgressBlock)(NSProgress * progress);

/**
 *  请求缓存方式
 */
typedef NS_ENUM(NSUInteger, HttpRequestCachePolicy) {
    HttpRequestDefault = 0,              // 只请求数据，不缓存数据
    HttpRequestReloadIgnoringCache,      // 忽略缓存，重新请求
    HttpRequestReturnCacheDataThenLoad,  // 有缓存先返回缓存，同步请求数据
    HttpRequestReturnCacheDataElseLoad,  // 有缓存用缓存，无缓存重新请求(用于数据不变时)
    HttpRequestReturnCacheDataDontLoad   // 有缓存就用缓存，没有缓存就不发请求，当做请求出错处理(用于离线模式)
};

@interface DLHttpRequest : NSObject

/**
 *  请求超时时间
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 *  请求缓存策略
 */
@property (nonatomic, assign) HttpRequestCachePolicy cachePolicy;

/**
 *  创建单例请求对象
 */
+ (instancetype)sharedInstance;

/**
 *  移除所有缓存
 */
+ (void)removeAllCaches;

/**
 *  取消所有网络请求
 */
+ (void)cancelAllOperations;

+ (void)setHeader:(void (^)(AFHTTPRequestSerializer *requestSerializer))handler;

/**
 *  GET请求 -> 默认只请求数据，不做缓存。HttpRequestDefault方式
 *
 *  @param url            请求路径
 *  @param params         请求参数
 *  @param successHandler 请求成功后的回调
 *  @param failureHandler 请求失败后的回调
 */
+ (void)GET:(NSString *)url
     params:(NSDictionary *)params
    success:(HttpRequestSuccessBlock)successHandler
    failure:(HttpRequestFailureBlock)failureHandler;

/**
 *  POST请求 -> 默认只请求数据，不做缓存。HttpRequestDefault方式
 *
 *  @param url            请求路径
 *  @param params         请求参数
 *  @param successHandler 请求成功后的回调
 *  @param failureHandler 请求失败后的回调
 */
+ (void)POST:(NSString *)url
      params:(NSDictionary *)params
     success:(HttpRequestSuccessBlock)successHandler
     failure:(HttpRequestFailureBlock)failureHandler;

/**
 *  GET请求
 *
 *  @param url            请求路径
 *  @param params         请求参数
 *  @param cachePolicy    缓存策略
 *  @param successHandler 请求成功后的回调
 *  @param failureHandler 请求失败后的回调
 */
+ (void)GET:(NSString *)url
     params:(NSDictionary *)params
cachePolicy:(HttpRequestCachePolicy)cachePolicy
    success:(HttpRequestSuccessBlock)successHandler
    failure:(HttpRequestFailureBlock)failureHandler;

/**
 *  POST请求
 *
 *  @param url            请求路径
 *  @param params         请求参数
 *  @param cachePolicy    缓存策略
 *  @param successHandler 请求成功后的回调
 *  @param failureHandler 请求失败后的回调
 */
+ (void)POST:(NSString *)url
      params:(NSDictionary *)params
 cachePolicy:(HttpRequestCachePolicy)cachePolicy
     success:(HttpRequestSuccessBlock)successHandler
     failure:(HttpRequestFailureBlock)failureHandler;

// AFN 参数加在AFMultipartFormData --用于表参数
+ (void)POSTWithFormData:(NSString *)url
                  params:(NSDictionary *)params
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
             cachePolicy:(HttpRequestCachePolicy)cachePolicy
                 success:(HttpRequestSuccessBlock)successHandler
                 failure:(HttpRequestFailureBlock)failureHandler;

// 用系统的网络请求 把参数加在dody里
+ (void)POSTWithData:(NSString *)URLString
              params:(NSDictionary *)parameters
                body:(NSData *)data
             success:(void (^)(NSDictionary *))success
             failure:(void (^)(NSError *))failure;

// AFN 表单上传图片
+ (void)UploadImageWithUrl:(NSString *)URLString
                    params:(NSDictionary *)parameters
               imageParams:(UIImage*)image
                   success:(void (^)(NSDictionary *)) success
                   failure:(void (^)( NSError*))failure;

@end
