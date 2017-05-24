//
//  DLOptionModel.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLOptionModel.h"

@implementation DLOptionModel
+(instancetype)dLOptionModelWithDict:(NSDictionary *)dict{
    DLOptionModel *model = [[DLOptionModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
