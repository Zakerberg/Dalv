//
//  DLLineTourDetailInforModel.m
//  Dalv
//
//  Created by Nie on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineTourDetailInforModel.h"

@implementation DLLineTourDetailInforModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"tourSkuDate" : [DLLineTourSkuDate class]};
}

@end


@implementation DLLineTourSkuDate

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"tourSkuDateId" : @"id",};
}

@end

@implementation DLLineTourDetail

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"lineTourId" : @"id",};
}

@end
