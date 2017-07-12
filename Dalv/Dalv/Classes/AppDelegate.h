//
//  AppDelegate.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import "WXApi.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate,UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
