//
//  NSString+Extension.m
//  DaLv
//
//  Created by Nie on 2017/5/10.
//  Copyright © 2017年 Nie. All rights reserved.
//

#import "NSString+Extension.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension)

- (NSString *)trim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

+ (BOOL)isNotBlank:(NSString *)str {
    return ![self isBlank:str];
}

+ (BOOL)isBlank:(NSString *)str {
    
    if (str == nil || str == NULL) {
        return YES;
    }
    
    if (![str isKindOfClass:[NSString class]])
    {
        return YES;
    }
    
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    
    return NO;
    
}

+ (NSString *)randomWDs:(NSInteger)length {
    
    NSString *words = [NSString new];
    for (int i = 0; i < length; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            words = [words stringByAppendingString:tempString];
        } else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            words = [words stringByAppendingString:tempString];
        }
    }
    return words;
}

+ (NSString *)randomChineseWords:(NSInteger)length {
    NSMutableString *words = [NSMutableString string];
    for (int i = 0; i < length; i++) {
        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSInteger randomH = 0xA1 + arc4random() % (0xFE - 0xA1+1);
        NSInteger randomL = 0xB0 + arc4random() % (0xF7 - 0xB0+1);
        NSInteger number = (randomH << 8) + randomL;
        NSData *data = [NSData dataWithBytes:&number length:2];
        NSString *word = [[NSString alloc] initWithData:data encoding:gbkEncoding];
        [words appendFormat:@"%@", word];
    }
    return [words copy];
}

+ (NSString *)randomWords:(NSInteger)length {
    
    NSMutableString *words = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        
        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSInteger randomH = 0xA1 + arc4random() % (0xFE - 0xA1+1);
        NSInteger randomL = 0xB0 + arc4random() % (0xF7 - 0xB0+1);
        NSInteger number = (randomH << 8) + randomL;
        NSData *data = [NSData dataWithBytes:&number length:2];
        NSString *word = [[NSString alloc] initWithData:data encoding:gbkEncoding];
        [words appendFormat:@"%@", word];
    }
    
    return [words copy];
}


+ (NSDictionary *)jsonStringToDictionary:(NSString *)jsonStr {
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
    
    return json;
}

+ (NSArray *)jsonStringToArray:(NSString *)jsonStr {
    
    NSArray *json = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
    
    return json;
}

// 动态计算lable的高度
- (CGFloat)autolableHeightWithFont:(UIFont *)font Width:(CGFloat)width {
    
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    CGSize  msgSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    return msgSize.height;
}

- (CGFloat)autolableWidthtWithFont:(UIFont *)font {
    
    CGSize size = CGSizeMake(MAXFLOAT, 20);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    CGSize  msgSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:tdic context:nil].size;
    return msgSize.width;
}

#pragma mark - MD5

- (NSString *)MD5 {
    
    return [NSString MD5:self];
}

+ (NSString *)MD5:(NSString *)str {
    
    if ([NSString isBlank:str]) return str;
    
    const char *cStr =[str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (unsigned int)strlen(cStr), result);
    return[NSString stringWithFormat:
           @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
           result[0], result[1], result[2], result[3],
           result[4], result[5], result[6], result[7],
           result[8], result[9], result[10], result[11],
           result[12], result[13], result[14], result[15]
           ];
}

- (NSString *)SHA1 {
    
    return [NSString SHA1:self];
}

