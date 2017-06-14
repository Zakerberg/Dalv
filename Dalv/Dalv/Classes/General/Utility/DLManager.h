//
//  DLManager.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/25.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const DLUserDefaultsManagerUserLoggedIn;

@interface DLManager: NSObject

+ (instancetype)shareUserDefaultsManager;


/**
 判断用户是否登录
 
 @return YES / NO
 */
- (BOOL)isUserLoggedIn;

/**
 设置用户为登录状态
 */
- (void)setUserLoggedIn;

/**
 设置用户为退出状态
 */
- (void)setUserLoggedOut;

//获取用户信息对象
//-(BCUserInfoModel *)getUserInfoModel;

//更新用户信息
//-(void)updateUserInfo;

@end
