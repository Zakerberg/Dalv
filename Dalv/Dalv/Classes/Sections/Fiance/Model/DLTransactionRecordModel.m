//
//  DLTransactionRecordModel.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLTransactionRecordModel.h"

@implementation DLTransactionRecordModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"payId" : @"id",};
}
@end
