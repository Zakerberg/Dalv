//
//  DLUserDefaultsManager.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/1.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLMemberInfoModel.h"

@interface DLUserDefaultsManager : NSObject

@property (nonatomic,strong)DLMemberInfoModel *memberInfoModel;

+ (void)setBooleanValueWithKey:(BOOL)value key:(NSString *)key;
+ (BOOL)getBooleanValueWithKey:(NSString *)key;

+ (void)setStringValueWithKey:(NSString *)value key:(NSString *)key;
+ (NSString *)getStringValueWithKey:(NSString *)key;

+ (void)setUserInfo:(NSDictionary *)userInfo;


+ (DLUserDefaultsManager *)shareInstance;


/**
 返回值为空时，可以看做未登录
 */
+ (NSDictionary *)getUserInfo;

 
+ (void)setDataWithKey:(NSData *)data key:(NSString *)key;
+ (NSData *)getDataWithKey:(NSString *)key;



//判断现在是否是登录状态
- (BOOL)isLoggedInStatus;
//读取本地的个人信息
- (BOOL)readMemberInfoModelFromLocation ;
//退出登录
- (void)logOffAction;


/*
 
 #pragma mark - 登录注册 -
 //密码登录
 - (void)loginActionWithUserID:(NSString *)userID withPassword:(NSString *)password withLoginSuccessResult:(SuccessResult )loginSuccessResult withLoginFailResult:(FailResult)loginFailResult;
 //注册代理商
 - (void)httpRegisterDelegateWithTrueName:(NSString *)trueName withPhone:(NSString *)phone withAreaId:(NSString *)areaId withRegisterSuccessResult:(SuccessResult)registerSuccessResult withRegisterFailResult:(FailResult)registerFailResult;
 
 */


@end
