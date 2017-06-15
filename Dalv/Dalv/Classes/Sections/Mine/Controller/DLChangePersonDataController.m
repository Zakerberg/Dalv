//
//  DLChangePersonDataController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  -----------------   修改个人资料   -----------------

#import "DLChangePersonDataController.h"
#import "JHPickView.h"
#import "DLCityPickerView.h"
#import "DLChangePasswordController.h"
#import "ZYInputAlertView.h"
#import "DLHomeViewTask.h"

static NSString* cellID = @"cellID";
@interface DLChangePersonDataController ()<UITableViewDelegate,UITableViewDataSource,DLCityPickerViewDelegate,JHPickerDelegate,UITextViewDelegate>
@property (strong,nonatomic) UITableView* tableView ;
@property (strong,nonatomic) NSArray* cellTiltleArr ;
@property (assign,nonatomic) NSIndexPath* selectedIndexPath ;
@property (weak,nonatomic) UITableViewCell* cell;
/**** 昵称  ****/
@property (weak, nonatomic) UITextField *nickNameTF;
/**** 标签  ****/
@property (weak, nonatomic) UITextField *noteLabelTF;
/**** 邮箱  ****/
@property (weak, nonatomic) UITextField *mailTF;
/**** 年龄  ****/
@property (weak, nonatomic) UITextField *ageTF;
/**** 去过的城市textView  *****/
@property (weak, nonatomic) UITextView *goCityView;

@end

@implementation DLChangePersonDataController

-(NSArray*)cellTiltleArr
{
    if (!_cellTiltleArr) {
        
        _cellTiltleArr = @[@"姓名:", @"昵称:",@"性别:",@"年龄:",@"从业时间:",@"标签:",@"手机号:",@"邮箱:",@" ",];
    }
    
    return _cellTiltleArr ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.hidden = NO;
    self.title = @"修改个人资料";
    [self setupUI];
    [self setupTableView];
    [self fetchData];
}


-(void)fetchData {
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    [DLHomeViewTask getAgencyEditPass:param completion:^(id result, NSError *error) {
        
    }];
}


-(void)setupTableView {
    
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT) style:UITableViewStylePlain];
//        _tableView.showsVerticalScrollIndicator = NO ;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:_tableView];
}


-(void)setupUI{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(completeClick)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithHexString:@"4d65f3"];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

//手机号码的正则表达式
- (BOOL)isValidateMobile:(NSString *)mobile{
    //手机号以13、15、18开头，八个\d数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//邮箱地址的正则表达式
- (BOOL)isValidateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

/***  保存  ***/
-(void)completeClick {
  
    
//    NSDictionary *param = @{
//                            @"uid":[DLUtils getUid],
//                            @"sign_token" : [DLUtils getSign_token],
//                                @"nick_name":
//                                @"email":
//                                @"sex":
//                                @"age":
//                                @"working_time":
//                                @"personal_label":
//                                @"been_where":
//                                
//                                };
    
    
    /*
     uid：用户id
     sign_token：验证身份token
     nick_name：用户名
     email：邮箱
     sex：性别（0保密，1男，2女）
     age：年龄（20）
     working_time：工作时间（10）
     personal_label：标签（博士，硕士，研究生）用逗号隔开
     been
     */
    
    
    
}


#pragma mark - -------------- JHPickerDelegate -------------------

-(void)PickerSelectorIndixString:(NSString *)str
{
    
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:self.selectedIndexPath] ;
    cell.detailTextLabel.text = str ;
    
}


-(NSDateComponents*)getDateComponentsFromDate:(NSDate*)date{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Beijing"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit =  NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitWeekday |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    
    return theComponents ;
    
}




#pragma mark ---------  UITextViewDelegate  -------------

-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"描述你去过的地方"]) {
        textView.text = @"";
        textView.textColor = [UIColor colorWithHexString:@"b6b6b6"];
    }
}


-(void)textViewDidEndEditing:(UITextView *)textView{
    
    if (textView.text == nil) {
        textView.textColor = [UIColor blackColor];
    }
}



