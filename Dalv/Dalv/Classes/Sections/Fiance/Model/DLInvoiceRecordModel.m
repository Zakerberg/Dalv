//
//  DLInvoiceRecordModel.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//    ------------     发票申请记录   ------------

#import "DLInvoiceRecordModel.h"

@implementation DLInvoiceRecordModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"invoiceid" : @"id",};
}
@end
