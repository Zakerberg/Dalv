//
//  DLManagerMessage.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLManagerMessage.h"

@implementation DLManagerMessage
+ (instancetype)sharedMessage{
    static DLManagerMessage *_instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self new];
    });
    return _instance;
}
@end
