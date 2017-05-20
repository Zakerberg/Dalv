//
//  BLMClearCacheTool.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/12.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLMClearCacheTool : NSObject

/**
 *  获取path路径文件夹的大小
 *
 *  @param path 要获取大小的文件夹全路径
 *
 *  @return 返回path路径文件夹的大小
 */
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;

/**
 *
 *  清除path路径文件夹的缓存
 *
 *  @param path  要清除缓存的文件夹全路径
 *
 *  @return 是否清除成功
 */
+ (BOOL)clearCacheWithFilePath:(NSString *)path;


@end
