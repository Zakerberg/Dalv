//
//  DLMineViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//--------------------- 顾问注册 ----------------------

#import "DLMineViewController.h"
#import "DLCityPickerView.h"
#import "DLConsultModel.h"
#import "DLMineViewCell.h"
#import "DLSalertView.h"

@interface DLMineViewController ()<DLCityPickerViewDelegate,DLSalertViewDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (weak,nonatomic) UITextField *nameTF;/// 姓名
@property (weak,nonatomic) UIButton *changeCityBtn;/// 选择城市
@property (weak, nonatomic) UITextField *phoneTextFiled;/// 电话号码
@property (weak, nonatomic) UITextField *passCodeTF;/// 验证码
@property (weak, nonatomic) UIButton *authCodeBtn;/// 获取验证码
@property (weak, nonatomic) UITextField *passwordTF;/// 密码
@property (weak, nonatomic) UITextField *determinePasswordTF;/// 确认密码
@property (weak, nonatomic) UITextField *positionTF;/// 输入的职位
@property (strong, nonatomic)  UIButton *regsterNow;/// 立即注册
@property(nonatomic,weak) UIView *headerView;
@property(nonatomic,weak) UITableViewCell *cell;/// cell
@property (nonatomic,strong) DLSalertView *alertView;
@property(nonatomic,strong)UITextField *firstField;
@property (nonatomic,strong) UITableView *tableView;
@end

static NSString *cellID  = @"cellID";
static NSString *cell1ID = @"cell1id";

@implementation DLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setTableView];
    [self setupRegisterBtn];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setupUI {
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"旅游顾问注册";
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark ----------- setupRegisterBtn
-(void)setupRegisterBtn {
    
    UIButton *regsterNow = [[UIButton alloc] init];//WithFrame:CGRectMake(20, 419, 670/2, 52)];
    self.regsterNow = regsterNow;
    regsterNow.backgroundColor = [UIColor colorWithHexString:@"#4d65f3"];
    regsterNow.tintColor = [UIColor whiteColor];
    [regsterNow setTitle:@"立即注册" forState:UIControlStateNormal];
    
    regsterNow.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    regsterNow.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    regsterNow.layer.cornerRadius = 8.0;
    [regsterNow addTarget:self action:@selector(registerNowBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tableView addSubview:regsterNow];
    
    [regsterNow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@419);
        make.left.equalTo(@20);
        make.height.equalTo(@52);
        make.width.offset(MAIN_SCREEN_WIDTH- 30);
    }];
}

#pragma mark ------  setTableView
-(void)setTableView{
    {
        UITableView *tableView = [[UITableView alloc]init];
        self.tableView = tableView;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self ;
        tableView.dataSource = self ;
        tableView.backgroundColor = [UIColor whiteColor];
        
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        [tableView registerClass:[DLMineViewCell class] forCellReuseIdentifier:cell1ID];
        
        [self.view addSubview:tableView];
        
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }
}
-(void)setupHeaderView{
    
    UIView *headerView = [[UIView alloc] init];
    self.headerView.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = headerView;
    self.headerView = headerView;
    
    [self.view addSubview:headerView];
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.width.offset(0);
        make.width.offset(34);
    }];
}

#warning 此处后期要处理
/// 选择城市
-(void)changeCityBtnClick:(UIButton *)sender {
    NSMutableArray *arrayData = [NSMutableArray arrayWithObjects:@"北京市",@"唐山市",@"天津市",@"石家庄市",@"其他", nil];
    
    DLCityPickerView *pickerSingle = [[DLCityPickerView alloc]init];
    
    [pickerSingle setDataArray:arrayData];
    [pickerSingle setDefalutSelectRowStr:arrayData[0]];
    [pickerSingle setDelegate:self];
    [pickerSingle show];
    [self.view endEditing:YES];
}

