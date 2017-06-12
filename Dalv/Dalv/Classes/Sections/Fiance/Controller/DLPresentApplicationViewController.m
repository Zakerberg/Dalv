//
//  DLPresentApplicationViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLPresentApplicationViewController.h"
#import "DLHomeViewTask.h"
#import "DLPresentApplicationModel.h"
@interface DLPresentApplicationViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *priceTextField;

@property (nonatomic,strong) NSMutableDictionary *presentDict;

@end

@implementation DLPresentApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self fetchData];

    self.view.backgroundColor = [UIColor colorWithHexString:@"efefef"];
}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
    
}

- (void)setupNavbar {
    self.title = @"提现申请";
}

#pragma mark - Fetch data

- (void)fetchData {
  
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],};
     @weakify(self);
    [DLHomeViewTask getAgencyFinanceApplyWithdraw:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            self.presentDict = [[NSMutableDictionary alloc] init];
            self.presentDict = [result objectForKey:@"agencyInfo"];
        }else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
    
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    
    UIView *backview = [[UIView alloc]init];
    backview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backview];

    UILabel *cashAccountLabel = [[UILabel alloc] init];
    cashAccountLabel.text = @"提现账号";
    cashAccountLabel.textAlignment = NSTextAlignmentCenter;
    cashAccountLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    cashAccountLabel.font = [UIFont systemFontOfSize:16];
    [backview addSubview:cashAccountLabel];

    UILabel *bankCradLabel = [[UILabel alloc] init];
//    bankCradLabel.text = @"111111111111";
    bankCradLabel.textAlignment = NSTextAlignmentLeft;
    bankCradLabel.textColor = [UIColor colorWithHexString:@"#aaaaaa"];
    bankCradLabel.font = [UIFont systemFontOfSize:14];
    [backview addSubview:bankCradLabel];
//    if (self.presentApplicationDict) {
//        bankCradLabel.text = [NSString stringWithFormat:@"%@",[self.presentApplicationDict objectForKey:@"bank_account"]];
//    }

    bankCradLabel.text = [self.presentDict objectForKey:@"bank_account"];

    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"efefef"];
    [backview   addSubview:line];
    
    UILabel *totalAccountLabel = [[UILabel alloc] init];
    totalAccountLabel.text = @"账户总额：";
    totalAccountLabel.textAlignment = NSTextAlignmentCenter;
    totalAccountLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    totalAccountLabel.font = [UIFont systemFontOfSize:12];
    [backview addSubview:totalAccountLabel];
    
    UILabel *totalPriceLabel = [[UILabel alloc] init];
    totalPriceLabel.text = @"9998.0";
    totalPriceLabel.textAlignment = NSTextAlignmentLeft;
    totalPriceLabel.textColor = [UIColor colorWithHexString:@"#ff592b"];
    totalPriceLabel.font = [UIFont systemFontOfSize:14];
    [backview addSubview:totalPriceLabel];
    
    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor colorWithHexString:@"efefef"];
    [backview  addSubview:line1];

    UILabel *currentBalanceLabel = [[UILabel alloc] init];
    currentBalanceLabel.text = @"当前余额：";
    currentBalanceLabel.textAlignment = NSTextAlignmentCenter;
    currentBalanceLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    currentBalanceLabel.font = [UIFont systemFontOfSize:14];
    [backview addSubview:currentBalanceLabel];
    
    UILabel *balancelPriceLabel = [[UILabel alloc] init];
    balancelPriceLabel.text = @"9998.0";
    balancelPriceLabel.textAlignment = NSTextAlignmentLeft;
    balancelPriceLabel.textColor = [UIColor colorWithHexString:@"#ff592b"];
    balancelPriceLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:balancelPriceLabel];
    
    UIView *line2 = [[UIView alloc]init];
    line2.backgroundColor = [UIColor colorWithHexString:@"efefef"];
    [backview addSubview:line2];
    
    UIView *backview1 = [[UIView alloc]init];
    backview1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backview1];
    
    UILabel *cashWithdrawalLabel = [[UILabel alloc] init];
    cashWithdrawalLabel.text = @"提现金额";
    cashWithdrawalLabel.textAlignment = NSTextAlignmentLeft;
    cashWithdrawalLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    cashWithdrawalLabel.font = [UIFont systemFontOfSize:16];
    [backview1 addSubview:cashWithdrawalLabel];
    
    self.priceTextField = [[UITextField alloc] init];
    self.priceTextField.font = [UIFont systemFontOfSize:16];
    self.priceTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.priceTextField.placeholder = @"请输入转出金额";
    self.priceTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.priceTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.priceTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.priceTextField.leftViewMode = UITextFieldViewModeAlways;
    self.priceTextField.delegate = self;
    [backview1 addSubview:self.priceTextField];
    
    UIButton *submitBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    submitBtn.backgroundColor = [UIColor colorWithHexString:@"#536bf8"];
    [submitBtn  addTarget:self action:@selector(submitAnApplication) forControlEvents:UIControlEventTouchUpInside];
    submitBtn.layer.cornerRadius = 8.0;
    [self.view addSubview:submitBtn];
    
    
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(self.view);
        make.height.equalTo(@120);
    }];

    [cashAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@15);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];

    [bankCradLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cashAccountLabel);
        make.left.equalTo(cashAccountLabel.mas_right);
        make.width.equalTo(@120);
        make.height.equalTo(@40);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cashAccountLabel.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(self.view);
        make.height.equalTo(@0.5);
    }];
    
    [totalAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@80);
        make.height.equalTo(@60);
    }];
    
    [totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(totalAccountLabel);
        make.left.equalTo(totalAccountLabel.mas_right);
        make.width.equalTo(@120);
        make.height.equalTo(@60);
    }];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(self.view.mas_centerX);
        make.width.equalTo(@1);
        make.height.equalTo(@60);
    }];

    [currentBalanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(line1.mas_right).with.offset(15);
        make.width.equalTo(@80);
        make.height.equalTo(@60);
    }];
    
    [balancelPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(currentBalanceLabel);
        make.left.equalTo(currentBalanceLabel.mas_right);
        make.width.equalTo(@120);
        make.height.equalTo(@60);
    }];

    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(self.view);
        make.height.equalTo(@0.5);
    }];

    [backview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backview.mas_bottom).with.offset(14);
        make.left.equalTo(@0);
        make.width.equalTo(self.view);
        make.height.equalTo(@50);
    }];

    [cashWithdrawalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backview1);
        make.left.equalTo(@15);
        make.width.equalTo(@80);
        make.height.equalTo(@50);
    }];
    
    [self.priceTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backview1);
        make.left.equalTo(cashWithdrawalLabel.mas_right);
        make.width.equalTo(backview1).with.offset(-80);
        make.height.equalTo(@50);
    }];

    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backview1.mas_bottom).with.offset(26);
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.height.equalTo(@50);
    }];

}
#pragma mark - ButtonAction
- (void)submitAnApplication
{
    if (self.priceTextField.text.length == 0) {
        [[DLHUDManager sharedInstance]showTextOnly:@"请输入转出金额"];
    }
    
}


@end
