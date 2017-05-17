//
//  DLFileManager.m
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFileManager.h"

#define CacheFilePath [NSHomeDirectory() stringByAppendingString:@"/Documents/CacheFile/DL"] // 缓存路径
@implementation DLFileManager

/**
 *  写入文件
 */
+ (BOOL)wirteToFileWithFileName:(NSString *)fileName content:(NSString *)content {
    
    NSError *error;
    //    NSString *fileName = [IMUtility md5:aUrl];
    NSString *filePath = [CacheFilePath stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if(![fileManager fileExistsAtPath:filePath]) {
        [fileManager createDirectoryAtPath:CacheFilePath withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    if(!error){
        [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        return YES;
    } else {
        //        [CRMTools showFailedHint:error.description completionBlock:nil];
        return NO;
    }
}

/**
 *  文件的读取
 *
 *  @return 返回字符串
 */
+ (NSString *)readFileWithFileName:(NSString *)fileName {
    
    NSError *error;
    //    NSString *fileName = [IMUtility  md5:aUrl];
    NSString *filePath = [CacheFilePath stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *fileStr;
    
    if([fileManager fileExistsAtPath:filePath]) {
        fileStr =  [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    }
    
    if(!error) {
        return fileStr;
    } else {
        //        [CRMTools showFailedHint:error.description completionBlock:nil];
        return nil;
    }
}

/**
 *  是否有缓存
 */
+ (BOOL)isHasCacheFile:(NSString *)fileName cache:(DLFileCacheTime)cacheData {
    
    //    NSString *fileName = [IMUtility  md5:aUrl];
    NSString *filePath = [CacheFilePath stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if(![fileManager fileExistsAtPath:filePath]) return NO;
    
    NSError *error = nil;
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:filePath error:&error];
    if (fileAttributes != nil) {
        
        NSDate *fileCreateDate = [fileAttributes objectForKey:NSFileCreationDate];
        NSLog(@"File creationDate: %@\n", fileCreateDate);
        NSTimeInterval  timeInterval = -[fileCreateDate timeIntervalSinceNow];
        
        if(timeInterval > cacheData && cacheData != 0) { // 文件创建时间过早 应该更新 判断无缓存 ，请求直接覆盖
            return NO;
        } else {  //cacheData 为0的时候表示缓存时间无限大
            return YES;
        }
    }
    return NO;
}

/**
 *  清除所有缓存文件
 */
+ (BOOL)clearAllCacheFile {
    
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:CacheFilePath]) {
        [fileManager removeItemAtPath:CacheFilePath error:&error];
    }
    
    if(!error) {
        return YES;
    } else {
        //        [CRMTools showFailedHint:error.description completionBlock:nil];
        return NO;
    }
}

/**
 *  清除指定路径的缓存文件
 */
+ (BOOL)deleteCacheFilesWithFilePath:(NSString *)filePath {
    
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:filePath]) {
        [fileManager removeItemAtPath:filePath error:&error];
    }
    
    if(!error) {
        return YES;
    } else {
        //        [CRMTools showFailedHint:error.description completionBlock:nil];
        return NO;
    }
}

@end