/// 获取验证码
-(void)BtnClick:(id)sender {
    
    NSMutableDictionary *parement = [NSMutableDictionary dictionary];
    [parement setValue:self.phoneTextFiled.text forKey:@"phone"];
    [DLRequestSerVice POST:DL_consultGetCode param:parement success:^(id responseData) {
        
        if ([responseData[@"status"] isEqualToString:@"00020"]) {
            
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"用户已经存在,快去登录吧!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            [self.navigationController popViewControllerAnimated:YES];
            
        } else {
            
            /// 判断手机号的正则表达式
            NSString *regexPhoneNum = @"^1[3|4|5|7|8][0-9]\\d{8}$";
            NSPredicate *predPhoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexPhoneNum];
            BOOL isMatchPhoneNum = [predPhoneNum evaluateWithObject:self.phoneTextFiled.text];
            if (!isMatchPhoneNum){
                
                /// 手机号码不匹配
                UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您输入的号码有误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
                
                [alertPhoneNum show];
            }
            if ([self.phoneTextFiled.text isEqualToString:@""]) {
                [self showHint:@"手机号码不能为空"];
            }
            if(isMatchPhoneNum){
                
                [self openCountdown];
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"验证码已发送，请注意查收" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            }
        }
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark ----------  开启倒计时效果
-(void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间
    self.authCodeBtn.enabled = NO;
    self.authCodeBtn.backgroundColor = kColor(153, 153, 153, 1);/// 背景变灰色
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            //按钮可以点击
            self.authCodeBtn.enabled = YES;
            self.authCodeBtn.backgroundColor = [UIColor colorWithHexString:@"#4d65f3"];
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.authCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                
                [self.authCodeBtn setTitleColor:[UIColor colorWithHexString:@"  ffffff"] forState:UIControlStateNormal];
                
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

#pragma mark  ------------------ 立即注册
-(void)registerNowBtn:(id)sender {
    
    if(self.passwordTF.text != nil && [self.passwordTF.text isEqualToString:self.determinePasswordTF.text] && self.nameTF != nil && self.phoneTextFiled.text != nil && self.passCodeTF != nil){
        
        NSString *CityStr = @"1";
        
        if ([self.changeCityBtn.titleLabel.text isEqualToString:@"天津市"]) {
            CityStr = @"3";
            
        } else if ([self.changeCityBtn.titleLabel.text isEqualToString:@"石家庄市"]){
            
            CityStr = @"4";
        }else if ([self.changeCityBtn.titleLabel.text isEqualToString:@"唐山市"]){
            
            CityStr = @"5";
            
        }else {
            
        }
        /*
         name：姓名
         province ： 城市 选择，1北京市，3天津市，4石家庄市，5唐山市，1其他（并附加输入框，附件一个参数 thecity）
         phone：手机
         vercode ：验证码
         password：密码
         vocation ：职务（员工，导游）
         
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
         
         */
        
        if ([self.nameTF.text isEqualToString :@""]) {
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入名字" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }else if ([self.changeCityBtn.titleLabel.text isEqualToString:@""]){
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入城市" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }else if ([self.phoneTextFiled.text isEqualToString:@""]){
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入手机号" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }else if ([self.passwordTF.text isEqualToString:@""]){
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入密码" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }else if ([self.passCodeTF.text isEqualToString:@""]){
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入验证码" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }else if ([self.determinePasswordTF.text isEqualToString:@""]){
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入确认密码" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }else if (![self.passwordTF.text isEqualToString:self.determinePasswordTF.text]){
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"两次密码不一致" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }else if(self.passwordTF.text.length < 6){
            
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码要大于6位" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertV show];
            
        }else {
            
            if ([self.changeCityBtn.titleLabel.text isEqualToString:@"其他"]){
                
                NSDictionary *param2 = @{
                                         @"name":self.nameTF.text,
                                         @"province":CityStr,
                                         @"phone":self.phoneTextFiled.text,
                                         @"vercode":self.passCodeTF.text,
                                         @"password":self.passwordTF.text,
                                         @"vocation":self.positionTF.text,
                                         @"thecity":self.firstField.text
                                         };
                
                [DLRequestSerVice POST:DL_ConsultRegister param: param2 success:^(id responseData) {
                    
                    if ([responseData[@"status"] isEqualToString:@"00018"]) {
                        
                        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"验证码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [alert show];
                        
                    }else if ([responseData[@"status"] isEqualToString: @"00020"]){
                        
                        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"用户已经存在,快去登录吧!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [alert show];
                        [self.navigationController popViewControllerAnimated:YES];
                        
                    }else{
                        
                        NSLog(@"注册成功!");
                        [self.navigationController popViewControllerAnimated:YES];
                        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功,快去登录吧" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                        [successV show];
                    }
                } failure:^(NSError *error) {
                    // 在此写提示框
                    UIAlertView *failureV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册失败,请联系客服" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                    [failureV show];
                    
                }];
                
            } else {
                
                NSDictionary *param = @{
                                        @"name":self.nameTF.text,
                                        @"province":CityStr,
                                        @"phone":self.phoneTextFiled.text,
                                        @"vercode":self.passCodeTF.text,
                                        @"password":self.passwordTF.text,
                                        @"vocation":self.positionTF.text
                                        };
                
                [DLRequestSerVice POST:DL_ConsultRegister param: param success:^(id responseData) {
                    
                    if ([responseData[@"status"] isEqualToString:@"00018"]) {
                        
                        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"验证码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [alert show];
                        
                    }else if ([responseData[@"status"] isEqualToString: @"00020"]){
                        
                        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"用户已经存在,快去登录吧!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [alert show];
                        [self.navigationController popViewControllerAnimated:YES];
                        
                    }else{
                        
                        //NSLog(@"注册成功!");
                        [self.navigationController popViewControllerAnimated:YES];
                        UIAlertView *successV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功,快去登录吧" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                        [successV show];
                    }
                    
                } failure:^(NSError *error) {
                    
                    // 在此写提示框
                    UIAlertView *failureV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册失败,请联系客服" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
                    [failureV show];
                    
                }];
            }
        }
    }
}

-(void)showHint:(NSString *)hint{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    //hud.label.text = hint;
    hud.labelText = hint;
    
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

-(BOOL)isNumberOrLetter:(NSString *)num {
    
    NSString *numberOrLetter = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:numberOrLetter] invertedSet];
    NSString *filtered = [[num componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    BOOL basic = [num isEqualToString:filtered];
    
    return basic;
}

#pragma mark  ---- UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 52;
}

//头部视图的间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 32;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 1) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.cell = cell;
        cell.textLabel.text = @" 输入城市";
        cell.textColor = [UIColor colorWithHexString:@"b4b4b4"];
        
        UIButton *changeCityBtn = [[UIButton alloc] init];
        
        self.changeCityBtn = changeCityBtn;
        self.changeCityBtn.tintColor = [UIColor blackColor];
        self.changeCityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [self.changeCityBtn addTarget:self action:@selector(changeCityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [tableView addSubview:changeCityBtn];
        
        [changeCityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@68);
            make.height.offset(52);
            make.width.offset(MAIN_SCREEN_WIDTH);
            make.left.equalTo(@20);
        }];
        
        return cell;
    }
    
    DLMineViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1ID];
    self.nameTF = cell.TF;
    
    if (indexPath.row == 0) {
        self.nameTF = cell.TF;
        cell.TF.placeholder = @"输入姓名";
        
    }else if (indexPath.row == 2){
        self.phoneTextFiled = cell.TF;
        cell.TF.placeholder = @"输入手机号";
        cell.TF.keyboardType = UIKeyboardTypeNumberPad;
        UIButton *authCodeBtn = [[UIButton alloc] init];
        
        self.authCodeBtn = authCodeBtn;
        [self.authCodeBtn setBackgroundColor:[UIColor colorWithHexString:@"#4d65f3"]];
        self.authCodeBtn.layer.cornerRadius = 8.0;
        [self.authCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.authCodeBtn.tintColor = [UIColor colorWithHexString:@"4d65f3"];
        [self.authCodeBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.authCodeBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.authCodeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [cell.contentView addSubview:authCodeBtn];
        
        [authCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@5);
            make.right.equalTo(@-15);
            make.height.offset(40);
            make.width.offset(100);
        }];
        
    }else if (indexPath.row == 3){
        self.passCodeTF = cell.TF;
        cell.TF.keyboardType = UIKeyboardTypeNumberPad;
        cell.TF.placeholder = @"输入手机验证码";
        
    }else if (indexPath.row == 4){
        self.passwordTF = cell.TF;
        cell.TF.placeholder = @"输入密码";
        
    }else if (indexPath.row == 5){
        self.determinePasswordTF = cell.TF;
        cell.TF.placeholder = @"确认密码";
        
    }else if (indexPath.row == 6){
        
        self.positionTF = cell.TF;
        cell.TF.placeholder = @"输入职务(如导游等)";
    }
    
    return cell;
}

