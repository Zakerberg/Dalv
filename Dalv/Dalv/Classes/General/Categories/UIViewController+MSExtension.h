//
//  UIViewController+MSExtension.h
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MSExtension)

/**
 *  设置导航栏默认主题
 */
- (void)setupNavBarDefaultTheme;

/**
 *  设置导航栏背景色和导航栏标题颜色
 *
 *  @param color      导航背景色
 *  @param titleColor 标题颜色
 */
- (void)setupNavBarBackgroundColor:(UIColor *)color titleColor:(UIColor *)titleColor;

/**
 *  设置导航栏左侧按钮、默认向左便宜15px
 *
 *  @param leftBarButtonItem 左侧按钮
 */
- (void)setupLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem;

/**
 *  设置导航栏右侧按钮、默认向右便宜15px
 *
 *  @param rightBarButtonItem 右侧按钮
 */
- (void)setupRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;

@end
