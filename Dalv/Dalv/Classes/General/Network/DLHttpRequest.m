//
//  DLHttpRequest.m
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHttpRequest.h"
#import "DLFileManager.h"

typedef NS_ENUM(NSUInteger, HttpRequestType) {
    HttpRequestTypeGET = 0,
    HttpRequestTypePOST
};

// 请求超时间隔
static CGFloat const kTimeoutInterval = 30.0f;

@interface DLHttpRequest ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation DLHttpRequest

- (instancetype)init {
    
    if (self = [super init]) {
        // 1.创建SessionManager
        self.sessionManager = [AFHTTPSessionManager manager];
        self.sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        self.sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.sessionManager.requestSerializer.timeoutInterval = kTimeoutInterval;
        
        self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        
        //        [self.sessionManager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
        //        [self.sessionManager.requestSerializer setValue:@"application/json;charset=utf-8"forHTTPHeaderField:@"Content-Type"];
    }
    return self;
}

static DLHttpRequest *instance = nil;
+ (instancetype)sharedInstance {
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [self new];
    });
    
    return instance;
}

+ (void)removeAllCaches {
    
    [DLFileManager clearAllCacheFile];
}

+ (void)cancelAllOperations {
    
    [[DLHttpRequest sharedInstance].sessionManager.operationQueue cancelAllOperations];
}

+ (void)setHeader:(void (^)(AFHTTPRequestSerializer *))handler {
    AFHTTPRequestSerializer *requestSerializer = [DLHttpRequest sharedInstance].sessionManager.requestSerializer;
    handler ? handler(requestSerializer) : nil;
}

+ (void)GET:(NSString *)url
     params:(NSDictionary *)params
    success:(HttpRequestSuccessBlock)successHandler
    failure:(HttpRequestFailureBlock)failureHandler {
    
    [DLHttpRequest requestMethod:HttpRequestTypeGET
                     cachePolicy:HttpRequestDefault
                             url:url
                          params:params
                         success:successHandler
                         failure:failureHandler];
    
}

+ (void)POST:(NSString *)url
      params:(NSDictionary *)params
     success:(HttpRequestSuccessBlock)successHandler
     failure:(HttpRequestFailureBlock)failureHandler {
    
    [DLHttpRequest requestMethod:HttpRequestTypePOST
                     cachePolicy:HttpRequestDefault
                             url:url
                          params:params
                         success:successHandler
                         failure:failureHandler];
    
}

+ (void)GET:(NSString *)url
     params:(NSDictionary *)params
cachePolicy:(HttpRequestCachePolicy)cachePolicy
    success:(HttpRequestSuccessBlock)successHandler
    failure:(HttpRequestFailureBlock)failureHandler {
    
    [DLHttpRequest requestMethod:HttpRequestTypeGET
                     cachePolicy:cachePolicy
                             url:url
                          params:params
                         success:successHandler
                         failure:failureHandler];
    
}

+ (void)POST:(NSString *)url
      params:(NSDictionary *)params
 cachePolicy:(HttpRequestCachePolicy)cachePolicy
     success:(HttpRequestSuccessBlock)successHandler
     failure:(HttpRequestFailureBlock)failureHandler {
    
    [DLHttpRequest requestMethod:HttpRequestTypePOST
                     cachePolicy:cachePolicy
                             url:url
                          params:params
                         success:successHandler
                         failure:failureHandler];
    
}

