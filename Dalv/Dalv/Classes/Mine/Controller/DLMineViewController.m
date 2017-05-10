//
//  DLMineViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMineViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import "UIColor+Addition.h"

@interface DLMineViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passCodeTF;
@property (weak, nonatomic) IBOutlet UIButton *authCodeBtn;

@end


@implementation DLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)BtnClick:(id)sender {
    
    [self openCountdown];
    [self.authCodeBtn sizeToFit];
    
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


// 开启倒计时效果
-(void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.authCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                
                [self.authCodeBtn setTitleColor:[UIColor colorWithHex:0xFB8557] forState:UIControlStateNormal];
                
                self.authCodeBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.authCodeBtn setTitle:[NSString stringWithFormat:@"重发(%.2d)", seconds] forState:UIControlStateNormal];
                [self.authCodeBtn setTitleColor:[UIColor colorWithHex:0x979797] forState:UIControlStateNormal];
                self.authCodeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

- (IBAction)registerNowBtn:(id)sender {
    
    
}

@end
