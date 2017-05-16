//
//  DLLineEnquiryController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineEnquiryController.h"
#import "TLCityPickerController.h"

@interface DLLineEnquiryController ()<UITableViewDelegate,UITableViewDataSource,TLCityPickerDelegate>
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) UILabel *cityLabel;

@end
static NSString *lineEnquiryCellID = @"lineEnquiry_Cell_ID";
@implementation DLLineEnquiryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self setupUI];
}


-(void)setupUI{
    self.title = @"线路询价";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"v2_goback"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UITableView *tableview = [[UITableView alloc]init];
    tableview.frame = self.view.bounds;
    [self.view addSubview:tableview];
    self.tableview = tableview;
    
    tableview.delegate = self;
    tableview.dataSource = self;
    
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:lineEnquiryCellID];
    
    tableview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tableview.tableFooterView = [[UIView alloc]init];
    
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    /********   出发地   *******/
    if (indexPath.row == 0) {
        
        UILabel *cityLabel = [[UILabel alloc] init];
        
        self.cityLabel = cityLabel;
        
        TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
        [cityPickerVC setDelegate:self];
        
        cityPickerVC.locationCityID = @"1400010000";
        //    cityPickerVC.commonCitys = [[NSMutableArray alloc] initWithArray: @[@"1400010000", @"100010000"]];        // 最近访问城市，如果不设置，将自动管理
        cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
        
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
        }];
        
    }
    
    
    /*****   目的地    ****/
    if (indexPath.row == 1) {
        
    }
    
    /****   旅游人数    *****/
    if (indexPath.row == 2) {
        
    }
    /****  出发时间   *****/
    if (indexPath.row == 3) {
        
    }
    
    /*****   备注   *****/
    if (indexPath.row == 4) {
        
    }
}

#pragma mark - TLCityPickerDelegate
- (void) cityPickerController:(TLCityPickerController *)cityPickerViewController didSelectCity:(TLCity *)city
{
//    [self.cityPickerButton setTitle:city.cityName forState:UIControlStateNormal];
    
    self.cityLabel.text = city.cityName;
    
    [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void) cityPickerControllerDidCancel:(TLCityPickerController *)cityPickerViewController
{
    [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}


- (void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:lineEnquiryCellID forIndexPath:indexPath];
    
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"出发城市";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"目的地";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"旅游人数";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"出发时间";
    }
    if (indexPath.row == 4) {
        cell.textLabel.text = @"备注";
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:14.0];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
