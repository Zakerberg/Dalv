//
//  DLLoginView.m
//  Dalv
//
//  Created by Nie on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLoginView.h"
#import "DLMineViewController.h"
@interface DLLoginView ()<UITextFieldDelegate,UIAlertViewDelegate>

@property (nonatomic, assign) CGRect defaultViewRect;

@end

@implementation DLLoginView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubViews];
    }
    return self;
}

#pragma mark - configureSubViews
- (void)configureSubViews {
    UIFont *font = [UIFont systemFontOfSize:14];
    UIColor *color = [UIColor whiteColor];
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *loginImage = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 104, 100, 40)];
    loginImage.image = [UIImage imageNamed:@"dl_logo"];
    [self addSubview:loginImage];
    
    UILabel *loginLab = [[UILabel alloc]initWithFrame:CGRectMake(100, loginImage.bottom, SCREEN_WIDTH-200, 40)];
    loginLab.textAlignment = NSTextAlignmentCenter;
    loginLab.text = @"大旅账号登陆";
    loginLab.textColor = [UIColor colorWithHexString:@"#444444"];
    loginLab.font = [UIFont systemFontOfSize:18];
    [self addSubview:loginLab];
    
    self.loginIdTextField = [[UITextField alloc] init];
    self.loginIdTextField.frame = CGRectMake(25,loginLab.bottom+30, SCREEN_WIDTH-50, 40);
    self.loginIdTextField.font = font;
    self.loginIdTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.loginIdTextField.placeholder = @"请输入手机号";
    self.loginIdTextField.backgroundColor = color;
    self.loginIdTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.loginIdTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.loginIdTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.loginIdTextField.leftViewMode = UITextFieldViewModeAlways;
    self.loginIdTextField.delegate = self;
    [self addSubview:self.loginIdTextField];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(self.loginIdTextField.x,self.loginIdTextField.bottom+5, self.loginIdTextField.width, 1)];
    line.backgroundColor = [UIColor colorWithHexString:@"dddddd"];
    [self addSubview:line];

    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.frame=CGRectMake(self.loginIdTextField.x,line.bottom+5, self.loginIdTextField.width,40);
    self.passwordTextField.font = font;
    self.passwordTextField.placeholder = @"请输入密码";
    self.passwordTextField.backgroundColor = color;
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
    self.passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.passwordTextField  setSecureTextEntry:YES];
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTextField.delegate = self;
    [self addSubview:self.passwordTextField];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(self.passwordTextField.x,self.passwordTextField.bottom+5, self.passwordTextField.width, 1)];
    line1.backgroundColor = [UIColor colorWithHexString:@"dddddd"];
    [self addSubview:line1];

        
    UIButton *footBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    footBtn.frame=CGRectMake(self.passwordTextField.x, self.passwordTextField.bottom+30, self.passwordTextField.width, 40);
    [footBtn setTitle:@"登录" forState:UIControlStateNormal];
    footBtn.backgroundColor = [UIColor colorWithHexString:@"#536bf8"];
    [footBtn  addTarget:self action:@selector(performLoginAction) forControlEvents:UIControlEventTouchUpInside];
    footBtn.layer.cornerRadius = 8.0;
    [self addSubview:footBtn];
    
    UIButton *forgetBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    forgetBtn.frame=CGRectMake(25, footBtn.bottom+15, 100, 30);
    [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    footBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    forgetBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [forgetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forgetBtn  addTarget:self action:@selector(performForgotPasswordAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:forgetBtn];
    
//    UIButton *registerbutton =[UIButton buttonWithType:UIButtonTypeCustom];
//    registerbutton.frame=CGRectMake(forgetBtn.ms_right, footBtn.bottom+25, footBtn.width/2, 30);
//    [registerbutton setTitle:@"注     册" forState:UIControlStateNormal];
//    registerbutton.titleLabel.font=[UIFont systemFontOfSize:14];
//    [registerbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [registerbutton  addTarget:self action:@selector(didRegisterButton) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:registerbutton];

}

#pragma mark - ButtonAction
- (void)performLoginAction {
    
    if (self.loginIdTextField.text.length == 0) {
        [[DLHUDManager sharedInstance]showTextOnly:@"手机号不能为空"];
        return;
    }
    //判断手机号的正则表达式
    NSString *regexPhoneNum = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    
    NSPredicate *predPhoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexPhoneNum];
    
    BOOL isMatchPhoneNum = [predPhoneNum evaluateWithObject:self.loginIdTextField.text];
    
    if (!isMatchPhoneNum){
        [[DLHUDManager sharedInstance]showTextOnly:@"你输入的号码格式有误"];
        return;
    }
    
    if ( self.passwordTextField.text.length == 0) {
        [[DLHUDManager sharedInstance]showTextOnly:@"您还没有输入密码呢"];
        return;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginBtnClickDelegateWithUsename:Password:)]) {
        [self.delegate loginBtnClickDelegateWithUsename:self.loginIdTextField.text Password:self.passwordTextField.text];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self endEditing:YES];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    UIWindow * window=[UIApplication sharedApplication].delegate.window;
    CGRect rc = [self convertRect:textField.frame toView:window];
    NSLog(@"%f  %f",rc.origin.y, rc.size.height );
    [self updateViewFrame:rc];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self recoverViewFrame];
    
}

////注册
//- (void)didRegisterButton {
//    DLMineViewController *minVC= [[DLMineViewController alloc] init];
//    [self.navigationController pushViewController:minVC animated:YES];
//}


//忘记密码
- (void)performForgotPasswordAction {
    UIAlertView *phoneAlert = [[UIAlertView alloc]initWithTitle:@"拨打客服" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"呼叫", nil];
    phoneAlert.tag = 81;
    [phoneAlert show];
}
#pragma mark -UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 81){
        if (buttonIndex == 1) {
        if(![[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://010-85625636"]] ){
                [[DLHUDManager sharedInstance]showTextOnly:@"设备不支持"];
            }
        }
    }
}


- (void)updateViewFrame:(CGRect)rect {
    int y = rect.origin.y + rect.size.height + ([[UIScreen mainScreen] bounds].size.height > 480?30:0);
    int h = self.height - 260;
    int yh = y - h;
    if (yh > 0) {
        [UIView animateWithDuration:0.3 animations:^{
            self.y = self.y-yh;
        } completion:^(BOOL completion){
            
        }];
    }
    
}
- (void)recoverViewFrame {
    [UIView animateWithDuration:0.3 animations:^{
        self.y = 64;
    } completion:^(BOOL completion){
        
    }];
}

@end
