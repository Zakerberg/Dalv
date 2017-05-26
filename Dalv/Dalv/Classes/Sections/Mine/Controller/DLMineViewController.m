//
//  DLMineViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//@"index.php/Api/login/agencyVerificationCode"

#import "DLMineViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import <MBProgressHUD.h>
#import "DLCityPickerView.h"
#import "DLHomeViewTask.h"
#import <MJExtension.h>
#import "DLSalertView.h"
#import "DLConsultModel.h"

#define DL_HOST @"http://dalvuapi.dalvu.com/"
#define DL_consultGetCode DL_HOST@"index.php/Api/login/agencyVerificationCode"
#define DL_ConsultRegister DL_HOST@"index.php/Api/login/agencyRegister"

#define kColor(X,Y,Z,A) [UIColor colorWithRed:X/255.0 green:Y/255.0 blue:Z/255.0 alpha:A]
#define kMainColor [UIColor colorWithRed:208/255.0 green:23/255.0 blue:21/255.0 alpha:1]

@interface DLMineViewController ()<DLCityPickerViewDelegate,DLSalertViewDelegate>
/****  姓名  ****/
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
/****  选择城市  ****/
@property (weak, nonatomic) IBOutlet UIButton *changeCityBtn;
/****  电话号码  ****/
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
/****  验证码  ****/
@property (weak, nonatomic) IBOutlet UITextField *passCodeTF;
/****  获取验证码  ****/
@property (weak, nonatomic) IBOutlet UIButton *authCodeBtn;
/****  密码  ****/
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
/****  确认密码  ****/
@property (weak, nonatomic) IBOutlet UITextField *determinePasswordTF;

///****  输入的职位  ****/
@property (weak, nonatomic) IBOutlet UITextField *positionTF;

@property (nonatomic,strong) DLSalertView *alertView;
@property (nonatomic,strong) NSDictionary *data;

@end


@implementation DLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}





/*****  选择城市   ****/
- (IBAction)changeCityBtnClick:(UIButton *)sender {
    
    NSMutableArray *arrayData = [NSMutableArray arrayWithObjects:@"北京市",@"唐山市",@"天津市",@"石家庄市",@"其他", nil];
    
    DLCityPickerView *pickerSingle = [[DLCityPickerView alloc]init];
    
    
    
    [pickerSingle setDataArray:arrayData];
    [pickerSingle setDefalutSelectRowStr:arrayData[0]];
    [pickerSingle setDelegate:self];
    [pickerSingle show];
    [self.view endEditing:YES];

}

/*****  获取验证码  *****/
- (IBAction)BtnClick:(id)sender {
    
    /*
     
     [parement setValue:@"8" forKey:@"call"];
     
     
     [[AXFNetworkTools shared] requestMethod:POST urlString:urlstr parameters:parement success:^(id responseObject) {
     
     NSDictionary *dic = responseObject;
     NSArray *dataArr = dic[@"data"];
     NSMutableArray *arrM = [NSMutableArray array];
     [dataArr enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
     
     AXFSearchModel *model = [AXFSearchModel axfSearchModelWithDic:dic];
     [arrM addObject:model];
     
     
     }];
     self.dicArr = arrM.copy;
     
     
     [[NSOperationQueue mainQueue] addOperationWithBlock:^{
     
     [self.collectionView reloadData];
     [self.hud hideAnimated:YES];
     self.collectionView.hidden = NO;
     self.shopButton.hidden = NO;
     
     }];：{phone : 13126997216 }

     测试注册时发送短信接口地址：
     http://dalvuapi.dalvu.com/index.php/Api/login/agencyRegister
     请求方式：POST
     请求参数：
     name：姓名
     province ： 城市 选择，1北京市，3天津市，4石家庄市，5唐山市，1其他（并附加输入框，附件一个参数 thecity）
     phone：手机
     vercode ：验证码
     password：密码
     vocation ：职务（员工，导游）
     返回数据：
     {
     "status": "00000",
     "msg": "成功"
     }

     */
    
    NSMutableDictionary *parement = [NSMutableDictionary dictionary];
    
    [parement setValue:self.phoneTextFiled.text forKey:@"phone"];
    
    [DLRequestSerVice POST:DL_consultGetCode param:parement success:^(id responseData) {
        
    } failure:^(NSError *error) {
        
    }];
    
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
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"验证码已发送，请注意查收" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    
//    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneTextFiled.text zone:@"86" customIdentifier:nil
//                                 result:^(NSError *error)
//     {
//         if (!error)
         
//         {
//         }
//     }];
    
//      UIAlertView* alert=[[UIAlertView alloc] initWithTitle:  NSLocalizedString(@"codesenderrtitle", nil)
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
//    [SMSSDK commitVerificationCode:self.passCodeTF.text phoneNumber:_phoneTextFiled.text zone:@"86" result:^(SMSSDKUserInfo *userInfo, NSError *error) {
//        
//        {
//            if (!error)
//            {
//                NSLog(@"验证成功");
//            }
//            else
//            {
//                NSLog(@"错误信息:%@",error);
//            }
//        }
//    }];
}

// 开启倒计时效果
-(void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间
    self.authCodeBtn.enabled = NO;
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
           self.authCodeBtn.enabled = YES;
            
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.authCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                
                [self.authCodeBtn setTitleColor:[UIColor colorWithHexString:@"  0xFB8557"] forState:UIControlStateNormal];
                
                self.authCodeBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.authCodeBtn setTitle:[NSString stringWithFormat:@"重发(%.2d)", seconds] forState:UIControlStateNormal];
