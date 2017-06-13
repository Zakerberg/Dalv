//
//  DLManager.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/25.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLManager.h"

NSString *const DLUserDefaultsManagerUserLoggedIn = @"userLoggedIn";

@implementation DLManager

+ (instancetype)shareUserDefaultsManager {
    static DLManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DLManager alloc] init];
    });
    return manager;
}


//是否登录
- (BOOL)isUserLoggedIn {
    return [self boolForKey:DLUserDefaultsManagerUserLoggedIn defaultValue:NO];
}


//登录状态
- (void)setUserLoggedIn {
    [self setBool:YES forKey:DLUserDefaultsManagerUserLoggedIn];
}


//退出登录
- (void)setUserLoggedOut {
    [self setBool:NO forKey:DLUserDefaultsManagerUserLoggedIn];
}


#pragma mark -  ------------- private ----------------


- (BOOL)boolForKey:(NSString *)aKey defaultValue:(BOOL)defaultValue {
    UserDefaults(userDefaults);
    if (![userDefaults objectForKey:aKey]) {
        return defaultValue;
    }
    return [[userDefaults objectForKey:aKey] boolValue];
}


- (void)setBool:(BOOL)value forKey:(NSString *)aKey {
    UserDefaults(userDefaults);
    [userDefaults setBool:value forKey:aKey];
    [userDefaults synchronize];
}


//-(void)updateUserInfo {
//    __weak __typeof__(self) weakSelf = self;
//    [[BCNetworkTools shared] getUserInfoWithToken:[[BCUserDefaultsManager shareUserDefaultsManager] getToken] Andauth_token:[[BCUserDefaultsManager shareUserDefaultsManager] getAuthToken] Success:^(id response) {
//        BCUserInfoModel *userInfo = [BCUserInfoModel userInfoModelWithDic:response[@"data"][@"user_info"]];
//        [weakSelf setJson:response[@"data"][@"user_info"]];
//        NSNumber *num = (NSNumber*)userInfo.pay_password;
//        if([num isEqualToNumber:@1]){
//            [[BCUserDefaultsManager shareUserDefaultsManager] setPayOn];
//        } else {
//            [[BCUserDefaultsManager shareUserDefaultsManager] setPayOut];
//        }
//        [[NSNotificationCenter defaultCenter] postNotificationName:Notification_updateUserInfo object:userInfo];
//    } failure:^(NSError *error) {
//        
//    }];
//}





@end
