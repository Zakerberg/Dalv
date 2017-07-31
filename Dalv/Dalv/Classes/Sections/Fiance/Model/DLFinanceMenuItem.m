//
//  DLHomeMenuItem.m
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFinanceMenuItem.h"

@implementation DLFinanceMenuItem

+ (instancetype)itemWithImage:(UIImage *)image name:(NSString *)name {
    return [self itemWithImage:image name:name clazz:nil];
}

+ (instancetype)itemWithImage:(UIImage *)image name:(NSString *)name selector:(SEL)selector {
    DLFinanceMenuItem *item = [[DLFinanceMenuItem alloc] init];
    item.image = image;
    item.name = name;
    item.selector = selector;
    return item;
}

+ (instancetype)itemWithImage:(UIImage *)image name:(NSString *)name clazz:(Class)clazz {
    DLFinanceMenuItem *item = [[DLFinanceMenuItem alloc] init];
    item.image = image;
    item.name = name;
    item.clazz = clazz;
    return item;
}

@end
