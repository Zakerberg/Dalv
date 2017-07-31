//
//  UIImage+ZipAndLength.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZipAndLength)
- (UIImage *)compressToByte:(NSUInteger)maxLength;
//直接调用这个方法进行压缩体积,减小大小
- (UIImage *)zip;
@end
