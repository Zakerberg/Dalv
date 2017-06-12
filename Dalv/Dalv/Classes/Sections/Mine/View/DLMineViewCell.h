//
//  DLMineViewCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLMineViewCell : UITableViewCell

/****  姓名  ****/
@property (weak,nonatomic) UITextField *nameTF;
/****  选择城市  ****/
@property (weak,nonatomic) UIButton *changeCityBtn;
/****  电话号码  ****/
@property (weak, nonatomic) UITextField *phoneTextFiled;
/****  验证码  ****/
@property (weak, nonatomic) UITextField *passCodeTF;
/****  获取验证码  ****/
@property (weak, nonatomic) UIButton *authCodeBtn;
/****  密码  ****/
@property (weak, nonatomic) UITextField *passwordTF;
/****  确认密码  ****/
@property (weak, nonatomic) UITextField *determinePasswordTF;
//****  输入的职位  ****/
@property (weak, nonatomic) UITextField *positionTF;
//****  立即注册  ****/
@property (strong, nonatomic)  UIButton *regsterNow;

@end
