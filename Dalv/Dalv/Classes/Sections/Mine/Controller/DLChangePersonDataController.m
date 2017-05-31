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
#define MAIN_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define MAIN_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface DLChangePersonDataController ()<UITableViewDelegate,UITableViewDataSource,DLCityPickerViewDelegate,JHPickerDelegate>
@property (strong,nonatomic) UITableView* tableView ;
@property (strong,nonatomic) NSArray* cellTiltleArr ;
@property (assign,nonatomic) NSIndexPath* selectedIndexPath ;

@end

@implementation DLChangePersonDataController

-(NSArray*)cellTiltleArr
{
    if (!_cellTiltleArr) {
        
        _cellTiltleArr = @[@"姓名",@"年龄",@"性别",@"从业时间",@"手机号",@"邮箱",@"修改密码"];
    }
    
    return _cellTiltleArr ;
}

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO ;
        _tableView.delegate = self ;
        _tableView.dataSource = self ;
        [self.view  addSubview: _tableView];
    }
    
    return _tableView ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.hidden = NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath ;
    
    /**  姓名 **/
    if (indexPath.row == 0) {
        UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:self.selectedIndexPath] ;
        cell.detailTextLabel.text = @"88888 ";
        
    }
    /**  年龄 **/
    if (indexPath.row == 1) {
        
        
        
        /*
       
        
            
            NSMutableArray *arrayData = [NSMutableArray arrayWithObjects:@"北京市",@"唐山市",@"天津市",@"石家庄市",@"其他", nil];
            
            DLCityPickerView *pickerSingle = [[DLCityPickerView alloc]init];
            
            [pickerSingle setDataArray:arrayData];
            [pickerSingle setDefalutSelectRowStr:arrayData[0]];
            [pickerSingle setDelegate:self];
            [pickerSingle show];
            [self.view endEditing:YES];
            
        

         */
        NSMutableArray *ageArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
        
        
        
        
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
    }
    
    /**  手机号 **/
    if (indexPath.row == 4) {
    }
    
    /**  邮箱 **/
    if (indexPath.row == 5) {
        
    }

    /**  修改密码 **/
    if (indexPath.section == 1) {
        DLChangePasswordController * changePwdVC = [[DLChangePasswordController alloc] init];
        [self.navigationController pushViewController:changePwdVC animated:YES];

    }
}


#pragma mark - --------------- JHPickerDelegate -------------------

-(void)PickerSelectorIndixString:(NSString *)str
{
    
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:self.selectedIndexPath] ;
    cell.detailTextLabel.text = str ;
    
//    if (self.selectedIndexPath.row == 1) {
    
//        NSDateFormatter* formater = [[NSDateFormatter alloc] init];
//        formater.dateFormat = @"yyyy年MM月d日" ;
//        NSDate* date = [formater dateFromString:str];
        
//        NSDateComponents* components  = [self getDateComponentsFromDate:date];
//        NSString* str = [self getAstroWithMonth: components.month  day: components.day] ;
        
//        UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectedIndexPath.row+1 inSection:self.selectedIndexPath.section]] ;
//        
//        cell.detailTextLabel.text = str ;
    
        
//    }
    
}

//-(NSString *)getAstroWithMonth:(NSInteger)m day:(NSInteger)d{
//    
//    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
//    NSString *astroFormat = @"102123444543";
//    NSString *result;
//    
//    if (m<1||m>12||d<1||d>31){
//        return @"错误日期格式!";
//    }
//    
//    if(m==2 && d>29)
//    {
//        return @"错误日期格式!!";
//    }else if(m==4 || m==6 || m==9 || m==11) {
//        
//        if (d>30) {
//            return @"错误日期格式!!!";
//        }
//    }
//    
//    result=[NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(m*2-(d < [[astroFormat substringWithRange:NSMakeRange((m-1), 1)] intValue] - (-19))*2,2)]];
//    
//    
//    return [NSString stringWithFormat:@"%@座",result];
//}

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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTiltleArr.count ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"cellID" ;
    UITableViewCell*  cell =  [tableView dequeueReusableCellWithIdentifier:cellID];
    
//    for (UIView* View in cell.contentView.subviews)
//    {
//        if ([View isKindOfClass:[UIImageView class]]||[View isKindOfClass:[UITextField class]]) {
//            [View removeFromSuperview];
//        }
//    }
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    }
    
    cell.textLabel.text = self.cellTiltleArr[indexPath.row];
    
    return cell ;
}

#pragma mark -------------  DLCityPickerViewDelegate ---------------

-(void)customPickView:(DLCityPickerView *)customPickView selectedTitle:(NSString *)selectedTitle{
        NSLog(@"选择%@",selectedTitle);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
