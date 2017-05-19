//
//  DLHomeViewTask.h
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLHomeViewTask : NSObject

/**
 *  测试默认首页模块地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getHomeIndexMod:(NSDictionary *)param
           completion:(void (^)(id result, NSError *error))completionHandler;

/**
 *  测试默认首页线路列表地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getHomeIndexLineList:(NSDictionary *)param
             completion:(void (^)(id result, NSError *error))completionHandler;

/**
 *  测试默认详情页地址
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getLineDetial:(NSDictionary *)param
                  completion:(void (^)(id result, NSError *error))completionHandler;

@end
