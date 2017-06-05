//
//  DLMyCustomerController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/2.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMyCustomerController.h"
#import "DLMyCustomerListController.h"

@interface DLMyCustomerController ()
@property (weak, nonatomic) IBOutlet UILabel *myCommisionLabel;

@end

@implementation DLMyCustomerController

/*** 我的直客列表 ***/
- (IBAction)myCustomerListClick:(id)sender {
    
    DLMyCustomerListController *listVC = [[DLMyCustomerListController alloc ]init];
    
    [self.navigationController pushViewController:listVC animated:YES];
    
}

/*** 直客机票订单 ***/
- (IBAction)tickerOrderBtnClick:(id)sender {
}
/*** 直客评价 ***/
- (IBAction)feedBackBtnClick:(id)sender {
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的直客";
}

- (BOOL)dl_blueNavbar {
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
