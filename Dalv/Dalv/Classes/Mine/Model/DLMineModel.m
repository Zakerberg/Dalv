//
//  DLMineModel.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMineModel.h"

@implementation DLMineModel

+(instancetype)MineModelWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}


@end
