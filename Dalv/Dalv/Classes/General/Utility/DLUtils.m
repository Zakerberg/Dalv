//
//  DLUtils.m
//  Dalv
//
//  Created by Nie on 2017/5/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLUtils.h"
#include <sys/utsname.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import "OpenUDID.h"

static NSString * const kMacAddressUserDefaultsKey = @"DLkeychainMacAddress";

@implementation DLUtils

// app版本
+ (NSString *)getAPPVersion {
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return appVersion;
}

// app build版本
+ (NSString *)getAPPBuild {
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appBuild = [infoDictionary objectForKey:@"CFBundleVersion"];
    return appBuild;
}

// 接口version头数据
+ (NSString *)getVersionHeader {
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *appBuild = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSString *versionHeader = [NSString stringWithFormat:@"%@(%@)", appVersion, appBuild];
    return versionHeader;
}

#pragma mark - IMEI

+ (NSString *)getDeviceIMEI {
    
    // 7以下是mac addr  7以上用的是openudid
    if (CurrentDeviceVersion >= 7.0) {
        
        NSString *udid = [OpenUDID value];
        if (!udid) {
            udid = @"";
        }
        return udid;
        
    } else {
        
        NSString *macaddress = [DLUtils getItemFromUserDefaults:kMacAddressUserDefaultsKey];
        if (!macaddress) {
            macaddress = [self wuba_macaddress];
            if (!macaddress) {
                macaddress = @"";
            }else{
                [self saveItemToUserDefaults:macaddress forKey:kMacAddressUserDefaultsKey];
            }
        }
        return macaddress;
    }
}

+ (NSString *)wuba_macaddress {
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

+ (void)saveItemToUserDefaults:(NSString *)value forKey:(NSString *)key {
    
    NSUserDefaults *store = [NSUserDefaults standardUserDefaults];
    [store setObject:value forKey:key];
    [store synchronize];
}

+ (NSString *)getItemFromUserDefaults:(NSString *)key {
    
    NSUserDefaults *store = [NSUserDefaults standardUserDefaults];
    return [store objectForKey:key];
}

#pragma mark - DeviceVersion

+ (NSString *)getDeviceVersionInfo {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithFormat:@"%s", systemInfo.machine];
    
    return platform;
}

// 获得设备型号

+ (NSString *)getDeviceModel {
    
    NSString *platform = [self getDeviceVersionInfo];
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPod5,1"])  return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod4,1"])  return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod3,1"])  return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod2,1"])  return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod1,1"])  return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPad1,1"])  return @"iPad 1G";
    if ([platform isEqualToString:@"iPad2,1"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad3,1"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"])     return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])   return @"iPhone Simulator";
    
    return platform;
}
// 获取uid
+ (NSString *)getUid{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"] ?  : @"";
    
}

// 获取token
+ (NSString *)getSign_token{
    
    return  [[NSUserDefaults standardUserDefaults] objectForKey:@"sign_token"] ? : @"";
    
}

// 获取type
+ (NSString *)getUser_type{
    
    return  [[NSUserDefaults standardUserDefaults] objectForKey:@"user_type"] ? : @"";
    
}
@end
