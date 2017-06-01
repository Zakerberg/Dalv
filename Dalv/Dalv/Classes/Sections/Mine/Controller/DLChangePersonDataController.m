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
@property (assign,nonatomic) UITableViewCell* cell;

@end

@implementation DLChangePersonDataController

-(NSArray*)cellTiltleArr
{
    if (!_cellTiltleArr) {
        
        _cellTiltleArr = @[@"姓名",@"年龄",@"性别",@"从业时间",@"手机号",@"邮箱",@"",@"修改密码"];
    }
    
    return _cellTiltleArr ;
}

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO ;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
        [self.view  addSubview: _tableView];
    }
    
    return _tableView ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.hidden = NO;
    self.title = @"修改个人资料";
    [self setupUI];
}

-(void)setupUI{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(completeClick)];
    
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
    
    // ---- ----- --- -- - -- - -- - -- -- - -- - - -- - - - -
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTiltleArr.count ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell*  cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    }
    
    cell.textLabel.text = self.cellTiltleArr[indexPath.row];
    
    return cell ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath ;
    self.cell = [self.tableView cellForRowAtIndexPath:self.selectedIndexPath] ;
    
    /**  姓名 **/
    if (indexPath.row == 0) {
        
        __weak typeof(self) weakSelf = self;
        ZYInputAlertView *alertView = [ZYInputAlertView alertView];
        alertView.placeholder = @"输入您的姓名";
        [alertView confirmBtnClickBlock:^(NSString *inputString) {
            weakSelf.cell.detailTextLabel.text = inputString;
        }];
        [alertView show];
    }
    
    /**  年龄 **/
    if (indexPath.row == 1) {
        
        __weak typeof(self) weakSelf = self;
        ZYInputAlertView *alertView = [ZYInputAlertView alertView];
        alertView.placeholder = @"输入您的年龄";
        [alertView confirmBtnClickBlock:^(NSString *inputString) {
            weakSelf.cell.detailTextLabel.text = inputString;
        }];
        [alertView show];
    }
    
    /**  性别 **/
    if (indexPath.row == 2) {
        
        JHPickView *picker = [[JHPickView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        picker.arrayType = GenderArray;
        [self.view addSubview:picker];
    }
    
    /**  从业时间 **/
    if (indexPath.row == 3) {
        
        JHPickView *picker = [[JHPickView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        picker.arrayType = WorkTimeArray;
        [self.view addSubview:picker];
    }
    
    /**  手机号 **/
    if (indexPath.row == 4) {
        
        __weak typeof(self) weakSelf = self;
        ZYInputAlertView *alertView = [ZYInputAlertView alertView];
        alertView.placeholder = @"输入您的手机号";
        [alertView confirmBtnClickBlock:^(NSString *inputString) {
            
            if ([self isValidateMobile:inputString]) {
                weakSelf.cell.detailTextLabel.text = inputString;
            } else {
                
                UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您输入的号码有误,请重新输入" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
                
                [alertPhoneNum show];
            }
        }];
        
        [alertView show];
    }
    
    /**  邮箱 **/
    if (indexPath.row == 5) {
        
        __weak typeof(self) weakSelf = self;
        ZYInputAlertView *alertView = [ZYInputAlertView alertView];
        alertView.placeholder = @"输入您的邮箱";
        [alertView confirmBtnClickBlock:^(NSString *inputString) {
            
            if ([self isValidateEmail:inputString]) {
                weakSelf.cell.detailTextLabel.text = inputString;
            } else {
                
                UIAlertView *alertPhoneNum=[[UIAlertView alloc] initWithTitle:@"大旅游提示您" message:@"您输入的邮箱有误,请重新输入" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
                [alertPhoneNum show];
            }
        }];
        
        [alertView show];
    }
    
    /**  修改密码 **/
    if (indexPath.row == 7) {
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