#pragma mark  ---------- DLCityPickerViewDelegate

-(void)customPickView:(DLCityPickerView *)customPickView selectedTitle:(NSString *)selectedTitle{
    
    if ([selectedTitle isEqualToString:@"其他"])  {
        
        [self.alertView showView];
    }
    self.cell.textLabel.text = selectedTitle;
    self.changeCityBtn.titleLabel.text = selectedTitle;
    self.cell.textLabel.textColor = [UIColor blackColor];
}

-(void)requestEventAction:(UIButton *)button{
    
    [self.alertView closeView];
}

#pragma mark  ---------- DLSalertViewDelegate

- (DLSalertView *)alertView{
    if (!_alertView) {
        self.alertView = [[DLSalertView alloc] initWithFrame:CGRectMake(40, 200, [UIScreen mainScreen].bounds.size.width - 80, 220)];
        self.firstField = self.alertView.firstField;
        self.alertView.backgroundColor = [UIColor whiteColor];
        self.alertView.delegate = self;
        self.firstField.text = self.alertView.firstField.text;
    }
    return _alertView;
}

#pragma mark  ---------- UITextViewDelegate

//UITextField代理方法，是否允许输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string
{
    NSInteger existedLength = textField.text.length;
    NSInteger selectedLength = range.length;
    NSInteger replaceLength = string.length;
    
    if (textField == self.passwordTF){
        if (![self isNumberOrLetter:string]){
            [SVProgressHUD showInfoWithStatus:@"密码只能为数字或字母"];
            return NO;
        }
    }
    if (existedLength - selectedLength + replaceLength > 6) {
        [textField.undoManager removeAllActions];
        
        [SVProgressHUD showInfoWithStatus:@"密码要大于6位"];
    }
    return YES;
}
@end
