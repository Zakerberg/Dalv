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

@implementation TouristInfo

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ordinaryId" : @"id",};
}
@end

@implementation DLHomeMenuItem

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"lineDestinationId" : @"id",};
}

@end
