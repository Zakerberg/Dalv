//
//  DLGenralModel.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLGenralModel.h"

@implementation DLGenralModel

+(instancetype)MineModelWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
