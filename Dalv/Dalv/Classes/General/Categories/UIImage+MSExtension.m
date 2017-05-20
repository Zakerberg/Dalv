//
//  UIImage+MSExtension.m
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//
#import "UIImage+MSExtension.h"

@implementation UIImage (MSExtension)

+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1.0f, 1.0f)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = (CGRect){{0, 0,}, size};
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil,
                                                 width,
                                                 height,
                                                 8,// bits per component
                                                 0,
                                                 colorSpace,
                                                 kCGBitmapByteOrderDefault);
    
    CGColorSpaceRelease(colorSpace);
    if(context == NULL) {
        return nil;
    }
    CGContextDrawImage(context, CGRectMake(0,0, width, height), self.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}

@end
