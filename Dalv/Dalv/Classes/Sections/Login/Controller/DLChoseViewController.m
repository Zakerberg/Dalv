//
//  DLChoseViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/25.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLChoseViewController.h"
#import "DLMineViewController.h"
#import "DLCustomerRegidsterController.h"

@interface DLChoseViewController ()

@end

@implementation DLChoseViewController

/*** 顾问注册  ***/
- (IBAction)consultantRegisterBtnClick:(id)sender {
    
    DLMineViewController *minVC= [[DLMineViewController alloc] init];
    [self.navigationController pushViewController:minVC animated:YES];
    
}


/*** 顾客注册  ***/
- (IBAction)customerRegisterBtnClick:(id)sender {
    
    DLCustomerRegidsterController *customerVC = [[DLCustomerRegidsterController alloc] init];
    
    [self.navigationController pushViewController:customerVC animated:YES];
    
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
