//
//  NSObject+JSON.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/1.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "NSObject+JSON.h"

@implementation NSObject (JSON)

- (NSString *)JSONString{
    NSString *result = nil;
    if (self != nil) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
        if (data == nil) {
            return nil;
        }
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return result;
}

@end
