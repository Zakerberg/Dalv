//
//  DLUtils.h
//  Dalv
//
//  Created by Nie on 2017/5/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLUtils : NSObject

// 获取app版本
+ (NSString *)getAPPVersion;

// 获取app build版本
+ (NSString *)getAPPBuild;

// 获取接口version头数据
+ (NSString *)getVersionHeader;

// 获取设备IMEI
+ (NSString *)getDeviceIMEI;

// 获取设备信息
+ (NSString *)getDeviceVersionInfo;

// 获取设备型号
+ (NSString *)getDeviceModel;

// 获取uid
+ (NSString *)getUid;

// 获取token
+ (NSString *)getSign_token;
@end
