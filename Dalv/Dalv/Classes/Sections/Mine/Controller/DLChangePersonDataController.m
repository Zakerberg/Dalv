//
//  DLChangePersonDataController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLChangePersonDataController.h"
#import "JHPickView.h"
#import "DLCityPickerView.h"
#import "DLChangePasswordController.h"
#import "ZYInputAlertView.h"
static NSString* cellID = @"cellID";
@interface DLChangePersonDataController ()<UITableViewDelegate,UITableViewDataSource,DLCityPickerViewDelegate,JHPickerDelegate>
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
@end

@implementation DLChangePersonDataController

-(NSArray*)cellTiltleArr
{
    if (!_cellTiltleArr) {
        
        _cellTiltleArr = @[@"姓名:", @"昵称:",@"性别:",@"年龄:",@"从业时间:",@"标签:",@"手机号:",@"邮箱:",@"我去过的地方:",];
    }
    
    
    return _cellTiltleArr ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.hidden = NO;
    self.title = @"修改个人资料";
    [self setupUI];
    [self setupTableView];
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

/***  完成  ***/
-(void)completeClick {
    
    // ---- --------------------- - -- - - -- - - - -
    
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

#pragma mark -------------- UITable View Delegate ------------------

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
        ageTF.textAlignment = NSTextAlignmentRight;
        ageTF.keyboardType = UIKeyboardTypeNumberPad;
        self.ageTF = ageTF;
        [tableView addSubview:ageTF];
    }
    /* 昵称 */
    if (indexPath.row == 1) {
        UITextField *nickNameTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 44, MAIN_SCREEN_WIDTH-15, 44)];
        self.nickNameTF = nickNameTF;
        nickNameTF.placeholder = @"请输入您的昵称 ";
        nickNameTF.textAlignment = NSTextAlignmentRight;
        [tableView addSubview:nickNameTF];
    }
    /* 标签 */
    if (indexPath.row == 5) {
        
        UITextField *noteLabelTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 220, MAIN_SCREEN_WIDTH-15, 44)];
        self.noteLabelTF = noteLabelTF;
        noteLabelTF.placeholder = @"填写限5个,用逗号隔开 ";
        noteLabelTF.textAlignment = NSTextAlignmentRight;
        [tableView addSubview:noteLabelTF];
    }
    /* 邮箱 */
    if (indexPath.row == 7) {

        UITextField *mailTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 220+88, MAIN_SCREEN_WIDTH-15, 44)];
        self.mailTF = mailTF;
        mailTF.placeholder = @"填写您的邮箱 ";
        mailTF.textAlignment = NSTextAlignmentRight;
        [tableView addSubview:mailTF];
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
    if (indexPath.row == 8) {
        
    }
    
    


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
