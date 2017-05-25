//
//  DLManager.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/25.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^SuccessResult)(id successResult);
typedef void(^FailResult)(NSString *failResultStr);

@interface DLManager: NSObject

/*** 密码登录  ***/
- (void)loginActionWithUserID:(NSString *)userID withPassword:(NSString *)password withLoginSuccessResult:(SuccessResult )loginSuccessResult withLoginFailResult:(FailResult)loginFailResult;



//退出登录
- (void)logOutAction;
//获取手机验证码
- (void)httpMobileCodeWithMobileNumber:(NSString *)mobileNumber withCodeSuccessResult:(SuccessResult)codeSuccessResult withCodeFailResult:(FailResult)codeFailResult;
//检验手机验证码
- (void)httpCheckMobileCodeWithMobileNumber:(NSString *)mobileNumber withCode:(NSString *)code withCodeSuccessResult:(SuccessResult)codeSuccessResult withCodeFailResult:(FailResult)codeFailResult;
//注册功能
- (void)httpRegisterWithMobileNumber:(NSString *)mobileNumber withPassword:(NSString *)password withUserType:(NSString *)usertType withAreaId:(NSString *)areaId withRegisterSuccess:(SuccessResult )registerSuccessResult withRegisterFailResult:(FailResult)registerFailResult;

//注册顾问
- (void)httpRegisterDelegateWithTrueName:(NSString *)trueName withPhone:(NSString *)phone withAreaId:(NSString *)areaId withRegisterSuccessResult:(SuccessResult)registerSuccessResult withRegisterFailResult:(FailResult)registerFailResult;

////注册时检验是否注册了
//- (void)httpCheckIsUserRegisterWithMobile:(NSString *)mobile withIsRegisterSuccess:(SuccessResult )isRegisterSuccess withIsRegisterFail:(FailResult)isRegisterFail;
////登录时，检查是否注册了
//- (void)httpCheckIsUserRegisterForLoginWithMobile:(NSString *)mobile withIsRegisterSuccess:(SuccessResult )isRegisterSuccess withIsRegisterFail:(FailResult)isRegisterFail ;

@end
