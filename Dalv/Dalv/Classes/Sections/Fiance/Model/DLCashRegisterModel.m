//
//  DLCashRegisterModel.m
//  Dalv
//
//  Created by Nie on 2017/6/2.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCashRegisterModel.h"

@implementation DLCashRegisterModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"withdrawalsId" : @"id",};
}
@end
