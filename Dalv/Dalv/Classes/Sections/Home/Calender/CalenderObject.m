//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import "CalenderObject.h"

@implementation CalenderRemindParam

@end

@implementation CalenderRemind

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"date" : @"key",
             @"monthScope" : @"value"};
}

@end

@implementation CalenderObject

@end
