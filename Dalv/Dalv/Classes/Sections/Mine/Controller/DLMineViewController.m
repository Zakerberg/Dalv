//
//  DLMineViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//@"index.php/Api/login/agencyVerificationCode"

#import "DLMineViewController.h"
#import <MBProgressHUD.h>
#import "DLCityPickerView.h"
#import "DLSalertView.h"
#import "DLConsultModel.h"

@interface DLMineViewController ()<DLCityPickerViewDelegate,DLSalertViewDelegate,UITableViewDelegate,UITableViewDataSource>

/****  姓名  ****/
@property (weak,nonatomic) UITextField *nameTF;
/****  选择城市  ****/
@property (weak,nonatomic) UIButton *changeCityBtn;
/****  电话号码  ****/
@property (weak, nonatomic) UITextField *phoneTextFiled;
/****  验证码  ****/
@property (weak, nonatomic) UITextField *passCodeTF;
/****  获取验证码  ****/
@property (weak, nonatomic) UIButton *authCodeBtn;
/****  密码  ****/
@property (weak, nonatomic) UITextField *passwordTF;
/****  确认密码  ****/
@property (weak, nonatomic) UITextField *determinePasswordTF;
//****  输入的职位  ****/
@property (weak, nonatomic) UITextField *positionTF;
//****  立即注册  ****/
@property (strong, nonatomic)  UIButton *regsterNow;

@property(nonatomic,strong)UIView *headerView;

@property (nonatomic,strong) DLSalertView *alertView;
@property(nonatomic,strong)UITextField *firstField;
@property (nonatomic,strong) UITableView *tableView;
@end

static NSString *cellID  = @"cellID";

@implementation DLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupHeaderView];
}

-(void)setupUI {
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"旅游顾问注册";
    self.tableView.tableFooterView = [UIView new];
    [self setupRegisterBtn];
}


-(void)setupRegisterBtn {
    
   UIButton *regsterNow = [[UIButton alloc] initWithFrame:CGRectMake(20, 419, 670/2, 52)];
    self.regsterNow = regsterNow;
    regsterNow.backgroundColor = [UIColor colorWithHexString:@"4d65f3"];
    regsterNow.tintColor = [UIColor whiteColor];
    [regsterNow setTitle:@"立即注册" forState:UIControlStateNormal];
    
    regsterNow.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    regsterNow.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    regsterNow.layer.cornerRadius = 8.0;
    [regsterNow addTarget:self action:@selector(registerNowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_tableView addSubview:regsterNow];
    
}

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
        _tableView.backgroundColor = [UIColor whiteColor];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        [self.view addSubview:_tableView];
    }
    
    return _tableView ;
}

-(void)setupHeaderView{
    
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 34);
    self.headerView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    self.tableView.tableHeaderView = headerView;
    self.headerView = headerView;
    
}


/*****  选择城市   ****/

-(void)changeCityBtnClick:(UIButton *)sender {
    NSMutableArray *arrayData = [NSMutableArray arrayWithObjects:@"北京市",@"唐山市",@"天津市",@"石家庄市",@"其他", nil];
    
    DLCityPickerView *pickerSingle = [[DLCityPickerView alloc]init];
    
    [pickerSingle setDataArray:arrayData];
    [pickerSingle setDefalutSelectRowStr:arrayData[0]];
    [pickerSingle setDelegate:self];
    [pickerSingle show];
    [self.view endEditing:YES];

}

/*****  获取验证码  *****/
-(void)BtnClick:(id)sender {
    
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

                self.authCodeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}


