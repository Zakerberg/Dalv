//
//  DLLineModificationModel.m
//  Dalv
//
//  Created by Nie on 2017/6/21.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineModificationModel.h"

@implementation DLLineModificationModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list" : [LineModificationList class]};
}
@end

@implementation LineModificationList

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"tourDateId" : @"id",};
}
@end


@implementation TourList

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"lineTourId" : @"id",};
}

@end
