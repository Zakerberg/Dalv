//
//  UIBarButtonItem+MSExtension.h
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MSExtension)

/**
 *  创建一个纯文字的 UIBarButtonItem
 *
 *  @param title  标题
 *  @param target 事件代理对象
 *  @param action 事件处理
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title
                            target:(id)target
                            action:(SEL)action;

/**
 *  创建一个纯图片的 UIBarButtonItem
 *
 *  @param imageName  普通状态下的图片
 *  @param highImageName 高亮状态下的图片、可为空
 *  @param target 事件代理对象
 *  @param action 事件处理
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName
                         highImageName:(NSString *)highImageName
                                target:(id)target
                                action:(SEL)action;

/**
 *  创建一个纯文字的 UIBarButtonItem
 *
 *  @param title  标题
 *  @param imageName  普通状态下的图片
 *  @param highImageName 高亮状态下的图片、可为空
 *  @param target 事件代理对象
 *  @param action 事件处理
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title
                         imageName:(NSString *)imageName
                     highImageName:(NSString *)highImageName
                            target:(id)target
                            action:(SEL)action;

@end
