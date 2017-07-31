//
//  DLCustomerListModel.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/15.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCustomerListModel.h"

@implementation DLCustomerListModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"customerid" : @"id",};
}

@end
