//
//  UIButton+WebCache.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/19.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "UIButton+WebCache.h"

@implementation UIButton (WebCache)

- (void)sd_setButtonImageWithUrl:(NSString *)urlStr{
   
    NSURL * url = [NSURL URLWithString:urlStr];
    
    // 根据图片的url下载图片数据
    dispatch_queue_t sdQueue = dispatch_queue_create("loadImage", NULL);
    // 创建GCD线程队列
    dispatch_async(sdQueue, ^{
        // 异步下载图片
        UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        // 主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setImage:img forState:UIControlStateNormal];
        });
    });
}
@end
