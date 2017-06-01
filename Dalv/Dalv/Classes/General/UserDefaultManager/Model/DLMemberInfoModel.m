//
//  DLMemberInfoModel.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/1.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMemberInfoModel.h"

@implementation DLMemberInfoModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key  {
    
}

#pragma mark - NSCoding Methods -
//通过编码对象aCoder对Person类中的各个属性对应的实例对象或变量做编码操作。将类的成员变量通过一个键值编码
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
//  [aCoder encodeObject:self.u_login_id forKey:@"u_login_id"];
    [aCoder encodeObject:self.u_mobile forKey:@"u_mobile"];
    [aCoder encodeObject:self.userPassword forKey:@"userPassword"];
}

//解码操作。将键值读出
- (id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        //        self.u_login_id = [aDecoder decodeObjectForKey:@"u_login_id"];
        self.u_mobile = [aDecoder decodeObjectForKey:@"u_mobile"];
        self.userPassword = [aDecoder decodeObjectForKey:@"userPassword"];
    }
    
    return self;
}

@end
