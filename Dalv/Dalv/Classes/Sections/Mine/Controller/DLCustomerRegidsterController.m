//
//  DLCustomerRegidsterController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/19.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCustomerRegidsterController.h"
#import <MBProgressHUD.h>
@interface DLCustomerRegidsterController ()
    
/**** 顾客姓名   ****/
@property (weak, nonatomic) IBOutlet UITextField *customerNamelTF;
/**** 顾客手机号   ****/
@property (weak, nonatomic) IBOutlet UITextField *customerNumberTF;

/**** 顾客验证码   ****/
@property (weak, nonatomic) IBOutlet UITextField *customerCodeTF;
/**** 顾客密码   ****/
@property (weak, nonatomic) IBOutlet id customerPasswordTF;

/**** 顾客确认密码   ****/
@property (weak, nonatomic) IBOutlet UITextField *customerDeterminePasswordTF;

/**** 顾客绑定顾问的手机号   ****/
@property (weak, nonatomic) IBOutlet UITextField *customerBindingNumberTF;

/**** 顾客获取验证码按钮   ****/
@property (weak, nonatomic) IBOutlet UIButton *obtainCodeBtn;

/**** 立即注册按钮   ****/
@property (weak, nonatomic) IBOutlet UIButton *registerNowBtn;


@end

@implementation DLCustomerRegidsterController





/**** 立即注册   ****/
- (IBAction)registerBtnClick:(id)sender {
    
    
    
    
    
    
}







/**** 获取验证码   ****/
- (IBAction)obtainCodeBtnClick:(id)sender {
    
    
    
    
    
    
    
    
    

    //判断手机号的正则表达式
    NSString *regexPhoneNum = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    
    NSPredicate *predPhoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexPhoneNum];
    
    BOOL isMatchPhoneNum = [predPhoneNum evaluateWithObject:self.customerNumberTF.text];
    
    if (!isMatchPhoneNum){
        
        //手机号码不匹配
        UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您输入的号码有误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        
        [alertPhoneNum show];
    }
    
    if (self.customerNumberTF.text == nil) {
        
        [self showHint:@"手机号码不能为空"];
    }
    
    if(isMatchPhoneNum){
        
        [self openCountdown];
        
    }

    
    
}
// 开启倒计时效果
-(void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间
    self.obtainCodeBtn.enabled = NO;
    //背景变灰色
    //    self.authCodeBtn.backgroundColor = kColor(153, 153, 153, 1);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            //倒计时回归
            
            //停止倒计时
            
            //按钮可以点击
            self.obtainCodeBtn.enabled = YES;
            
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.obtainCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                
                [self.obtainCodeBtn setTitleColor:[UIColor colorWithHexString:@"0xFB8557"] forState:UIControlStateNormal];
                
                self.obtainCodeBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.obtainCodeBtn setTitle:[NSString stringWithFormat:@"重发(%.2d)", seconds] forState:UIControlStateNormal];
//                                [self.authCodeBtn setTitleColor:[UIColor colorWithHexString:@"0x979797"] forState:UIControlStateNormal];
                self.obtainCodeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
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



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
