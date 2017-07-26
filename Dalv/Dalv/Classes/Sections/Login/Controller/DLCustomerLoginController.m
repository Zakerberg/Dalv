//
//  DLCustomerLoginController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/21.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//   ------------------  顾客登录   -------------------

#import "DLCustomerLoginController.h"
#import "DLTabBarController.h"
#import "DLHomeViewTask.h"

@interface DLCustomerLoginController ()<UITextFieldDelegate>
//手机号
@property (weak, nonatomic) IBOutlet UITextField *numberTF;
//验证码
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
//登录
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
//获取验证码按钮
@property (weak, nonatomic) IBOutlet UIButton *passCodeBtn;
//顾问手机号
@property (weak, nonatomic) IBOutlet UITextField *agencyPhoneTF;

//验证码错误与否
@property(nonatomic,strong) NSString* passCodeStatusStr;

@end

@implementation DLCustomerLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
    
}

-(void)setUI{
    
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    self.title = @"尊享游客登录";
    self.numberTF.keyboardType = UIKeyboardTypeNumberPad;
    self.passwordTF.keyboardType = UIKeyboardTypeNumberPad;
    self.agencyPhoneTF.keyboardType = UIKeyboardTypeNumberPad;
    
    [_passCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_passCodeBtn setBackgroundColor:[UIColor colorWithHexString:@"#4d65f3"]];
    _passCodeBtn.layer.cornerRadius = 8.0;
    
    [_passCodeBtn addTarget:self action:@selector(passCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _passCodeBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _passCodeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[UIColor colorWithHexString:@"#536bf8"]];
    _loginBtn.layer.cornerRadius = 8.0;
    [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _loginBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
}

//登录按钮
- (IBAction)loginBtnClick {
    
            NSDictionary *param = @{
                                @"phone":self.numberTF.text,
                                @"vercode":self.passwordTF.text,
                                @"theAgencyPhone":self.agencyPhoneTF.text
                                };
        [DLHomeViewTask getTouristLoginRegister:param completion:^(id result, NSError *error) {
            
//            self.userTypeStr = result[@"user_type"];
            
            if ([result[@"status"] isEqualToString:@"00018"]) {
                
                //手机号码不匹配
                UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您输入的验证码有误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
                [alertPhoneNum show];
                self.passwordTF.text = nil;
                
            }
            
            
//            else if ([result[@"status"] isEqualToString:@"00041"]){
//                //手机号码不匹配
//                UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您已是顾问,快去登录吧" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
//                [alertPhoneNum show];
//
//                [self.navigationController popViewControllerAnimated:YES];
//            }
//
            else {//登录成功 -->
//                if (error) {
//                    [[DLHUDManager sharedInstance] showTextOnly:error.localizedDescription];
//                } else {
                
                    
                    if ([[result objectForKey:@"status"] isEqualToString:@"00000"]) {//登录成功保存数据
                       
                    [self dismissViewControllerAnimated:YES completion:nil];
                        
                        [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"sign_token"] forKey:@"sign_token"];
                        [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"uid"] forKey:@"uid"];
                        
                        [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"user_type"] forKey:@"user_type"];
                        
                        [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"binding_state"] forKey:@"binding_state"];

                        [[NSUserDefaults standardUserDefaults] synchronize];
                        [[DLHUDManager sharedInstance] showTextOnly:[result objectForKey:@"msg"]];
 
                        
                        DLTabBarController *tabVC = [[DLTabBarController alloc] init];
                        [UIApplication sharedApplication].keyWindow.rootViewController = tabVC;
                        
                        [[NSNotificationCenter defaultCenter] postNotificationName:KCustomerloginNoti object:nil];//登录成功通知回调

                         } else {
                        [[DLHUDManager sharedInstance]showTextOnly:[result objectForKey:@"msg"]];
                    }
                }
//          }
        }];
    }

//验证码按钮
- (IBAction)passCodeBtnClick {
    
    //判断手机号的正则表达式
    NSString *regexPhoneNum = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    
    NSPredicate *predPhoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexPhoneNum];
    
    BOOL isMatchPhoneNum = [predPhoneNum evaluateWithObject:self.numberTF.text];
    
    if (!isMatchPhoneNum){
        
        //手机号码不匹配
        UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您输入的号码有误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        
        [alertPhoneNum show];
    }
    
    if (self.numberTF.text == nil) {
        
        [self showHint:@"手机号码不能为空"];
    }
    
    if(isMatchPhoneNum){
        
        [self openCountdown];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"验证码已发送，请注意查收" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
        NSDictionary *param = @{
                                @"phone":self.numberTF.text
                                };
        
        [DLHomeViewTask getTouristVerificationCode:param completion:^(id result, NSError *error) {
            
            if ([result[@"binding_state"] isEqualToString:@"0"]) {
                 NSLog(@"没有绑定顾问");

            }else{
                /// 已经绑定顾问
                NSLog(@"已经绑定顾问");
                self.agencyPhoneTF.placeholder = @"您已经绑定了顾问";
                self.agencyPhoneTF.userInteractionEnabled = NO;
            }
        }];
    }
}

#pragma mark ----------  开启倒计时效果 ---------------
-(void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间
    self.passCodeBtn.enabled = NO;
    //背景变灰色
    self.passCodeBtn.backgroundColor = kColor(153, 153, 153, 1);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            //按钮可以点击
            self.passCodeBtn.enabled = YES;
            self.passCodeBtn.backgroundColor = [UIColor colorWithHexString:@"#4d65f3"];
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.passCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                [self.passCodeBtn setBackgroundColor:[UIColor colorWithHexString:@"#4d65f3"]];
                
                self.passCodeBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.passCodeBtn setTitle:[NSString stringWithFormat:@"重发(%.2d)", seconds] forState:UIControlStateNormal];
                
                self.passCodeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}


#pragma mark ----------  showHint ---------------

-(void)showHint:(NSString *)hint{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

@end
