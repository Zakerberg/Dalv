//
//  DLContractRecordModel.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractRecordModel.h"

@implementation DLContractRecordModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"recordId" : @"id",};
}
@end
