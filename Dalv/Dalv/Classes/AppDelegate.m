//
//  AppDelegate.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "AppDelegate.h"
#import "DLTabBarController.h"
#import <SMS_SDK/SMSSDK.h>
#import <IQKeyboardManager/IQKeyboardManager.h>

//#define MobAppKey @"1db8868702eb6"
//#define MobApp_Secret @"69d530b2044f3f48bdd339fe7e7e0677"

#if DEBUG
#import "FLEX.h"
#endif


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
//    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
//        NSLog(@"首次启动");
//        GuideViewController *gVC = [[GuideViewController alloc] init];
//        self.window.rootViewController = gVC;
//    }else {
//        NSLog(@"非首次启动");
//        //创建标签控制器
//        AdvertisingViewController * adVC = [[AdvertisingViewController alloc]init];
    
        //给窗口指定根控制器
    self.window.rootViewController = [[DLTabBarController alloc] init];
    
//    }
    [self.window makeKeyAndVisible];

    
//    [SMSSDK registerApp:MobAppKey withSecret:MobApp_Secret];

    #if DEBUG
        [[FLEXManager sharedManager] showExplorer];
    #endif

    return YES;
}


#pragma mark - setUp IQKeyboardManager
- (void)setUpKeyboardManager {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = NO;//控制整个功能是否启用。
    manager.shouldResignOnTouchOutside = YES;//控制点击背景是否收起键盘
    manager.shouldToolbarUsesTextFieldTintColor = YES;//控制键盘上的工具条文字颜色是否用户自定义
    manager.enableAutoToolbar = NO;//控制是否显示键盘上的工具条。
    
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
