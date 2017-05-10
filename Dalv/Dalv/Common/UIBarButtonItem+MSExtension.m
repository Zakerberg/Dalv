//
//  UIBarButtonItem+MSExtension.m
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//
#import "UIBarButtonItem+MSExtension.h"

@implementation UIBarButtonItem (MSExtension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName
                         highImageName:(NSString *)highImageName
                                target:(id)target
                                action:(SEL)action {
    return [self itemWithTitle:nil
                     imageName:imageName
                 highImageName:highImageName
                        target:target
                        action:action];
}


+ (UIBarButtonItem *)itemWithTitle:(NSString *)title
                            target:(id)target
                            action:(SEL)action {
    return [self itemWithTitle:title
                     imageName:nil
                 highImageName:nil
                        target:target
                        action:action];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title
                         imageName:(NSString *)imageName
                     highImageName:(NSString *)highImageName
                            target:(id)target
                            action:(SEL)action {
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [button setTitleColor:[UIColor ms_blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor ms_orangeColor] forState:UIControlStateHighlighted];
    [button sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
