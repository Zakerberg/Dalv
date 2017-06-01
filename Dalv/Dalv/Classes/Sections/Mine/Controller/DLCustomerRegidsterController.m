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
@property (weak, nonatomic) IBOutlet UITextField *customerPasswordTF;

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
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    /*
     name：姓名
     phone：手机
     vercode ：验证码
     password：密码
     theAgencyPhone：服务顾问手机号码

     DL_CustomerRegister
     */
    
    NSDictionary *param = @{
                            @"name":self.customerNamelTF.text,
                            @"phone":self.customerNumberTF.text,
                            @"vercode":self.customerCodeTF.text,
                            @"password":self.customerPasswordTF.text,
                            @"theAgencyPhone":self.customerBindingNumberTF.text
                            };
    if (1) {
        
    
        if (self.customerNamelTF.text == nil) {
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"姓名不能为空" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }
        if (self.customerNumberTF.text == nil) {
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请填写手机号" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }
        if (self.customerCodeTF.text == nil) {
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入验证码" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }
        if (self.customerPasswordTF.text == nil) {
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入密码" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }
        
        if (self.customerPasswordTF.text != self.customerDeterminePasswordTF.text) {
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"两次密码不一致" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        
        } else {
        
        [DLRequestSerVice POST:DL_CustomerRegister param:param success:^(id responseData) {
            
//            NSLog(@"顾客注册成功!");  !
//            [self.navigationController popViewControllerAnimated:YES];
            //写个提示框!
            UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功,快去登录吧" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [successV show];
            
        } failure:^(NSError *error) {
            
            //写个提示框!
            UIAlertView *failureV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册失败,请联系客服" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [failureV show];
            
        }];
     }
   }
}

/**** 获取验证码   ****/
- (IBAction)obtainCodeBtnClick:(id)sender {
    
    NSMutableDictionary *parement = [NSMutableDictionary dictionary];
    
    [parement setValue:self.customerNumberTF.text forKey:@"phone"];
    
    [DLRequestSerVice POST:DL_consultGetCode param:parement success:^(id responseData) {
        
    } failure:^(NSError *error) {
        
    }];
    
    //判断手机号的正则表达式
    NSString *regexPhoneNum = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    
    NSPredicate *predPhoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexPhoneNum];
    
    BOOL isMatchPhoneNum = [predPhoneNum evaluateWithObject:self.customerNumberTF.text];
    
    if (!isMatchPhoneNum){
        
        //手机号码不匹配
        UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您输入的号码有误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        
        [alertPhoneNum show];
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
