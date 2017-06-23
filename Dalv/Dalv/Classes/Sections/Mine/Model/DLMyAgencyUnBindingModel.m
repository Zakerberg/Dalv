//
//  DLMyAgencyUnBindingModel.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMyAgencyUnBindingModel.h"

@implementation DLMyAgencyUnBindingModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"myAgencyId" : @"id",};
}
@end
