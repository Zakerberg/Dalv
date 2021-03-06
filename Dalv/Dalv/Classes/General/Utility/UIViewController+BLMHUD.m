//
//  UIViewController+BLMHUD.m
//  DaLvApp
//
//  Created by Michael 柏 on 2017/5/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "UIViewController+BLMHUD.h"
#import <objc/runtime.h>

static const void *HUDKey = &HUDKey;

@implementation UIViewController (BLMHUD)

#pragma mark - 动态绑定HUD属性
- (MBProgressHUD *)HUD {
    return objc_getAssociatedObject(self, HUDKey);
}

- (void)setHUD:(MBProgressHUD * _Nullable)HUD {
    objc_setAssociatedObject(self, HUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - 方法实现

- (void)showHudInView:(UIView *)view hint:(NSString *)hint {
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.label.text = hint;
    [view addSubview:HUD];
    [HUD showAnimated:YES];
    [self setHUD:HUD];
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint yOffset:(float)yOffset {
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.label.text = hint;
    HUD.margin = 10.f;
    HUD.yOffset += yOffset;
    [view addSubview:HUD];
    [HUD showAnimated:YES];
    [self setHUD:HUD];
}

- (void)showHint:(NSString *)hint {
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hideAnimated:YES afterDelay:2];
}

- (void)showHint:(NSString *)hint inView:(UIView *)view {
    //显示提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [view addSubview:hud];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:2];
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset {
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
    hud.margin = 10.f;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2];
}

- (void)hideHud {
    [[self HUD] hideAnimated:YES];
}


@end
