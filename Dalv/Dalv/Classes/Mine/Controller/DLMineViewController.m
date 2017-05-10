//
//  DLMineViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMineViewController.h"
#import <SMS_SDK/SMSSDK.h>

@interface DLMineViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passCodeTF;

@end

@implementation DLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)BtnClick:(id)sender {
    
    
       [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:@"159****1689" zone:@"86" customIdentifier:nil result:^(NSError *error) {
          
           if (!error) {
               NSLog(@"获取验证码成功");
           } else {
               NSLog(@"错误信息：%@",error);
           }
       }];
    
    /**
     * @brief                   提交验证码(Commit the verification code)
     * @param code              验证码(Verification code)
     * @param phoneNumber       电话号码(The phone number)
     * @param zone              区域号，不要加"+"号(Area code)
     * @param result            请求结果回调(Results of the request)
     */
    [SMSSDK commitVerificationCode:self.passCodeTF.text phoneNumber:_phoneTextFiled.text zone:@"86" result:^(SMSSDKUserInfo *userInfo, NSError *error) {
        
        {
            if (!error)
            {
                
                NSLog(@"验证成功");
            }
            else
            {
                NSLog(@"错误信息:%@",error);
            }
        }
    }];
    
    
    
    
}


- (IBAction)registerNowBtn:(id)sender {
    
    
}

@end
