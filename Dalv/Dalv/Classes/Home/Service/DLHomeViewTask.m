//
//  DLHomeViewTask.m
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomeViewTask.h"

@implementation DLHomeViewTask

+ (void)getHomeVCData:(NSDictionary *)param
           completion:(void (^)(id result, NSError *error))completionHandler {
    
    [DLRequestSerVice POST:DL_HomeRequest param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];

}
@end
