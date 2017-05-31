//
//  NSString+Extension.h
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,MISFileType) {
    MISFileTypeWord,
    MISFileTypeExcel,
    MISFileTypePPT,
    MISFileTypeOffice,
    MISFileTypeVideo,
    MISFileTypeAudio,
    MISFileTypePicture,
    MISFileTypeZip,
    MISFileTypeUnknow,
};

@interface NSString (Extension)

/**
 *  去除字符串前后空格
 */
- (NSString *)trim;

/**
 *  判断字符串是否非空
 *
 *  @param str 待判定的字符串
 *
 *  @return YES or NO
 */
+ (BOOL)isNotBlank:(NSString *)str;

/**
 *  判断字符串是否为空
 *
 *  @param str 待判定的字符串
 *
 *  @return YES or NO
 */
+ (BOOL)isBlank:(NSString *)str;

/**
 *  生成指定长度的随机字符串 - 字母数字
 *
 *  @param length 长度
 *
 *  @return 随机字符串
 */
+ (NSString *)randomWDs:(NSInteger)length;

/**
 *  生成指定长度的随机字符串 - 汉字
 *
 *  @param length 长度
 *
 *  @return 随机字符串
 */
+ (NSString *)randomWords:(NSInteger)length;

/**
 *  生成指定长度的中文字符串
 *
 *  @param length 指定长度
 *
 *  @return 字符串
 */
+ (NSString *)randomChineseWords:(NSInteger)length;


// json 转字典
+ (NSArray *)jsonStringToArray:(NSString *)jsonStr;

// json 转数组
+ (NSDictionary *)jsonStringToDictionary:(NSString *)jsonStr;

#pragma mark 动态计算高度 参数字体大小 宽度  字符串

-(CGFloat)autolableHeightWithFont:(UIFont *)font Width:(CGFloat)width;

#pragma mark 动态计算宽度

-(CGFloat)autolableWidthtWithFont:(UIFont *)font;

#pragma mark - MD5

/**
 *  获取MD5加密码
 */
- (NSString *)MD5;
+ (NSString *)MD5:(NSString *)str;

/**
 *  获取SHA1加密码
 */
- (NSString *)SHA1;
+ (NSString *)SHA1:(NSString *)str;

- (NSData *)stringToByte;
+ (NSData *)stringToByte:(NSString *)string;

+ (NSString *)hexStringFromData:(NSData *)data;

+ (NSString *)randomKeyString;

+ (NSString *)UUID;

+ (NSString *)ret32bitString;


+ (BOOL)stringContainsEmoji:(NSString *)string;

/**
 *  手机号校验
 */
+ (BOOL)validateMobile:(NSString *)mobile;

- (MISFileType)fileType;

+ (NSString *)convertFileSize:(long long)size;
// 获取网络状态
+ (NSString *)getNetWorkStates;

+ (NSString*)encodeString:(NSString*)unencodedString;

//URLDEcode
- (NSString *)decodeString:(NSString*)encodedString;

//将 &lt 等类似的字符转化为HTML中的“<”等
+ (NSString *)htmlEntityDecode:(NSString *)string;

//将HTML字符串转化为NSAttributedString富文本字符串
+ (NSAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString;

//去掉 HTML 字符串中的标签
+ (NSString *)filterHTML:(NSString *)html;
@end
