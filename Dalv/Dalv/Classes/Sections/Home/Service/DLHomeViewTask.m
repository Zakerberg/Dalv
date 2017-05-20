//
//  DLHomeViewTask.m
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomeViewTask.h"

@implementation DLHomeViewTask

+ (void)getHomeIndexMod:(NSDictionary *)param
           completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_HomeIndexMod param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];

}

+ (void)getHomeIndexLineList:(NSDictionary *)param
             completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_HomeIndexLineList param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}

+ (void)getLineDetial:(NSDictionary *)param
                  completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_LineDetial param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
    
}


@end