#pragma mark  ------------------ 立即注册 ----------------------
-(void)registerNowBtn:(id)sender {
    if(self.passwordTF.text != nil && [self.passwordTF.text isEqualToString:self.determinePasswordTF.text]){
        
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        NSString *CityStr = @"1";
        if ([self.changeCityBtn.titleLabel.text isEqualToString:@"天津市"]) {
            CityStr = @"3";
        } else if ([self.changeCityBtn.titleLabel.text isEqualToString:@"石家庄市"]){
            
            CityStr = @"4";
        }else if ([self.changeCityBtn.titleLabel.text isEqualToString:@"唐山市"]){
            
            CityStr = @"5";
        }
        /*
         
         name：姓名
         province ： 城市 选择，1北京市，3天津市，4石家庄市，5唐山市，1其他（并附加输入框，附件一个参数 thecity）
         phone：手机
         vercode ：验证码
         password：密码
         vocation ：职务（员工，导游）
         
         */
        
        NSDictionary *param = @{
                                @"name":self.nameTF.text,
                                @"province":CityStr,
                                @"phone":self.phoneTextFiled.text,
                                @"vercode":self.passCodeTF.text,
                                @"password":self.passwordTF.text,
                                @"vocation":self.positionTF.text
                                };
        
        
        NSDictionary *param2 = @{
                                 @"name":self.nameTF.text,
                                 @"province":CityStr,
                                 @"phone":self.phoneTextFiled.text,
                                 @"vercode":self.passCodeTF.text,
                                 @"password":self.passwordTF.text,
                                 @"vocation":self.positionTF.text,
                                 @"thecity":self.firstField.text
                                 };
        
        if (self.nameTF.text && self.passCodeTF.text && self.passwordTF.text == nil) {
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入手机号" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }
        if ([self.changeCityBtn.titleLabel.text isEqualToString:@"其他"]){
            
            [DLRequestSerVice POST:DL_ConsultRegister param: param2 success:^(id responseData) {
                
                //NSLog(@"注册成功!");
                [self.navigationController popViewControllerAnimated:YES];
                UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功,快去登录吧" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [successV show];
                
            } failure:^(NSError *error) {
                // 在此写提示框
                UIAlertView *failureV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册失败,请联系客服" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [failureV show];
                
            }];
            
        } else {
            
            [DLRequestSerVice POST:DL_ConsultRegister param: param success:^(id responseData) {
                
                //NSLog(@"注册成功!");
                [self.navigationController popViewControllerAnimated:YES];
                
                UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功,快去登录吧" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [successV show];
                
            } failure:^(NSError *error) {
                // 在此写提示框
                UIAlertView *failureV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册失败,请联系客服" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                [failureV show];
            }];
            
        }
        
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


-(void)showHint:(NSString *)hint{
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


#pragma mark  ----------UITable View Delegate------------

//选中某一行cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        
    }
    
    if (indexPath.row == 1) {
        
    }
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 52;
}

//头部视图的间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}


#pragma mark ------------  Table view data source --------------
#pragma mark ------------  代码没封装,后期再处理   -----------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        UITextField *nameTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 34, MAIN_SCREEN_WIDTH, 52)];
        self.nameTF = nameTF;
        nameTF.placeholder = @"输入名字";
        [tableView addSubview:nameTF];
    }
    
    if (indexPath.row == 1) {
        
        UIButton *changeCityBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 86, MAIN_SCREEN_WIDTH, 52)];
        self.changeCityBtn = changeCityBtn;
        changeCityBtn.tintColor = [UIColor blackColor];
        [changeCityBtn setTitle:@"输入城市" forState:UIControlStateNormal];
        changeCityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [changeCityBtn addTarget:self action:@selector(changeCityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tableView addSubview:changeCityBtn];
    }
    
    if (indexPath.row == 2) {

        UITextField *phoneTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(20, 138, MAIN_SCREEN_WIDTH, 52)];
        self.phoneTextFiled = phoneTextFiled;
        phoneTextFiled.placeholder = @"输入手机号";
        phoneTextFiled.keyboardType = UIKeyboardTypeNumberPad;
        [tableView addSubview:phoneTextFiled];
        
        UIButton *authCodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(245, 138, 90, 32)];
        [authCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        authCodeBtn.tintColor = [UIColor colorWithHexString:@"4d65f3"];
        [authCodeBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventValueChanged];
        authCodeBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        authCodeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_tableView addSubview:authCodeBtn];
    }
    
    
    if (indexPath.row == 3) {
        UITextField *passCodeTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 190, MAIN_SCREEN_WIDTH, 52)];
        self.passCodeTF = passCodeTF;
        passCodeTF.placeholder = @"输入手机验证码";
        passCodeTF.keyboardType = UIKeyboardTypeNumberPad;
        [tableView addSubview:passCodeTF];
    }
    
    if (indexPath.row == 4) {
        UITextField *passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 242, MAIN_SCREEN_WIDTH, 52)];
        self.passwordTF = passwordTF;
        passwordTF.placeholder = @"输入密码";
        [tableView addSubview:passwordTF];
    }
    
    
    if (indexPath.row == 5) {
        UITextField *determinePasswordTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 294, MAIN_SCREEN_WIDTH, 52)];
        self.determinePasswordTF = determinePasswordTF;
        determinePasswordTF.placeholder = @"确认密码";
        [tableView addSubview:determinePasswordTF];
    }
    
    if (indexPath.row == 6) {
        UITextField *positionTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 346, MAIN_SCREEN_WIDTH, 52)];
        self.positionTF = positionTF;
        positionTF.placeholder = @"职务 如: 领导、导游、职员等";
        [tableView addSubview:positionTF];
    }
    
    if (indexPath.row == 1) {
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else{
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}


#pragma mark  ----------DLCityPickerViewDelegate------------

-(void)customPickView:(DLCityPickerView *)customPickView selectedTitle:(NSString *)selectedTitle{
    
    if ([selectedTitle isEqualToString:@"其他"])  {
        
        [self.alertView showView];

    }

    self.changeCityBtn.titleLabel.text = selectedTitle;
    [self.changeCityBtn setTitle:selectedTitle forState:UIControlStateNormal];
}

-(void)requestEventAction:(UIButton *)button{
    
    [self.alertView closeView];
}

 
#pragma mark  ----------DLSalertViewDelegate------------

- (DLSalertView *)alertView{
    if (!_alertView) {
        self.alertView = [[DLSalertView alloc] initWithFrame:CGRectMake(40, 200, [UIScreen mainScreen].bounds.size.width - 80, 220)];
        self.firstField = self.alertView.firstField;
        self.alertView.backgroundColor = [UIColor whiteColor];
        self.alertView.delegate = self;
    }
    return _alertView;
}

@end