+ (void)POSTWithFormData:(NSString *)url
                  params:(NSDictionary *)params
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
             cachePolicy:(HttpRequestCachePolicy)cachePolicy
                 success:(HttpRequestSuccessBlock)successHandler
                 failure:(HttpRequestFailureBlock)failureHandler {
    
    [[DLHttpRequest sharedInstance].sessionManager POST:url parameters:params constructingBodyWithBlock:block success:^(NSURLSessionDataTask *task, id responseObject) {
        if (successHandler) {
            if (cachePolicy != HttpRequestDefault && responseObject) { // 缓存数据
                [DLFileManager wirteToFileWithFileName:[url MD5] content:responseObject];
            }
            successHandler ? successHandler(responseObject) : nil;
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failureHandler ? failureHandler(error) : nil;
    }];
}


+ (void)requestMethod:(HttpRequestType)requestType
          cachePolicy:(HttpRequestCachePolicy)cachePolicy
                  url:(NSString *)url
               params:(NSDictionary *)params
              success:(HttpRequestSuccessBlock)successHandler
              failure:(HttpRequestFailureBlock)failureHandler {
    
    if ([DLHttpRequest sharedInstance].timeoutInterval > 0) {
        [DLHttpRequest sharedInstance].sessionManager.requestSerializer.timeoutInterval = [DLHttpRequest sharedInstance].timeoutInterval;
    }
    
    // HttpRequestDefault、HttpRequestReloadIgnoringCache 这两种策略始终都发送请求
    // *********** 其他三种策略，读取本地缓存 ***********
    if (cachePolicy == HttpRequestReturnCacheDataThenLoad ||
        cachePolicy == HttpRequestReturnCacheDataElseLoad ||
        cachePolicy == HttpRequestReturnCacheDataDontLoad) {
        
        NSString *dataStr = [DLFileManager readFileWithFileName:[url MD5]];
        id dataObj = [dataStr mj_JSONData];
        switch (cachePolicy) {
            case HttpRequestReturnCacheDataThenLoad: { // 先返回缓存，同时请求
                successHandler ? successHandler(dataObj) : nil;
                break;
            }
            case HttpRequestReturnCacheDataElseLoad: { // 有缓存就返回缓存，没有就请求
                successHandler ? successHandler(dataObj) : nil;
                return ;
            }
            case HttpRequestReturnCacheDataDontLoad: { // 有缓存就返回缓存,从不请求（用于没有网络）
                successHandler ? successHandler(dataObj) : nil;
                return ; // 退出从不请求
            }
            default: {
                break;
            }
        }
    }
    
    // *********** 发送请求 ***********
    switch (requestType) {
        case HttpRequestTypeGET: {   // GET请求
            [[DLHttpRequest sharedInstance].sessionManager GET:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (successHandler) {
                    if (cachePolicy != HttpRequestDefault && responseObject) { // 缓存数据
                        [DLFileManager wirteToFileWithFileName:[url MD5] content:responseObject];
                    }
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                failureHandler ? failureHandler(error) : nil;
            }];
            
            break;
        }
        case HttpRequestTypePOST: {  // POST请求
            
            [[DLHttpRequest sharedInstance].sessionManager POST:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (successHandler) {
                    if (cachePolicy != HttpRequestDefault && responseObject) { // 缓存数据
                        [DLFileManager wirteToFileWithFileName:[url MD5] content:responseObject];
                    }
                    successHandler ? successHandler(responseObject) : nil;
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failureHandler ? failureHandler(error) : nil;
            }];
            
            break;
        }
        default:
            break;
    }
    
}

- (void)handleRequestSuccessBlock:(HttpRequestSuccessBlock)block
                   responseObject:(id)responseObject {
    
}


+ (void)POSTWithData:(NSString *)URLString
              params:(NSDictionary *)parameters
                body:(NSData *)data
             success:(void (^)(NSDictionary *))success
             failure:(void (^)( NSError*))failure;

{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URLString]];
    [request setTimeoutInterval:kTimeoutInterval];
    [request setHTTPMethod:@"POST"];
    //    设置请求头
    //    [self setNetHeaderBy:request];
    [request setHTTPBody:data];
    // 2. 发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSString *jsonstr = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSDictionary * dic = [NSString jsonStringToDictionary:jsonstr];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (jsonstr.length > 0) {
                NSLog(@"请求成功%@  \n结束报文",dic);
                success(dic);
            } else {
                failure(connectionError);
            }});
    }];
}

+ (void)setNetHeaderBy:(NSMutableURLRequest*)mgr{
    //    //加请求头
    //    [mgr setValue:@"Post" forHTTPHeaderField:@"Method"];
    //    [mgr setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    //    [mgr setValue:@"/mis/pic/" forHTTPHeaderField:@"Pic-Path"];
    //    [mgr setValue:@"0" forHTTPHeaderField:@"Pic-Size"];
    //    [mgr setValue:@"base64" forHTTPHeaderField:@"Pic-Encoding"];
}


+ (void)UploadImageWithUrl:(NSString *)URLString
                    params:(NSDictionary *)parameters
               imageParams:(UIImage*)image
                   success:(void (^)(NSDictionary *)) success
                   failure:(void (^)( NSError*))failure{
    
    [[DLHttpRequest sharedInstance].sessionManager POST:URLString parameters: parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.3) name:@"file" fileName:@"name" mimeType:@"image/jpeg"];
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        //        NSString *jsonstr = [[NSMutableString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        //        NSDictionary * dic = [NSString jsonStringToDictionary:responseObject];
        NSLog(@"请求成功%@  \n结束报文",responseObject);
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}
@end
