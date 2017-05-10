//
//  UIColor+MSExtension.m
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import "UIColor+MSExtension.h"

@implementation UIColor (MSExtension)

#pragma mark - Color with hex

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    return [UIColor colorWithHexString:hexString colorAlpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString colorAlpha:(float)alpha {
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor clearColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range = NSMakeRange(0, 2);
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

#pragma mark - MIS theme

+ (UIColor *)ms_orangeColor {
    return [self colorWithHexString:@"#fd8216"];//ff8820
}

+ (UIColor *)ms_blackColor {
    return [self colorWithHexString:@"#2c2c2c"];
}

+ (UIColor *)ms_grayColor {
    return [self colorWithHexString:@"#8a898e"];
}

+ (UIColor *)ms_backgroundColor {
    return [self colorWithHexString:@"#efeff4"];//ebebeb
}

+ (UIColor *)ms_separatorColor {
    return [self colorWithHexString:@"#dcdcdc"];
}

+ (UIColor *)darkerColorForColor:(UIColor *)color {
    CGFloat r, g, b, a;
    if ([color getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - 0.1f, 0.0f)
                               green:MAX(g - 0.1f, 0.0f)
                                blue:MAX(b - 0.1f, 0.0f)
                               alpha:a];
    return nil;
}

#pragma mark - Debugging color

+ (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