//                [self.authCodeBtn setTitleColor:[UIColor colorWithHexString:@"0x979797"] forState:UIControlStateNormal];
                self.authCodeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}
#pragma mark  ------------------ 立即注册 ----------------------


/*
 
 if (self.areaID != nil && ![self.areaID isEqualToString:@""]) {
 if ([self.passwordTextField.text isEqualToString:self.passwordAgainTextField.text]) {
 //注册
 if ([SVProgressHUD isVisible] == NO) {
 [SVProgressHUD show];
 }
 
 [[Manager shareInstance] httpRegisterWithMobileNumber:self.mobileNumber withPassword:self.passwordTextField.text withUserType:@"2" withAreaId:self.areaID withRegisterSuccess:^(id successResult) {
 [SVProgressHUD dismiss];
 
 if ([successResult isEqualToString:@"注册成功"]) {
 AlertManager *alert = [AlertManager shareIntance];
 [alert showAlertViewWithTitle:nil withMessage:successResult actionTitleArr:@[@"确定"] withViewController:self withReturnCodeBlock:^(NSInteger actionBlockNumber) {
 [self dismissViewControllerAnimated:YES completion:nil];
 }];
 
 }
 
 
 } withRegisterFailResult:^(NSString *failResultStr) {
 [SVProgressHUD dismiss];
 AlertManager *alert = [AlertManager shareIntance];
 [alert showAlertViewWithTitle:nil withMessage:failResultStr actionTitleArr:@[@"确定"] withViewController:self withReturnCodeBlock:nil];
 
 }];
 
 }else {
 AlertManager *alert = [AlertManager shareIntance];
 [alert showAlertViewWithTitle:nil withMessage:@"两个密码输入的不一致" actionTitleArr:@[@"确定"] withViewController:self withReturnCodeBlock:nil];        }
 }else {
 AlertManager *alert = [AlertManager shareIntance];
 [alert showAlertViewWithTitle:nil withMessage:@"请您选择所在地区" actionTitleArr:@[@"确定"] withViewController:self withReturnCodeBlock:nil];
 }
 */








/**** 立即注册 ****/
- (IBAction)registerNowBtn:(id)sender {
    
    
    
//    if (self.areaID != nil && ![self.areaID isEqualToString:@""]) {
//        if ([self.passwordTextField.text isEqualToString:self.passwordAgainTextField.text]) {
//            //注册
//            if ([SVProgressHUD isVisible] == NO) {
//                [SVProgressHUD show];
//            }

    /**
     name：姓名
     province ： 城市 选择，1北京市，3天津市，4石家庄市，5唐山市，1其他（并附加输入框，附件一个参数 thecity）
     phone：手机
     vercode ：验证码
     password：密码
     vocation ：职务（员工，导游）
     返回数据：
     *nameTF;
    *  选择城市
    @property (weak, nonatomic) IBOutlet UIButton *changeCityBtn;
    ***  电话号码  ***
    @property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
    ***  验证码  ***
    @property (weak, nonatomic) IBOutlet UITextField *passCodeTF;
    ***  获取验证码  ***
    @property (weak, nonatomic) IBOutlet UIButton *authCodeBtn;
    ***  密码  ***
    @property (weak, nonatomic) IBOutlet UITextField *passwordTF;
    ***  确认密码  ***
    @property (weak, nonatomic) IBOutlet UITextField *determinePasswordTF;
    
     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     manager.requestSerializer = [AFJSONRequestSerializer serializer];
     NSDictionary *param = @{@"email":text2.text, @"pwd":text3.text, @"name":text1.text};
     NSString *url=@"http://oneexpress.duapp.com/api/save/user";
     
*/
            if(self.passCodeTF.text != nil && [self.passCodeTF.text isEqualToString:self.determinePasswordTF.text]){
             
                
                AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
                manager.requestSerializer = [AFJSONRequestSerializer serializer];
                
        NSDictionary *param = @{
                                @"name":self.nameTF.text,
                                @"province":self.changeCityBtn.titleLabel.text,
                                @"phone":self.phoneTextFiled.text,
                                @"vercode":self.passCodeTF.text,
                                @"vocation":self.positionTF.text
                                };
                
                [DLRequestSerVice POST:DL_ConsultRegister param: param success:^(id responseData) {
                    NSLog(@"注册成功!");
                } failure:^(NSError *error) {
                    
                }];
            }
    
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


#pragma mark  ----------DLCityPickerViewDelegate------------

-(void)customPickView:(DLCityPickerView *)customPickView selectedTitle:(NSString *)selectedTitle{
//    NSLog(@"选择%@",selectedTitle);
    
    if ([selectedTitle isEqualToString:@"其他"])  {
        
        [self.alertView showView];

    }

    self.changeCityBtn.titleLabel.text = selectedTitle;
    [self.changeCityBtn setTitle:selectedTitle forState:UIControlStateNormal];
}

-(void)requestEventAction:(UIButton *)button{
    
    [self.alertView closeView];
    
}

- (DLSalertView *)alertView
{
    if (!_alertView) {
        self.alertView = [[DLSalertView alloc] initWithFrame:CGRectMake(40, 200, [UIScreen mainScreen].bounds.size.width - 80, 220)];
        self.alertView.backgroundColor = [UIColor whiteColor];
        self.alertView.delegate = self;
    }
    return _alertView;
}


@end