+ (NSString *)SHA1:(NSString *)str {
    
    const char *cstr = [str cStringUsingEncoding:NSUTF8StringEncoding];
    
    NSData *data = [NSData dataWithBytes:cstr length:str.length];
    uint32_t length = (uint32_t)data.length;
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

- (NSData *)stringToByte {
    
    return [[self class] stringToByte:self];
}

+ (NSData *)stringToByte:(NSString *)string {
    NSString *hexString=[[string uppercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([hexString length]%2!=0) {
        return nil;
    }
    Byte tempbyt[1]={0};
    NSMutableData* bytes=[NSMutableData data];
    for(int i=0;i<[hexString length];i++)
    {
        unichar hex_char1 = [hexString characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
        int int_ch1;
        if(hex_char1 >= '0' && hex_char1 <='9')
            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
        else
            return nil;
        i++;
        
        unichar hex_char2 = [hexString characterAtIndex:i]; ///两位16进制数中的第二位(低位)
        int int_ch2;
        if(hex_char2 >= '0' && hex_char2 <='9')
            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
        else if(hex_char2 >= 'A' && hex_char2 <='F')
            int_ch2 = hex_char2-55; //// A 的Ascll - 65
        else
            return nil;
        
        tempbyt[0] = int_ch1+int_ch2;  ///将转化后的数放入Byte数组里
        [bytes appendBytes:tempbyt length:1];
    }
    return bytes;
}

+ (NSString *)hexStringFromData:(NSData *)data {
    
    Byte *bytes = (Byte *)[data bytes];
    // 下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i = 0; i < [data length]; i++) {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff]; // 16进制数
        if([newHexStr length] == 1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    
    NSLog(@"%@",hexStr);
    
    return hexStr;
}

+ (NSString *)randomKeyString {
    
    NSString *uuidString = [NSString UUID];
    NSInteger timeInterval = [[NSNumber numberWithDouble:[[NSDate new] timeIntervalSince1970]] integerValue] << 3;
    
    NSInteger random = arc4random() % 10000 + 1;
    NSInteger t = timeInterval + random;
    
    NSString *str = [NSString stringWithFormat:@"%@%@%@",[NSString ret32bitString], uuidString, [NSString stringWithFormat:@"%ld",(long)t]];
    NSString *key = [NSString MD5:str];
    return key;
}

+ (NSString *)UUID {
    
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}

+ (NSString *)ret32bitString {
    
    char data[32];
    for (int x=0;x<32;data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:32 encoding:NSUTF8StringEncoding];
}

#pragma mark - Emoji

+ (BOOL)stringContainsEmoji:(NSString *)string {
    
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}

//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    //"((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)"
    //手机号以13， 15，18开头，八个 \d 数字字符
    //    NSString *phoneRegex = @"((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)";//@"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    
    //    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    //
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    //
    //    BOOL isMatch = [pred evaluateWithObject:mobile];
    //    return isMatch;
    
    NSString *phoneRegex = @"(^[0-9]{3,4}\\-[0-9]{3,8}$)|(^0{0,1}1[3-8]{1}[0-9]{9}$)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

- (MISFileType)fileType {
    //    NSArray *officeTypeArray = @[@"doc",@"xls",@"xlsx",@"ppt"];
    NSArray *videoTypeArray = @[@"mov",@"mp4",@"3gp",@"m4v"];
    NSArray *audioTypeArray = @[@"aac",@"caf",@"mp3",@"m4a",@"wav",@"m4r"];
    NSArray *pictureTypeArray = @[@"jpg",@"jpeg",@"gif",@"png",@"ico"];
    NSArray *zipTypeArray = @[@"jpg",@"jpeg",@"gif",@"png",@"ico"];
    
    if ([self isEqualToString:@"doc"] || [self isEqualToString:@"docx"]||[self isEqualToString:@"txt"]) {
        return MISFileTypeWord;
    }else if ([self isEqualToString:@"xls"]||[self isEqualToString:@"xlsx"]) {
        return MISFileTypeExcel;
    }else if ([self isEqualToString:@"ppt"]||[self isEqualToString:@"pptx"]||[self isEqualToString:@"pdf"]) {
        return MISFileTypePPT;
    }else if ([videoTypeArray containsObject:self]) {
        return MISFileTypeVideo;
    }else if ([audioTypeArray containsObject:self]) {
        return MISFileTypeAudio;
    }else if ([pictureTypeArray containsObject:self]) {
        return MISFileTypePicture;
    }else if ([zipTypeArray containsObject:self]) {
        return MISFileTypeZip;
    }else {
        return MISFileTypeUnknow;
    }
}

+ (NSString *)convertFileSize:(long long)size {
    
    long kb = 1024;
    long mb = kb * 1024;
    long gb = mb * 1024;
    
    if (size >= gb) {
        
        return [NSString stringWithFormat:@"%.1f GB", (float) size / gb];
        
    } else if (size >= mb) {
        
        float f = (float) size / mb;
        if (f > 100) {
            return [NSString stringWithFormat:@"%.0f MB", f];
        } else {
            return [NSString stringWithFormat:@"%.1f MB", f];
        }
        
    } else if (size >= kb) {
        
        float f = (float) size / kb;
        if (f > 100) {
            return [NSString stringWithFormat:@"%.0f KB", f];
        } else {
            return [NSString stringWithFormat:@"%.1f KB", f];
        }
        
    } else {
        
        return [NSString stringWithFormat:@"%lld B", size];
    }
}

+ (NSString *)getNetWorkStates{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    NSString *state = @"无网络";
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
            switch (netType) {
                case 0:
                    state = @"无网络";
                    //无网模式
                    break;
                case 1:
                    state = @"2G";
                    break;
                case 2:
                    state = @"3G";
                    break;
                case 3:
                    state = @"4G";
                    break;
                case 5:
                    state = @"WIFI";
                    break;
                default:
                    state = @"无网络";
                    break;
            }
        }
    }
    //根据状态选择
    return state;
}

+(NSString*)encodeString:(NSString*)unencodedString{
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

//URLDEcode
-(NSString *)decodeString:(NSString*)encodedString

{
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)encodedString,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

//将 &lt 等类似的字符转化为HTML中的“<”等
+ (NSString *)htmlEntityDecode:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"]; // Do this last so that, e.g. @"&amp;lt;" goes to @"&lt;" not @"<"
    
    return string;
}

//将HTML字符串转化为NSAttributedString富文本字符串
+ (NSAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString {
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                               NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [[NSAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
}

//去掉 HTML 字符串中的标签
+ (NSString *)filterHTML:(NSString *)html {
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}

@end
