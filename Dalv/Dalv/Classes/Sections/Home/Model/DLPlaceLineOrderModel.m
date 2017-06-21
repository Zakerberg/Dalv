//
//  DLPlaceLineOrderModel.m
//  Dalv
//
//  Created by Nie on 2017/6/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLPlaceLineOrderModel.h"

@implementation DLPlaceLineOrderModel

@end


@implementation DLPlaceOrderTourDate

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"tourDateId" : @"id",};
}
@end



@implementation PlaceOrderAgencyInfo

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"agencyId" : @"id",};
}
@end


@implementation LineList

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"lineTourId" : @"id",};
}

@end
