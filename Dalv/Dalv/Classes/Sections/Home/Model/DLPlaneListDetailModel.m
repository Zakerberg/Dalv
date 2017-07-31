//
//  DLPlaneListDetailModel.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ---------- 机票查询列表和机票详情界面的模型 ------------

#import "DLPlaneListDetailModel.h"

@implementation DLPlaneListDetailModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"planeId" : @"id",};
}
@end
