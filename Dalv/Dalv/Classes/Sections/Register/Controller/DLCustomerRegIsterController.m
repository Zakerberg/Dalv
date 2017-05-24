//
//  DLCustomerRegIsterController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/24.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCustomerRegIsterController.h"

@interface DLCustomerRegIsterController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *NumberTF;
@property (weak, nonatomic) IBOutlet UIButton *GetCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *inPutVerificationCodeTF;
@property (weak, nonatomic) IBOutlet UILabel *inPutPasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *DeterminePasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *ConsultantnNumberTF;
@property (weak, nonatomic) IBOutlet UIButton *RegidsterBtn;

@end

@implementation DLCustomerRegIsterController




/***  立即注册    ***/
- (IBAction)RegidsterBtnClick:(id)sender {
}

/***  获取验证码 ***/
- (IBAction)GetCodeBtnClick:(id)sender {
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
