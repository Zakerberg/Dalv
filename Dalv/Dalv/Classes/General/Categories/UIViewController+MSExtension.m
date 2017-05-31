//
//  UIViewController+MSExtension.m
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//
#import "UIViewController+MSExtension.h"

@implementation UIViewController (MSExtension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method systemMethod = class_getInstanceMethod([self class], @selector(presentViewController:animated:completion:));
        Method swizzMethod = class_getInstanceMethod([self class], @selector(ms_presentViewController:animated:completion:));
        
        Method vwa = class_getInstanceMethod([self class], @selector(viewWillAppear:));
        Method ms_vwa = class_getInstanceMethod([self class], @selector(ms_viewWillAppear:));
        
        method_exchangeImplementations(systemMethod, swizzMethod);
        method_exchangeImplementations(vwa, ms_vwa);
        method_exchangeImplementations(class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc")),
                                       class_getInstanceMethod([self class], @selector(ms_dealloc)));
    });
}

#pragma mark - Public Methods

- (void)setupNavBarBlackTheme {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self setupNavBarBackgroundColor:[UIColor colorWithHexString:@"476dee"]
                          titleColor:[UIColor whiteColor]];
    [self setupNavbarSeparatorColor:nil];
}

- (void)setupNavBarDefaultTheme {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self setupNavBarBackgroundColor:[UIColor whiteColor]
                          titleColor:[UIColor ms_blackColor]];
    [self setupNavbarSeparatorColor:nil];
}

- (void)setupNavBarBackgroundColor:(UIColor *)color titleColor:(UIColor *)titleColor {
    UINavigationBar *appearance = self.navigationController.navigationBar;
    appearance.shadowImage = [[UIImage alloc] init];
    appearance.tintColor = [UIColor whiteColor];
    appearance.translucent = NO;
    [appearance setBackgroundImage:[UIImage imageWithColor:color]
                    forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName: titleColor,
                                         NSFontAttributeName: [UIFont systemFontOfSize:18]}];
    
    UIBarButtonItem *barAppearance = [UIBarButtonItem appearance];
    [barAppearance setTitleTextAttributes:@{NSForegroundColorAttributeName: titleColor,
                                            NSFontAttributeName: [UIFont systemFontOfSize:16]}
                                 forState:UIControlStateNormal];
    
    [barAppearance setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor ms_orangeColor],
                                            NSFontAttributeName: [UIFont systemFontOfSize:16]}
                                 forState:UIControlStateHighlighted];
}

- (void)setupNavbarSeparatorColor:(UIColor *)color {
    color = color ?: [UIColor ms_separatorColor];
    UINavigationBar *appearance = self.navigationController.navigationBar;
    [appearance setShadowImage:[UIImage imageWithColor:color
                                                  size:CGSizeMake(0.6f, 0.6f)]];
}

- (void)setupLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem {
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:nil
                                                                               action:NULL];
    spaceItem.width = -15;
    self.navigationItem.leftBarButtonItems = @[spaceItem, leftBarButtonItem];
}

- (void)setupRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem {
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:nil
                                                                               action:NULL];
    spaceItem.width = -15;
    self.navigationItem.rightBarButtonItems = @[spaceItem, rightBarButtonItem];
}

#pragma mark - Replace Methods

- (void)ms_viewWillAppear:(BOOL)animated {
    [self ms_viewWillAppear:animated];
    
    if (self.dl_blueNavbar) {
        [self setupNavBarBlackTheme];
    } else {
        [self setupNavBarDefaultTheme];
    }
}

- (void)ms_presentViewController:(UIViewController *)viewControllerToPresent
                        animated:(BOOL)animated completion:(void (^)(void))completion {
    [self setupCancel:viewControllerToPresent];
    [self ms_presentViewController:viewControllerToPresent animated:animated completion:completion];
}

//- (void)ms_dealloc {
//    NSLog(@"=========== %@ 释放了。===========", self);
//    [self ms_dealloc];
//}

- (void)setupCancel:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *vc = viewController.childViewControllers.firstObject;
        UIBarButtonItem *backItem = [UIBarButtonItem itemWithTitle:@"取消"
                                                            target:vc
                                                            action:@selector(didTapCancelAction:)];
        if (vc.dl_blueNavbar) {
            UIButton *button = backItem.customView;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        vc.navigationItem.leftBarButtonItem = backItem;
    }
}

#pragma mark - Event Handler

- (void)didTapCancelAction:(UIBarButtonItem *)sender {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - Setter/Getter

- (void)setDl_blueNavbar:(BOOL)dl_blueNavbar {
    objc_setAssociatedObject(self, @selector(dl_blueNavbar), @(dl_blueNavbar), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)dl_blueNavbar {
    return objc_getAssociatedObject(self, _cmd);
}



+ (UIWindow *)frontWindow {
#if !defined(SV_APP_EXTENSIONS)
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelSupported = (window.windowLevel >= UIWindowLevelNormal && window.windowLevel <= UIWindowLevelNormal);
        
        if(windowOnMainScreen && windowIsVisible && windowLevelSupported) {
            return window;
        }
    }
#endif
    return nil;
}

+ (UIViewController *)currentViewController {
    UIViewController *viewController = self.frontWindow.rootViewController;
    return [self findViewController:viewController];
}

+ (UIViewController *)findViewController:(UIViewController *)viewController {
    if (viewController.presentedViewController) {
        return [self findViewController:viewController.presentedViewController];
    } else if ([viewController isKindOfClass:[UISplitViewController class]]) {
        UISplitViewController *vc = (UISplitViewController *)viewController;
        if (vc.viewControllers.count > 0) {
            return [self findViewController:vc.viewControllers.lastObject];
        } else {
            return viewController;
        }
    } else if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *vc = (UINavigationController *)viewController;
        if (vc.viewControllers.count > 0) {
            return [self findViewController:vc.topViewController];
        } else {
            return viewController;
        }
    } else if ([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *vc = (UITabBarController *)viewController;
        if (vc.viewControllers.count > 0) {
            return [self findViewController:vc.selectedViewController];
        } else {
            return viewController;
        }
    } else {
        return viewController;
    }
}

@end
