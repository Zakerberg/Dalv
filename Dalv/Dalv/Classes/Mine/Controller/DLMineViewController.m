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
#import <MBProgressHUD.h>

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
    
    //判断手机号的正则表达式
    NSString *regexPhoneNum = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    
    NSPredicate *predPhoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexPhoneNum];

     BOOL isMatchPhoneNum = [predPhoneNum evaluateWithObject:self.phoneTextFiled.text];
    
    if (!isMatchPhoneNum){
        
        //手机号码不匹配
        UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您输入的号码有误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        
        [alertPhoneNum show];
    
    }
    
    if (self.phoneTextFiled.text == nil) {
        
        [self showHint:@"手机号码不能为空"];
    }
    
    
    if(isMatchPhoneNum){
        
     [self openCountdown];
        
    }
    
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneTextFiled.text zone:@"86" customIdentifier:nil
        result:^(NSError *error)
     {
         if (!error)
             
         {
             UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"验证码已发送，请注意查收" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
             
             [alert show];
         }
     }];
     
//               UIAlertView* alert=[[UIAlertView alloc] initWithTitle:  NSLocalizedString(@"codesenderrtitle", nil)
//                                                             message:[NSString stringWithFormat:@"：%zi ,：%@",error.errorCode,error.errorDescription]
//                                                            delegate:self
//                                                   cancelButtonTitle:NSLocalizedString(@"sure", nil)
//                                                   otherButtonTitles:nil, nil nil];
//               [alert show];
//           

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
    
    
    //手机号匹配
    /*
     判断密码是否为空
     */
    if (_passCodeTF.text == nil) {
        
        //密码或者确认密码为空
        UIAlertView *alertSecretNil=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"密码不能为空" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        
        [alertSecretNil show];
    }
}


- (void)showHint:(NSString *)hint
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2];
}

@end
