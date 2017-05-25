//
//  DLManager.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/25.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLManager.h"

@implementation DLManager



//检验手机验证码
//- (void)httpCheckMobileCodeWithMobileNumber:(NSString *)mobileNumber withCode:(NSString *)code withCodeSuccessResult:(SuccessResult)codeSuccessResult withCodeFailResult:(FailResult)codeFailResult {
//    [[NetManager shareInstance] getRequestWithURL:[[InterfaceManager shareInstance] checkMobileCodeWithMobileNumber:mobileNumber withCode:code] withParameters:nil withContentTypes:@"string" withHeaderArr:nil withSuccessResult:^(AFHTTPRequestOperation *operation, id successResult) {
//        NSLog(@"%ld",operation.response.statusCode);
//        codeSuccessResult(@"200");
//        
//    } withError:^(AFHTTPRequestOperation *operation, NSError *errorResult) {
//        
//        id messageInfo = [NSJSONSerialization JSONObjectWithData:operation.responseObject options:NSJSONReadingAllowFragments error:nil];
//        NSString *messageStr ;
//        if ([messageInfo isKindOfClass:[NSString class]]) {
//            messageStr = messageInfo;
//        }else {
//            NSDictionary *messageDic = (NSDictionary *)messageInfo;
//            
//            messageStr = [messageDic objectForKey:@"Message"];
//        }
//        
//        codeFailResult([NSString stringWithFormat:@"%ld-%@",operation.response.statusCode,messageStr]);
//    }];

@end
