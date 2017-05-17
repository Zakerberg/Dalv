//
//  DLFileManager.h
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  文件缓存有效时长
 */
typedef NS_ENUM(NSInteger, DLFileCacheTime) {
    CacheTimeMinute = 60,               // 一分钟
    CacheTimehour = 60 * 60,            // 一小时
    CacheTimeDay = 1 * 60 * 60 * 24,    // 一天
    CacheTimeSeven = 7 * 60 * 60 * 24,  // 七天
    CacheTimeMonth = 30 * 60 * 60 * 24, // 一个月
    CacheTimeForever = 0                // 永久
};


@interface DLFileManager : NSObject

+ (BOOL)wirteToFileWithFileName:(NSString *)fileName content:(NSString *)content;

+ (NSString *)readFileWithFileName:(NSString *)fileName;

+ (BOOL)isHasCacheFile:(NSString *)fileName cache:(DLFileCacheTime)cacheData;

+ (BOOL)clearAllCacheFile;

+ (BOOL)deleteCacheFilesWithFilePath:(NSString *)filePath;


@end
