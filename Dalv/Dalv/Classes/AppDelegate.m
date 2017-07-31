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
#import <AlipaySDK/AlipaySDK.h>

#if DEBUG

#endif

#define SINA_APPKEY  @"467298458"
#define SINA_APPSECRET  @"e7a353024736af26107f67f45d628566"
#define WECHAT_APPKEY  @"wx9bc30a44b861048e"
#define WECHAT_APPSECRET  @"38dd8e643992c50d9c1f2b810cc36f02"

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
        
    } else {
        
        [self setupMainVC];
        
        [self registerNotification];
        
#if DEBUG
        
#endif
    }
    [self.window makeKeyAndVisible];
    
    BOOL isOk = [WXApi registerApp:WECHAT_APPKEY];
    if (isOk)
    {
        NSLog(@"注册微信成功");
    }
    else
    {
        NSLog(@"注册微信失败");
    }
    
    return YES;
}

#pragma mark - WXApiDelegate

- (void)onReq:(BaseReq*)req {
    
    
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    
    NSLog(@"跳转到URL scheme中配置的地址-->%@",url);
    if ([url.scheme isEqualToString:WECHAT_APPKEY]) {
        return [WXApi handleOpenURL:url delegate:self];
    }
    
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([url.scheme isEqualToString:WECHAT_APPSECRET])
    {
        return  [WXApi handleOpenURL:url delegate:(id<WXApiDelegate>)self];
    }
    
    return YES;
}

- (void)onResp:(BaseResp*)resp {
    if ([resp isKindOfClass:[PayResp class]]) {
        NSString *strMsg = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
        NSString *strTitle = @"支付结果";
        
        if([resp isKindOfClass:[PayResp class]]){
            
            switch (resp.errCode) {
                case WXSuccess:
                    strMsg = @"支付结果：成功！";
                    [[NSNotificationCenter defaultCenter] postNotificationName:kFianceNotification object:resp];
                    
                    break;
                case WXErrCodeUserCancel:
                    strMsg = @"支付结果：用户点击取消！";
                    
                    break;
                case WXErrCodeSentFail:
                    strMsg = @"支付结果：发送失败！";
                    
                    break;
                case WXErrCodeAuthDeny:
                    strMsg = @"支付结果：授权失败！";
                    
                    break;
                    
                default:
                    strMsg = @"支付结果：微信不支持！";
                    
                    break;
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }else if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
        NSString *strMsg = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
        NSString *strTitle;
        
        if(resp.errCode == 0){
            strTitle = [NSString stringWithFormat:@"分享成功！"];
            strMsg = @"";
        } else {
            strTitle = [NSString stringWithFormat:@"分享失败！"];
            strMsg = resp.errStr;
            
        }
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:strTitle message:strMsg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if([resp isKindOfClass:[SendAuthResp class]])
            {
                SendAuthResp *aresp = (SendAuthResp *)resp;
                if (aresp.errCode== 0){
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"BindWX" object:nil];
                }
            }
            
        }];
        [alert addAction:action];
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - wechatshare delegate

- (void) changeScene:(NSInteger)scene{
    
}

- (void) sendTextContent {
    
}
- (void) sendLinkContent {
    
}
- (void) sendMusicContent {
    
}
- (void) sendVideoContent {
    
}
- (void) sendAppContent {
    
}
- (void) sendNonGifContent {
    
}
- (void) sendGifContent {
    
}
- (void) sendFileContent {
    
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark - setUp IQKeyboardManager

- (void)setUpKeyboardManager {
    
    [IQKeyboardManager sharedManager].enable = YES;
    
}

#pragma mark - registerNotification

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
#pragma mark - setupMainVC

- (void)setupMainVC {
    if ([NSString isNotBlank:[DLUtils getUid]]) {
        [self setupTabbarVC];
    } else {
        [self setupLoginVC];
    }
}


- (void)setupTabbarVC {
    DLTabBarController *tabBarController = [[DLTabBarController alloc] init];
    self.window.rootViewController = tabBarController;
}

- (void)setupLoginVC {
    DLIdentitySelectionLoginViewController *loginVC = [[DLIdentitySelectionLoginViewController alloc] init];
    DLNavigationController *nav = [[DLNavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = nav;
}



- (void)confitUShareSettings
{
    
}

- (void)configUSharePlatforms
{
    
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
