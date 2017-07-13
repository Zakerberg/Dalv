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

#define UM_APPKEY  @"59632ee6c62dca4fda0000fa"
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
    
     }else {
    
    [self setupMainVC];
    
    [self registerNotification];
         
    
#if DEBUG
//    [[FLEXManager sharedManager] showExplorer];
#endif
    }
    [self.window makeKeyAndVisible];
    
    /* 打开调试日志 */
  //  [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    //[[UMSocialManager defaultManager] setUmSocialAppkey:UM_APPKEY];
    
    [self configUSharePlatforms];
    [self confitUShareSettings];
    
    [WXApi registerApp:WECHAT_APPKEY];
    
    //iOS10必须加下面这段代码。
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    UNAuthorizationOptions types10 = UNAuthorizationOptionBadge|  UNAuthorizationOptionAlert|UNAuthorizationOptionSound;
    [center requestAuthorizationWithOptions:types10 completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            //允许
        } else {
            //不允许
        }
    }];

    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    NSLog(@"跳转到URL scheme中配置的地址-->%@",url);
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark - WXApiDelegate

- (void)onReq:(BaseReq*)req {
    

    
}

//支付成功时调用，回到第三方应用中
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //    NSLog(@"****************url.host -- %@",url.host);
    if ([url.scheme isEqualToString:@"1e42b20d9ba2b6fed4a9a21eba75f6ff"])
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
    } else if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
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
        NSLog(@"title = %@ message = %@", strTitle, strMsg);
        
        
    }
 
}

#pragma mark - wechatshare delegate

- (void) changeScene:(NSInteger)scene{
    
}

- (void) sendTextContent {
    
}


- (void) sendTextContent:(NSInteger) scene message:(NSString*)msg {

    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    //    req.text = msg;
    req.bText = NO;//不使用文本信息
    req.scene = scene;
    //    [WXApi sendReq:req];
    //创建分享内容对象
    WXMediaMessage *urlMessage = [WXMediaMessage message];
    urlMessage.title = @"一个人+一部手机 = 一个旅行社!快跟我一起来!";//分享标题
    urlMessage.description = @"";//分享描述
    [urlMessage setThumbImage:[UIImage imageNamed:@""]];//分享图片,使用SDK的setThumbImage方法可压缩图片大小

    //创建多媒体对象
    WXWebpageObject *webObj = [WXWebpageObject object];
    webObj.webpageUrl = @"http://www.dalvu.com/App/appDown.html";

    //完成发送对象实例
    urlMessage.mediaObject = webObj;
    req.message = urlMessage;

    //发送分享信息
    [WXApi sendReq:req];
}

- (void) sendImageContent {
    
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res5thumb.png"]];

    WXImageObject *ext = [WXImageObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res5thumb" ofType:@"png"];
    NSLog(@"filepath :%@",filePath);
    ext.imageData = [NSData dataWithContentsOfFile:filePath];

    //UIImage* image = [UIImage imageWithContentsOfFile:filePath];
    UIImage* image = [UIImage imageWithData:ext.imageData];
    ext.imageData = UIImagePNGRepresentation(image);

    message.mediaObject = ext;

    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;

    [WXApi sendReq:req];

}

-(void)sendImageContent:(NSInteger)scene photo:(UIImage *)image {
    
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res5thumb.png"]];

    WXImageObject *ext = [WXImageObject object];

    ext.imageData = UIImagePNGRepresentation(image);

    message.mediaObject = ext;

    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;

    [WXApi sendReq:req];

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

    /*
     IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
     manager.enable = YES;//控制整个功能是否启用。
     manager.shouldResignOnTouchOutside = YES;//控制点击背景是否收起键盘
     manager.shouldToolbarUsesTextFieldTintColor = YES;//控制键盘上的工具条文字颜色是否用户自定义
     manager.enableAutoToolbar = NO;//控制是否显示键盘上的工具条。
     */
    
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



- (void)confitUShareSettings
{
    // 打开图片水印
   // [UMSocialGlobal shareInstance].isUsingWaterMark = YES;
}

- (void)configUSharePlatforms
{
    /*
     设置微信的appKey和appSecret
     */
    //[[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WECHAT_APPKEY appSecret:WECHAT_APPSECRET redirectURL:nil];
    /*
     
     * 移除相应平台的分享，如微信收藏
     
     [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
     */
    
    /*
     设置新浪的appKey和appSecret
     */
   // [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:SINA_APPKEY  appSecret:SINA_APPSECRET redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}

// 支持所有iOS系统
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
   // BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    //if (!result) {
        // 其他如支付等SDK的回调
   // }
///return result;
//}

//- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
//{
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//    
//    //创建网页内容对象
//    NSString* thumbURL =  @"";
//    
//    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"" descr:@"" thumImage:thumbURL];
//    //设置网页地址
//    shareObject.webpageUrl = @"http://mobile.umeng.com/social";
//    
//    //分享消息对象设置分享内容对象
//    messageObject.shareObject = shareObject;
//    
//    //调用分享接口
//    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
//        if (error) {
//            UMSocialLogInfo(@"************Share fail with error %@*********",error);
//        }else{
//            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
//                UMSocialShareResponse *resp = data;
//                //分享结果消息
//                UMSocialLogInfo(@"response message is %@",resp.message);
//                //第三方原始返回的数据
//                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
//                
//            }else{
//                UMSocialLogInfo(@"response data is %@",data);
//            }
//        }
//        //[self alertWithError:error];
//    }];
//}



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

#pragma mark - Core Data stack 后期处理







@end
