//
//  DLHomePageMenuModel.m
//  Dalv
//
//  Created by Nie on 2017/6/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomePageMenuModel.h"

@implementation DLHomePageMenuModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"columnList" : [DLHomeMenuItem class]};
}
@end


@implementation AgencyInfo

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"agencyId" : @"id",};
}
@end


@implementation DLHomeMenuItem

@end
