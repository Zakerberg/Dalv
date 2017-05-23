//
//  DLFuncList.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFuncList.h"

@implementation DLFuncList

+ (instancetype)functionListWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}


@end
