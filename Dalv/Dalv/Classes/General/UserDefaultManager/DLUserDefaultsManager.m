//
//  DLUserDefaultsManager.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/1.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLUserDefaultsManager.h"
#import "NSString+JSON.h"
#import "NSObject+JSON.h"

@implementation DLUserDefaultsManager

+ (DLUserDefaultsManager *)shareInstance {
    static DLUserDefaultsManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DLUserDefaultsManager alloc] init];
    });
    return manager;
}


+ (void)setStringValueWithKey:(NSString *)value key:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:value forKey:key];
    [defaults synchronize];
}

+ (NSString *)getStringValueWithKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

+ (void)setBooleanValueWithKey:(BOOL)value key:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:value forKey:key];
    [defaults synchronize];
}

+ (BOOL)getBooleanValueWithKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
}

+ (void)setUserInfo:(NSDictionary *)userInfo {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[userInfo JSONString] forKey:@"userInfo"];
    [defaults synchronize];
}

+ (NSDictionary *)getUserInfo {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userInfoStr = [defaults stringForKey:@"userInfo"];
    NSDictionary *userInfo = [userInfoStr objectFromJSONString];
    if (userInfo != nil && [userInfo isKindOfClass:[NSDictionary class]]) {
        return userInfo;
    }
    return nil;
}

+ (void)setDataWithKey:(NSData *)data key:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:data forKey:key];
    [defaults synchronize];
}

+ (NSData *)getDataWithKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}



//是否已经登陆了
- (BOOL)isLoggedInStatus {
    if ([DLUserDefaultsManager shareInstance].memberInfoModel.u_id != nil && ![[DLUserDefaultsManager shareInstance].memberInfoModel.u_id isEqualToString:@""]) {
        return YES;
    }else {
        return NO;
    }

}

#pragma mark - 归档，将个人信息存入本地 -
    //归档 写入沙盒
- (BOOL)saveMemberInfoModelToLocationWithMemberInfo:(DLMemberInfoModel *)memberInfo {
        NSArray *_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *_documentPath = [_paths lastObject];
        NSLog(@"%@",_documentPath);
        NSString *_personFilePath = [_documentPath stringByAppendingPathComponent:@"memberInfoModel.archiver"];
        
        //实例化一个可变二进制数据的对象
        NSMutableData *_writingData = [NSMutableData data];
        //根据_writingData创建归档器对象
        NSKeyedArchiver *_archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:_writingData];
        //对指定数据做归档，并将归档数据写入到_writingData中
        [_archiver encodeObject:memberInfo forKey:@"memberInfoModel"];
        //完成归档
        [_archiver finishEncoding];
        
        //将_writingData写入到指定文件路径
        return  [_writingData writeToFile:_personFilePath atomically:YES];
    }
    
    //反归档，从沙盒中读取
- (BOOL)readMemberInfoModelFromLocation {
        NSArray *_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *_documentPath = [_paths lastObject];
        NSLog(@"%@",_documentPath);
        
        NSString *_personFilePath = [_documentPath stringByAppendingPathComponent:@"memberInfoModel.archiver"];
        //获取二进制字节流对象
        NSData *_readingData = [NSData dataWithContentsOfFile:_personFilePath];
        //通过_readingData对象来创建解档器对象
        NSKeyedUnarchiver *_unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:_readingData];
        if (_unarchiver == nil) {
            return NO;
        }else {
            //对二进制字节流做解档操作
           DLMemberInfoModel *membermodel = [_unarchiver decodeObjectForKey:@"memberInfoModel"];
            //完成解档
            [_unarchiver finishDecoding];
            //将从沙盒读取的个人信息，赋给当前的单例model
            if (membermodel.u_mobile != nil || ![membermodel.u_mobile isEqualToString:@""]) {
                self.memberInfoModel = membermodel;
                return YES;
            }else{
                return NO;
            }
        }
    }


//退出登录
- (void)logOffAction {
    //清空单例模型
    self.memberInfoModel = nil;
    //清空本地存储的模型
    [self clearMemberInfoFromLocation];
    //清空一些数据个人数据
    
   /*
    
    
    ============此处写一些个人的数据 ===== !!!    
    
    
    */
    
    
    
    
    
    //发送通知
#warning 退出登录发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"logOff" object:self userInfo:nil];
    
    
}
//清空本地的用户信息
- (void)clearMemberInfoFromLocation {
    NSArray *_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *_documentPath = [_paths lastObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *memberInfoPath = [_documentPath stringByAppendingPathComponent:@"memberInfoModel.archiver"];
    
    BOOL isExists = [fileManager fileExistsAtPath:memberInfoPath];
    
    if (isExists) {
        
        NSError *err;
        
        [fileManager removeItemAtPath:memberInfoPath error:&err];
        
    }
}



@end
