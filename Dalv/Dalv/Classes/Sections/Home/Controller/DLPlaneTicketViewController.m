//
//  DLPlaneTicketViewController.m
//  Dalv
//
//  Created by Nie on 2017/7/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLPlaneTicketViewController.h"
#import "DLPlaneTicketListViewController.h"
#import "DLAddPlanePeopleController.h"
#import "TLCityPickerController.h"
#import "NSDate+Helper.h"

@interface DLPlaneTicketViewController () <TLCityPickerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak,nonatomic) UITableViewCell* personCell;
@property (nonatomic,strong) UITableView * planeTicketTableView;
@property (strong, nonatomic) UIButton *searchBtn;
@property (nonatomic,strong) NSString * str1;

@end

static NSString *cellID = @"cellID";
@implementation DLPlaneTicketViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUI];
    [self setTab];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ----- setUI

- (void)setUI {
    
    self.title = @"机票查询";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
}

#pragma mark ----- setTab

-(void)setTab{
    
    self.planeTicketTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.planeTicketTableView.dataSource = self;
    self.planeTicketTableView.delegate = self;
    self.planeTicketTableView.tableFooterView = [UIView new];
    self.planeTicketTableView.backgroundColor = [UIColor ms_backgroundColor];
    
    [self.view addSubview:self.planeTicketTableView];
    
    UIButton *searchBtn = [[UIButton alloc] init];
    self.searchBtn = searchBtn;
    [searchBtn setTitle:@"开始查询" forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.backgroundColor = [UIColor colorWithHexString:@"#4d67ee"];
    searchBtn.layer.cornerRadius = 8.0;
    
    [self.view addSubview:searchBtn];
    
    [self.planeTicketTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.planeTicketTableView.tableFooterView.mas_top).offset(43);
        make.height.offset(44);
        make.left.equalTo(@15);
        make.right.equalTo(self.view.mas_right).offset(-15);
    }];
}


#pragma mark ----- searchBtnClick

-(void)searchBtnClick {
    
    NSLog(@"开始查询!");
    
    if (!self.startDate.text) {
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请填写您的出发日期" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alert show];
        
    }else if (!self.starLabel.text ){
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请填写您的出发城市" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alert show];
        
    }else if (!self.destinationLabel.text){
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请填写您的目的地" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alert show];
        
    }else{
        
        DLPlaneTicketListViewController * planeTicketListVC = [[DLPlaneTicketListViewController alloc]init];
        planeTicketListVC.departure = self.starLabel.text;
        planeTicketListVC.destination = self.destinationLabel.text;
        planeTicketListVC.timestart = self.startDate.text;
        [self.navigationController pushViewController:planeTicketListVC animated:YES];
    }
    
//    
//    DLAddPlanePeopleController  *vc = [[DLAddPlanePeopleController alloc] init];
//    
//    [self.navigationController pushViewController:vc animated:YES];
//    

}

#pragma mark ----- UITableView Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0.1;
    }
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1
                                      reuseIdentifier: cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if(indexPath.row == 0) {
        
        cell.textLabel.text = @"出发地";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
        
        UILabel *starLabel = [[UILabel alloc] init];
        self.starLabel = starLabel;
        starLabel.font = [UIFont systemFontOfSize:15];
        starLabel.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
        cell.detailTextLabel.text = @"选择出发城市";
        cell.detailTextLabel.text = self.starLabel.text;
        
        [cell.contentView addSubview:starLabel];
        
        [starLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-15);
            make.height.offset(44);
            make.top.offset(0);
        }];
        
        return cell;
        
    }else if (indexPath.row == 1) {
        
        cell.textLabel.text = @"目的地";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
        
        UILabel *destinationLabel = [[UILabel alloc] init];
        self.destinationLabel = destinationLabel;
        destinationLabel.font = [UIFont systemFontOfSize:15];
        destinationLabel.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
        cell.detailTextLabel.text = @"选择目的地";
        cell.detailTextLabel.text = self.destinationLabel.text;
        
        [cell.contentView addSubview:destinationLabel];
        
        [destinationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-15);
            make.height.offset(44);
            make.top.offset(0);
        }];
        
        return cell;
        
    }else {
        
        cell.textLabel.text = @"出发日期";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
        
        UILabel *startDate = [[UILabel alloc] init];
        self.startDate = startDate;
        startDate.font = [UIFont systemFontOfSize:15];
        startDate.textColor = [UIColor colorWithHexString:@"#b6b6b6"];
        
        cell.detailTextLabel.text = self.startDate.text;
        
        [cell.contentView addSubview:startDate];
        
        [startDate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-15);
            make.height.offset(44);
            make.top.offset(0);
        }];
        
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /// 出发城市
    if (indexPath.row == 0){
        
        self.str1 = @"1";
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
        
        /// 出发目的地
    }else if (indexPath.row == 1){
        
        TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
        
        [cityPickerVC setDelegate:self];
      
        cityPickerVC.locationCityID = @"20000101";
        
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
        
        /// 出发日期
    }else{
        
        UIDatePicker *picker = [[UIDatePicker alloc]init];
        picker.datePickerMode = UIDatePickerModeDate;
        
        picker.frame = CGRectMake(0, 40, 320, 200);
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择出发日期\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSDate *date = picker.date;
            
            self.startDate.text = [date stringWithFormat:@"yyyy-MM-dd"];;
            
        }];
        [alertController.view addSubview:picker];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

