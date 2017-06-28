//
//  AppDelegate.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "AppDelegate.h"
#import "DLTabBarController.h"
#import "DLLoginViewController.h"
#import "DLIdentitySelectionLoginViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "DLUtils.h"
#import "DLAdvertisingController.h"

#if DEBUG
#import "FLEX.h"
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
     if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
         
     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
     NSLog(@"首次启动");
     DLAdvertisingController *gVC = [[DLAdvertisingController alloc] init];
     self.window.rootViewController = gVC;
    
     }else {
    
    [self setupMainVC];
    
    [self registerNotification];
         
    
#if DEBUG
    [[FLEXManager sharedManager] showExplorer];
#endif
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - setUp IQKeyboardManager
- (void)setUpKeyboardManager {

    /*
     IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
     manager.enable = YES;//控制整个功能是否启用。
     manager.shouldResignOnTouchOutside = YES;//控制点击背景是否收起键盘
     manager.shouldToolbarUsesTextFieldTintColor = YES;//控制键盘上的工具条文字颜色是否用户自定义
     manager.enableAutoToolbar = NO;//控制是否显示键盘上的工具条。
     */
    
    [IQKeyboardManager sharedManager].enable = YES;

}

#pragma mark - initialize

- (void)registerNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setupLoginVC)
                                                 name:kUserlogoutNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setupTabbarVC)
                                                 name:kUserlogInNotification
                                               object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupTabbarVC) name: KCustomerloginNoti object:nil];
    
}

- (void)setupMainVC {
    if ([NSString isNotBlank:[DLUtils getUid]]) {
        [self setupTabbarVC];
    } else {
        [self setupLoginVC];
    }
}
// 已登录 跳到主界面
- (void)setupTabbarVC {
    DLTabBarController *tabBarController = [[DLTabBarController alloc] init];
    self.window.rootViewController = tabBarController;
}
// 未登录跳到登录界面
- (void)setupLoginVC {
    DLIdentitySelectionLoginViewController *loginVC = [[DLIdentitySelectionLoginViewController alloc] init];
    DLNavigationController *nav = [[DLNavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = nav;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
