//
//  DLLineOrderDetailModel.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderDetailModel.h"

@implementation DLLineOrderDetailModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"lineId" : @"id",};
}
@end
