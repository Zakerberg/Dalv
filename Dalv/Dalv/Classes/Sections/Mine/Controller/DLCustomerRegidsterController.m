//
//  DLCustomerRegidsterController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/19.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCustomerRegidsterController.h"

@interface DLCustomerRegidsterController ()
/**** 顾客姓名   ****/
@property (weak, nonatomic) IBOutlet UITextField *customerNamelTF;
/**** 顾客手机号   ****/
@property (weak, nonatomic) IBOutlet UITextField *customerNumberTF;

/**** 顾客验证码   ****/
@property (weak, nonatomic) IBOutlet UITextField *customerCodeTF;
/**** 顾客密码   ****/
@property (weak, nonatomic) IBOutlet id customerPasswordTF;

/**** 顾客确认密码   ****/
@property (weak, nonatomic) IBOutlet UITextField *customerDeterminePasswordTF;

/**** 顾客绑定顾问的手机号   ****/
@property (weak, nonatomic) IBOutlet UITextField *customerBindingNumberTF;

/**** 顾客获取验证码按钮   ****/
@property (weak, nonatomic) IBOutlet UIButton *obtainCodeBtn;

/**** 立即注册按钮   ****/
@property (weak, nonatomic) IBOutlet UIButton *registerNowBtn;


@end

@implementation DLCustomerRegidsterController


/**** 立即注册   ****/
- (IBAction)registerBtnClick:(id)sender {
    
}

/**** 获取验证码   ****/
- (IBAction)obtainCodeBtnClick:(id)sender {
    
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
