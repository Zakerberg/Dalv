//
//  DLHomeMenuItem.h
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLFinanceMenuItem : NSObject

/**  首页菜单图标 */
@property (nonatomic, copy) UIImage *image;

/**  首页菜单名称 */
@property (nonatomic, copy) NSString *name;

/** 点击菜单跳转的控制器 */
@property (nonatomic, assign) Class clazz;

/** 点击菜单执行的方法 */
@property (nonatomic, assign) SEL selector;

/**
 *  创建一个菜单模型
 */
+ (instancetype)itemWithImage:(UIImage *)image name:(NSString *)name;
+ (instancetype)itemWithImage:(UIImage *)image name:(NSString *)name clazz:(Class)clazz;
+ (instancetype)itemWithImage:(UIImage *)image name:(NSString *)name selector:(SEL)selector;


@end
