
//
//  DLLineQueryController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  --------------------   线路查询  ------------------

#import "DLLineQueryController.h"
#import "DLAddReduceButton.h"
#import "DLLineQueryCell.h"
#import "TLCityPickerController.h"

@interface DLLineQueryController ()<UITableViewDelegate,UITableViewDataSource,TLCityPickerDelegate>
@property (nonatomic,strong) UITableView *lineQuerytableview;
@property(nonatomic,strong) UILabel * label;
@end

static NSString *lineQueryCellID = @"lineQuery_Cell_ID";
static NSString * cellID = @"cellID";
@implementation DLLineQueryController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupUI];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setupUI{
    
    self.title = @"线路查询";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.lineQuerytableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.lineQuerytableview.dataSource = self;
    self.lineQuerytableview.backgroundColor = [UIColor ms_backgroundColor];
    self.lineQuerytableview.delegate = self;
    self.lineQuerytableview.tableFooterView = [UIView new];
    [self.lineQuerytableview registerClass:[DLLineQueryCell class] forCellReuseIdentifier:lineQueryCellID];
    
    [self.view addSubview:self.lineQuerytableview];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    submitBtn.backgroundColor = [UIColor colorWithHexString:@"#4d67ee"];
    submitBtn.layer.cornerRadius = 8.0;
    
    [self.lineQuerytableview addSubview:submitBtn];
    
    [self.lineQuerytableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-48);
    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineQuerytableview.tableFooterView.mas_top).offset(43);
        make.height.offset(44);
        make.left.equalTo(@15);
        make.right.equalTo(self.view.mas_right).offset(-15);
    }];
}

-(void)submitBtnClick{

    NSLog(@"submitBtnClick");
    
    
}

#pragma mark  --------- UITableView Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 4) {
        
        return 82;
    }
    
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.row == 0) {
        
        TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
        [cityPickerVC setDelegate:self];
        //定位城市
        cityPickerVC.locationCityID = @"20000101";
        //热门城市
        cityPickerVC.hotCitys = @[
                                  @"20000101", @"18000101", @"18000102",
                                  @"14000101", @"22000101", @"40000103",
                                  @"19000101", @"70000101", @"30000102",
                                  @"11000101", @"21000101", @"90000101",
                                  @"18000103", @"60000104", @"22000102",
                                  @"30000107", @"30000108", @"16000102"
                                  ];
        
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
        }];

        
    }else if (indexPath.row == 1){
        
        
        TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
        [cityPickerVC setDelegate:self];
        //定位城市
        cityPickerVC.locationCityID = @"20000101";
        //热门城市
        cityPickerVC.hotCitys = @[
                                  @"20000101", @"18000101", @"18000102",
                                  @"14000101", @"22000101", @"40000103",
                                  @"19000101", @"70000101", @"30000102",
                                  @"11000101", @"21000101", @"90000101",
                                  @"18000103", @"60000104", @"22000102",
                                  @"30000107", @"30000108", @"16000102"
                                  ];
        
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
        }];

        
    }else if (indexPath.row == 3) {
        
        UIDatePicker *picker = [[UIDatePicker alloc]init];
        picker.datePickerMode = UIDatePickerModeDate;
        
        picker.frame = CGRectMake(0, 40, 320, 200);
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择出发日期\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSDate *date = picker.date;
            
           // self.startDate.text = [date stringWithFormat:@"yyyy-MM-dd"];;
            
        }];
        [alertController.view addSubview:picker];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];

        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 2) {
        
        DLLineQueryCell *cell = [tableView dequeueReusableCellWithIdentifier:lineQueryCellID];
        self.label = cell.label;
        cell.backgroundColor = [UIColor whiteColor];
        cell.label.text = @"旅游人数";
        return cell;
        
    }else{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                          reuseIdentifier: cellID];
    
    if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"出发城市";
       // cell.detailTextLabel.text = @"出发城市";
        
    }else if (indexPath.row == 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"目的地";
        //cell.detailTextLabel.text = @"目的地";
        
    } else if (indexPath.row == 3) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"出发时间";
        //cell.detailTextLabel.text = @"出发时间";
        
    }else if (indexPath.row == 4) {
        cell.textLabel.text = @"备注";

    }
 }
    return cell;
        
   }
    
}



#pragma mark ----- TLCityPickerDelegate

- (void) cityPickerController:(TLCityPickerController *)cityPickerViewController didSelectCity:(TLCity *)city{
    
    
    
    [cityPickerViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) cityPickerControllerDidCancel:(TLCityPickerController *)cityPickerViewController

{
    [cityPickerViewController dismissViewControllerAnimated:YES completion:nil];
}



@end