#pragma mark --------- UITable View Delegate -------------

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    if (section == 0) {
        return 0.1;
    }
    return 15;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 8) {
        return 88;
    }
    
    return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
    return self.cellTiltleArr.count;
        
    }
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell*  cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    }
    
    cell.textLabel.text = self.cellTiltleArr[indexPath.row];
   
    if (indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    /*  年龄 */
    if (indexPath.row == 3) {
        UITextField *ageTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 132, MAIN_SCREEN_WIDTH-30, 44)];
        self.ageTF = ageTF;
        ageTF.textAlignment = NSTextAlignmentRight;
        ageTF.keyboardType = UIKeyboardTypeNumberPad;
        ageTF.textColor = [UIColor colorWithHexString:@"6b6b6b"];
        [tableView addSubview:ageTF];
    }
    /* 昵称 */
    if (indexPath.row == 1) {
        UITextField *nickNameTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 44, MAIN_SCREEN_WIDTH-15, 44)];
        self.nickNameTF = nickNameTF;
        nickNameTF.placeholder = @"请输入您的昵称";
        nickNameTF.textColor = [UIColor colorWithHexString:@"6b6b6b"];
        nickNameTF.textAlignment = NSTextAlignmentRight;
        [tableView addSubview:nickNameTF];
    }
    /* 标签 */
    if (indexPath.row == 5) {
        
        UITextField *noteLabelTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 220, MAIN_SCREEN_WIDTH-15, 44)];
        self.noteLabelTF = noteLabelTF;
        noteLabelTF.textColor = [UIColor colorWithHexString:@"6b6b6b"];
        noteLabelTF.placeholder = @"填写限5个,用逗号隔开";
        noteLabelTF.textAlignment = NSTextAlignmentRight;
        [tableView addSubview:noteLabelTF];
    }
    /* 邮箱 */
    if (indexPath.row == 7) {

        UITextField *mailTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 220+88, MAIN_SCREEN_WIDTH-15, 44)];
        self.mailTF = mailTF;
        mailTF.textColor = [UIColor colorWithHexString:@"6b6b6b"];
        mailTF.placeholder = @"填写您的邮箱";
        mailTF.textAlignment = NSTextAlignmentRight;
#pragma mark ------------  少判断合法.后期处理---------
        [tableView addSubview:mailTF];
    }
    
    /*  我去过的城市  */
    if (indexPath.row == 8) {
        UILabel *goCityLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 44*8+10, 173/2, 15)];
        goCityLabel.text = @"我去过的城市:";
        [goCityLabel sizeToFit];
        [tableView addSubview:goCityLabel];
    
        
        UITextView *goCityView = [[UITextView alloc] initWithFrame:CGRectMake(40+173/2, 44*8+3, 520/2-15, 176/2-5)];
        
        self.goCityView = goCityView;
        goCityView.font = [UIFont systemFontOfSize:15];
        goCityView.delegate = self;
        goCityView.textColor = [UIColor colorWithHexString:@"#6b6b6b"];
        goCityView.text = @"描述你去过的地方";
        [tableView addSubview:goCityView];
        
    }
    
    if (indexPath.section == 1) {
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"修改密码";
    }
    return cell ;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath ;
    self.cell = [self.tableView cellForRowAtIndexPath:self.selectedIndexPath] ;
    
    /**  性别 **/
    if (indexPath.row == 2) {
        
        JHPickView *picker = [[JHPickView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        picker.arrayType = GenderArray;
        [self.view addSubview:picker];
    }
    
    /**  年龄 **/
    if (indexPath.row == 3) {
        
    }
    
    /**  从业时间 **/
    if (indexPath.row == 4) {
        
        JHPickView *picker = [[JHPickView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        picker.arrayType = WorkTimeArray;
        [self.view addSubview:picker];

    }
    
    /**  标签 **/
    if (indexPath.row == 5) {
        
    
    }
    
    
    /** 邮箱  **/
    if (indexPath.row == 7) {
        
        //        __weak typeof(self) weakSelf = self;
        //        ZYInputAlertView *alertView = [ZYInputAlertView alertView];
        //        alertView.placeholder = @"输入您的邮箱";
        //        [alertView confirmBtnClickBlock:^(NSString *inputString) {
        //
        //            if ([self isValidateEmail:inputString]) {
        //                weakSelf.cell.detailTextLabel.text = inputString;
        //            } else {
        //
        //                UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您输入的邮箱有误,请重新输入" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        //                [alertPhoneNum show];
        //            }
        //        }];
        //        
        //        [alertView show];

    }
    /**  我去过的地方  **/
//    if (indexPath.row == 8) {
//        
//    }
//    
    


    /*** 修改密码 ***/
    if (indexPath.section == 1) {
        
        DLChangePasswordController * changePwdVC = [[DLChangePasswordController alloc] init];
        [self.navigationController pushViewController:changePwdVC animated:YES];
    }

}


#pragma mark ------------  DLCityPickerViewDelegate ---------------

-(void)customPickView:(DLCityPickerView *)customPickView selectedTitle:(NSString *)selectedTitle{
    NSLog(@"选择%@",selectedTitle);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
