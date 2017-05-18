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
 *  获取首页数据接口
 *
 *  @param param             请求参数
 *  @param completionHandler 请求完成的回调
 */
+ (void)getHomeVCData:(NSDictionary *)param
           completion:(void (^)(id result, NSError *error))completionHandler;

@end