#pragma mark ----- TLCityPickerDelegate

- (void) cityPickerController:(TLCityPickerController *)cityPickerViewController didSelectCity:(TLCity *)city{
    
    
    if ([self.str1 isEqualToString: @"1"]) {
        
        self.starLabel.text = city.cityName;
        self.str1 = @"";
        
    }else{
        
        self.destinationLabel.text = city.cityName;
        NSLog(@"2222222222222");
    }
    
    [cityPickerViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) cityPickerControllerDidCancel:(TLCityPickerController *)cityPickerViewController

{
    [cityPickerViewController dismissViewControllerAnimated:YES completion:nil];
}



/*
 #pragma mark - Setup subViews
 
 - (void)setupSubviews {
 
 UIButton *choiceComeCitynBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 104, SCREEN_WIDTH, 40)];
 self.choiceComeCitynBtn = choiceComeCitynBtn;
 [choiceComeCitynBtn setTitle:@"选择出发城市" forState:(UIControlStateNormal)];
 choiceComeCitynBtn.titleLabel.font = [UIFont systemFontOfSize:20];
 [choiceComeCitynBtn addTarget:self action:@selector(choiceCitynBtn) forControlEvents:UIControlEventTouchUpInside];
 choiceComeCitynBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
 [choiceComeCitynBtn  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 choiceComeCitynBtn.layer.cornerRadius = 2.0;
 [self.view addSubview:choiceComeCitynBtn];
 
 
 UIButton *choiceBackCitynBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 184, SCREEN_WIDTH, 40)];
 self.choiceBackCitynBtn = choiceBackCitynBtn;
 [choiceBackCitynBtn setTitle:@"选择目的地城市" forState:(UIControlStateNormal)];
 choiceBackCitynBtn.titleLabel.font = [UIFont systemFontOfSize:20];
 [choiceBackCitynBtn addTarget:self action:@selector(choiceCitynBtn) forControlEvents:UIControlEventTouchUpInside];
 choiceBackCitynBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
 [choiceBackCitynBtn  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 choiceBackCitynBtn.layer.cornerRadius = 2.0;
 [self.view addSubview:choiceBackCitynBtn];
 
 
 UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 244, SCREEN_WIDTH, 40)];
 self.searchBtn = searchBtn;
 [searchBtn setTitle:@"搜索" forState:(UIControlStateNormal)];
 searchBtn.titleLabel.font = [UIFont systemFontOfSize:20];
 [searchBtn addTarget:self action:@selector(planeticket) forControlEvents:UIControlEventTouchUpInside];
 searchBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
 [searchBtn  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 searchBtn.layer.cornerRadius = 2.0;
 [self.view addSubview:searchBtn];
 
 }
 
 - (void)planeticket {
 DLPlaneTicketListViewController * planeTicketListVC = [[DLPlaneTicketListViewController alloc]init];
 [self.navigationController pushViewController:planeTicketListVC animated:YES];
 }
 - (void)choiceCitynBtn1 {
 }
 - (void)choiceCitynBtn {
 
 TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
 [cityPickerVC setDelegate:self];
 //定位城市
 cityPickerVC.locationCityID = @"20000101";
 //热门城市
 cityPickerVC.hotCitys = @[@"20000101", @"18000101", @"18000102", @"14000101", @"22000101", @"40000103", @"19000101", @"70000101", @"30000102", @"11000101", @"21000101", @"90000101", @"18000103", @"60000104", @"22000102", @"30000107", @"30000108", @"16000102"];
 
 [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
 
 }];
 
 }
 
 #pragma mark - TLCityPickerDelegate
 - (void) cityPickerController:(TLCityPickerController *)cityPickerViewController didSelectCity:(TLCity *)city
 {
 [self.choiceComeCitynBtn setTitle:city.cityName forState:UIControlStateNormal];
 [self.choiceBackCitynBtn setTitle:city.cityName forState:UIControlStateNormal];
 [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
 
 }];
 }
 
 - (void) cityPickerControllerDidCancel:(TLCityPickerController *)cityPickerViewController
 {
 [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
 
 }];
 }
 */
@end
