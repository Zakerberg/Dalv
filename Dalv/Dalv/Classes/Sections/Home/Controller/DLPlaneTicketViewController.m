//
//  DLPlaneTicketViewController.m
//  Dalv
//
//  Created by Nie on 2017/7/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLPlaneTicketViewController.h"
#import "TLCityPickerController.h"

@interface DLPlaneTicketViewController () <TLCityPickerDelegate>
@property (strong, nonatomic)  UIButton *choiceComeCitynBtn;//出发城市
@property (strong, nonatomic)  UIButton *choiceBackCitynBtn;//目的地城市

@end

@implementation DLPlaneTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Setup navbar
- (BOOL)dl_blueNavbar {
    return YES;
}
- (void)setupNavbar {
    self.title = @"机票";
}

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

@end
