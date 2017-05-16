//
//  DLLoginView.m
//  Dalv
//
//  Created by Nie on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLoginView.h"

@interface DLLoginView ()<UITextFieldDelegate>
{
    UIImageView *accountImage;
    UIImageView *pwdImage;
    UIImageView *inputImage;
    NSArray *allTextFields;
}
@property (nonatomic, assign) CGRect defaultViewRect;
@end

@implementation DLLoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureSubViews];
    }
    return self;
}

#pragma mark - configureSubViews
- (void)configureSubViews
{
    UIFont *font = [UIFont systemFontOfSize:14];
    UIColor *color = [UIColor whiteColor];
    self.backgroundColor = [UIColor whiteColor];
    
    accountImage=[[UIImageView alloc] initWithFrame:CGRectMake(80, 150, 25, 25)];
    accountImage.image = [UIImage imageNamed:@"user.png"];
    [self addSubview:accountImage];
    
    self.loginIdTextField = [[UITextField alloc] init];
    self.loginIdTextField.frame = CGRectMake(accountImage.right+10,150, SCREEN_WIDTH-160, 30);
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
    
    inputImage = [[UIImageView alloc] init];
    inputImage.frame = CGRectMake(accountImage.x,self.loginIdTextField.bottom-0.5 ,self.loginIdTextField.width, 0.5);
    inputImage.image = [UIImage imageNamed:@"login_input.png"];
    [self addSubview:inputImage];
    
    pwdImage = [[UIImageView alloc] initWithFrame:CGRectMake(accountImage.x, self.loginIdTextField.bottom+30, 25, 25)];
    pwdImage.image = [UIImage imageNamed:@"lock.png"];
    [self addSubview:pwdImage];
    
    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.frame=CGRectMake(self.loginIdTextField.x,pwdImage.y, SCREEN_WIDTH-160,30);
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
    
    inputImage = [[UIImageView alloc] init];
    inputImage.frame = CGRectMake(accountImage.x,self.passwordTextField.bottom-0.5 ,self.passwordTextField.width, 0.5);
    inputImage.image = [UIImage imageNamed:@"login_input.png"];
    [self addSubview:inputImage];
    
    UIButton *footBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    footBtn.frame=CGRectMake(70, self.passwordTextField.bottom+30, SCREEN_WIDTH-140, 40);
    [footBtn setTitle:@"登录" forState:UIControlStateNormal];
    [footBtn setBackgroundImage:[UIImage imageNamed:@"login_btn.png"] forState:UIControlStateNormal];
    [footBtn setBackgroundImage:[UIImage imageNamed:@"login_btn.png"] forState:UIControlStateHighlighted];
    [footBtn  addTarget:self action:@selector(performLoginAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:footBtn];
    
        UIButton *forgetBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        forgetBtn.frame=CGRectMake(100, footBtn.bottom+45, SCREEN_WIDTH-200, 30);
        [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        forgetBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        [forgetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [forgetBtn  addTarget:self action:@selector(performForgotPasswordAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:forgetBtn];
}

#pragma mark - ButtonAction
- (void)performLoginAction
{
    if (self.loginIdTextField.text.length == 0) {
        [[DLHUDManager sharedInstance]showTextOnly:@"手机号不能为空"];
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self endEditing:YES];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    UIWindow * window=[UIApplication sharedApplication].delegate.window;
    CGRect rc = [self convertRect:textField.frame toView:window];
    NSLog(@"%f  %f",rc.origin.y, rc.size.height );
    [self updateViewFrame:rc];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self recoverViewFrame];
    
}

//忘记密码
- (void)performForgotPasswordAction
{
    if(![[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://15701189832"]] ){
                        [[DLHUDManager sharedInstance]showTextOnly:@"设备不支持"];
    }
}

- (void)updateViewFrame:(CGRect)rect
{
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
- (void)recoverViewFrame
{
    [UIView animateWithDuration:0.3 animations:^{
        self.y = 64;
    } completion:^(BOOL completion){
        
    }];
}

@end
