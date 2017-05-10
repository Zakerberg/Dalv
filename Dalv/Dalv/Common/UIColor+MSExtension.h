//
//  UIColor+MSExtension.h
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MSExtension)

#pragma mark - Color with hex

/**
 *  可以传入FFFFFF、#FFFFFF、0XFFFFFF类型的颜色值
 *
 *  @param hexString 色值
 *
 *  @return 透明度为1的对应UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 *  可以传入FFFFFF、#FFFFFF、0XFFFFFF类型的颜色值
 *
 *  @param hexString    色值
 *  @param alpha        0.0~1.0透明度数值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString colorAlpha:(float)alpha;

#pragma mark - MIS theme

/**
 * MIS 主色值 #fd8216
 */
+ (UIColor *)ms_orangeColor;

/**
 * MIS 主标题色值 #2c2c2c
 */
+ (UIColor *)ms_blackColor;

/**
 * MIS 子主标题色值 #8a898e
 */
+ (UIColor *)ms_grayColor;

/**
 * MIS 分割线色值 #ebebeb #efeff4
 */
+ (UIColor *)ms_backgroundColor;

/**
 * MIS 分割线色值 #dcdcdc
 */
+ (UIColor *)ms_separatorColor;

/**
 *  根据指定颜色创建 高亮颜色
 *
 *  @param color 指定颜色
 *
 *  @return 高亮颜色
 */
+ (UIColor *)darkerColorForColor:(UIColor *)color;

#pragma mark - Debugging color

/**
 * 生成随机色
 *
 * @return UIColor
 */
+ (UIColor *)randomColor;

@end
