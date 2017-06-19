//
//  DLOfflineRechargeViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLOfflineRechargeViewController.h"
#import "DLBankTransferTableViewCell.h"
#import "DLHomeViewTask.h"
#import "RegExCategories.h"//正则匹配
#import "NSString+Regex.h"//正则匹配
#import "DLRechargeRecordViewController.h"

static NSString *DLOfflineRechargeTableViewHeader = @"DLOfflineRechargeTableViewHeader";

@interface DLOfflineRechargeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong) UITableView *offlineRechargeTableView;

@property (nonatomic, assign) NSUInteger selctSection;//选中的section 也就是选中的支付方式

@property (nonatomic, strong) NSMutableArray *bankChargeArray;//银行充值的数组

@property (nonatomic, strong) UITextField *priceTextField;//输入金额

@property (nonatomic, strong) UITextField *remittingPartyTextField;//输入汇款方

@property (nonatomic, copy) NSString *topupInfo;//银行html字符串

@property (nonatomic,strong) UIView *backview;

@end

@implementation DLOfflineRechargeViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self fetchData];
    
    self.selctSection = 0;

}

#pragma mark - Setup navbar
- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)setupNavbar {
    self.title = @"线下充值";
}

#pragma mark - Setup subViews

- (void)setupSubviews {

    self.offlineRechargeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.offlineRechargeTableView.dataSource = self;
    self.offlineRechargeTableView.delegate = self;
    self.offlineRechargeTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.offlineRechargeTableView.showsVerticalScrollIndicator = NO;
    self.offlineRechargeTableView.tableFooterView = [[UIView alloc]init];
    [self.offlineRechargeTableView registerClass:[DLBankTransferTableViewCell class] forCellReuseIdentifier:[DLBankTransferTableViewCell cellIdentifier]];
    self.offlineRechargeTableView.tableFooterView = [self configureFooterView];

    [self.view addSubview:self.offlineRechargeTableView];
    [self.offlineRechargeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];

}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return self.bankChargeArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLBankTransferTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLBankTransferTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLBankTransferModel *btModel = [self.bankChargeArray objectAtIndex:indexPath.row];
    [cell configureCell:btModel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:DLOfflineRechargeTableViewHeader];
    headerView.contentView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [headerView addSubview:imageView];
    
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.textColor = [UIColor colorWithHexString:@"#4b4b4b"];
    headerLabel.textAlignment = NSTextAlignmentLeft;
    headerLabel.font = [UIFont systemFontOfSize:14];
    [headerView addSubview:headerLabel];

    UIButton *selectBtn = [[UIButton alloc]init];
    [selectBtn setImage:[UIImage imageNamed:@"fiance_not_selected"] forState:UIControlStateNormal];
    [selectBtn setImage:[UIImage imageNamed:@"fiance_selected"] forState:UIControlStateSelected];
    selectBtn.tag = section + 1000;
    [headerView addSubview:selectBtn];
    
    [selectBtn setSelected:(self.selctSection == section)];
    [selectBtn addTarget:self action:@selector(selectRechargeType:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor ms_separatorColor];
    [headerView  addSubview:line];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.height.equalTo(@24);
        make.width.equalTo(@24);
        make.centerY.equalTo(headerView.contentView);
    }];
    
    [headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(15);
        make.height.equalTo(@25);
        make.width.equalTo(@100);
        make.centerY.equalTo(headerView.contentView);
    }];
    
    [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headerView.contentView.mas_right).offset(-15);
        make.height.equalTo(@24);
        make.width.equalTo(@24);
        make.centerY.equalTo(headerView.contentView);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.height.equalTo(@0.5);
        make.right.equalTo(headerView.mas_right);
        make.bottom.equalTo(headerView.mas_bottom);
    }];
    switch (section) {
        case 0:
            imageView.image = [UIImage imageNamed:@"fiance_cash_recharge"];
            headerLabel.text = @"现金充值";
            break;
        case 1:
            imageView.image = [UIImage imageNamed:@"fiance_credit_card_recharge"];
            headerLabel.text = @"刷卡充值";
            break;
        case 2:
            imageView.image = [UIImage imageNamed:@"fiance_cheque_recharge"];
            headerLabel.text = @"支票充值";
            break;
        case 3:
            imageView.image = [UIImage imageNamed:@"fiance_bank_transfer"];
            headerLabel.text = @"银行充值";
            break;

        default:
            break;
    }
    return headerView;

}
- (UIView *)creatFootView {
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
    footerView.backgroundColor = [UIColor ms_backgroundColor];
    
    _backview = [[UIView alloc]init];
    _backview.backgroundColor = [UIColor whiteColor];
    [footerView addSubview:_backview];
    
    UILabel *cashWithdrawalLabel = [[UILabel alloc] init];
    cashWithdrawalLabel.text = @"汇款方";
    cashWithdrawalLabel.textAlignment = NSTextAlignmentLeft;
    cashWithdrawalLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    cashWithdrawalLabel.font = [UIFont systemFontOfSize:16];
    [_backview addSubview:cashWithdrawalLabel];
    
    self.remittingPartyTextField = [[UITextField alloc] init];
    self.remittingPartyTextField.font = [UIFont systemFontOfSize:16];
    self.remittingPartyTextField.keyboardType = UIKeyboardTypeTwitter;
    self.remittingPartyTextField.placeholder = @"输入汇款方名称";
    self.remittingPartyTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.remittingPartyTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.remittingPartyTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.remittingPartyTextField.leftViewMode = UITextFieldViewModeAlways;
    self.remittingPartyTextField.delegate = self;
    [_backview addSubview:self.remittingPartyTextField];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [footerView  addSubview:line];
    
    UIView *backview1 = [[UIView alloc]init];
    backview1.backgroundColor = [UIColor whiteColor];
    [footerView addSubview:backview1];
    
    UILabel *pricelLabel = [[UILabel alloc] init];
    pricelLabel.text = @"金    额";
    pricelLabel.textAlignment = NSTextAlignmentLeft;
    pricelLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    pricelLabel.font = [UIFont systemFontOfSize:16];
    [backview1 addSubview:pricelLabel];
    
    self.priceTextField = [[UITextField alloc] init];
    self.priceTextField.font = [UIFont systemFontOfSize:16];
    self.priceTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.priceTextField.placeholder = @"请输入充值的金额";
    self.priceTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.priceTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.priceTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.priceTextField.leftViewMode = UITextFieldViewModeAlways;
    self.priceTextField.delegate = self;
    [backview1 addSubview:self.priceTextField];
    
    UIButton *submitBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    submitBtn.backgroundColor = [UIColor colorWithHexString:@"#536bf8"];
    [submitBtn addTarget:self action:@selector(submitAnApplication) forControlEvents:UIControlEventTouchUpInside];
    submitBtn.layer.cornerRadius = 8.0;
    [footerView addSubview:submitBtn];
    
    [_backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(footerView);
        make.width.equalTo(footerView);
        make.height.equalTo(@50);
    }];
    
    [cashWithdrawalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_backview);
        make.left.equalTo(@15);
        make.width.equalTo(@55);
        make.height.equalTo(@50);
    }];
    
    [self.remittingPartyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_backview);
        make.left.equalTo(pricelLabel.mas_right);
        make.width.equalTo(@(SCREEN_WIDTH-70));
        make.height.equalTo(@50);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backview.mas_bottom);
        make.left.equalTo(footerView);
        make.width.equalTo(footerView);
        make.height.equalTo(@1);
    }];
    
    [backview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(footerView);
        make.width.equalTo(footerView);
        make.height.equalTo(@50);
    }];
    
    [pricelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backview1);
        make.left.equalTo(@15);
        make.width.equalTo(@55);
        make.height.equalTo(@50);
    }];
    
    [self.priceTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backview1);
        make.left.equalTo(pricelLabel.mas_right);
        make.width.equalTo(@(SCREEN_WIDTH-70));
        make.height.equalTo(@50);
    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backview1.mas_bottom).offset(10);
        make.height.equalTo(@40);
        make.centerX.equalTo(footerView);
        make.width.equalTo(footerView).multipliedBy(0.9f);
    }];
    
    return footerView;

}

- (UIView *)configureFooterView {
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 110)];
    footerView.backgroundColor = [UIColor ms_backgroundColor];
    
    UIView *backview = [[UIView alloc] init];
    backview.backgroundColor = [UIColor whiteColor];
    [footerView addSubview:backview];
    
    UILabel *cashWithdrawalLabel = [[UILabel alloc] init];
    cashWithdrawalLabel.text = @"金额";
    cashWithdrawalLabel.textAlignment = NSTextAlignmentLeft;
    cashWithdrawalLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    cashWithdrawalLabel.font = [UIFont systemFontOfSize:16];
    [backview addSubview:cashWithdrawalLabel];
    
    self.priceTextField = [[UITextField alloc] init];
    self.priceTextField.font = [UIFont systemFontOfSize:16];
    self.priceTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.priceTextField.placeholder = @"请输入充值的金额";
    self.priceTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.priceTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.priceTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.priceTextField.leftViewMode = UITextFieldViewModeAlways;
    self.priceTextField.delegate = self;
    [backview addSubview:self.priceTextField];
    
    UIButton *submitBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    submitBtn.backgroundColor = [UIColor colorWithHexString:@"#536bf8"];
    submitBtn.layer.cornerRadius = 8.0;
    [footerView addSubview:submitBtn];
    [submitBtn addTarget:self action:@selector(submitAnApplication) forControlEvents:UIControlEventTouchUpInside];
    
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(footerView);
        make.right.equalTo(footerView);
        make.height.equalTo(@50);
    }];
    
    [cashWithdrawalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backview);
        make.left.equalTo(@15);
        make.width.equalTo(@50);
        make.height.equalTo(@50);
    }];
    
    [self.priceTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backview);
        make.left.equalTo(cashWithdrawalLabel.mas_right);
        make.width.equalTo(@(SCREEN_WIDTH-65));
        make.height.equalTo(@50);
    }];
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backview.mas_bottom).offset(10);
        make.height.equalTo(@40);
        make.centerX.equalTo(footerView);
        make.width.equalTo(footerView).multipliedBy(0.9f);
    }];
    
    return footerView;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - Fetch data
- (void)fetchData {
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],};
    [DLHomeViewTask getAgencyFinanceApplyTopup:param completion:^(id result, NSError *error) {
        NSDictionary *operatorInfo = [result objectForKey:@"operatorInfo"];
        self.topupInfo = [operatorInfo objectForKey:@"topupInfo"];
        [self chargeArray];
    }];
    
}


#pragma mark - Event Handler

- (void)selectRechargeType:(UIButton *)btn {
    
    if (btn.selected) {
        return;
    }
    
    btn.selected = !btn.selected;
    [self.bankChargeArray removeAllObjects];
    if (btn.selected) {
        self.selctSection = btn.tag - 1000;
        if (btn.tag == 1003) {
            self.bankChargeArray = [self chargeArray];
         }
        [self.offlineRechargeTableView reloadData];

        if (self.selctSection == 3 || self.selctSection == 2) {
            self.offlineRechargeTableView.tableFooterView = [self creatFootView];
        } else {
            self.offlineRechargeTableView.tableFooterView = [self configureFooterView];
        }
    }
    
}

// 提交
- (void)submitAnApplication {
    
    if (self.remittingPartyTextField.text.length == 0 &&(self.selctSection == 3 || self.selctSection == 2)) {
        [[DLHUDManager sharedInstance]showTextOnly:@"请输入汇款方"];
        return;
    }
    
    if (self.priceTextField.text.length == 0 ) {
        [[DLHUDManager sharedInstance]showTextOnly:@"请输入充值金额"];
        return;
    }
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"amount" : self.priceTextField.text,
                            @"payer" : (self.selctSection == 0 || self.selctSection == 1) ? @"" :self.remittingPartyTextField.text,
                            @"topup_type" : @(self.selctSection  + 1),
                            @"sign_token" : [DLUtils getSign_token],};
        [DLHomeViewTask getAgencyFinanceApplyTopupHandle:param completion:^(id result, NSError *error) {
            if ([[result objectForKey:@"status"] isEqualToString:@"00000"]) {
                [[DLHUDManager sharedInstance] showTextOnly:[result objectForKey:@"msg"]];
                DLRechargeRecordViewController *rechRecVC = [[DLRechargeRecordViewController alloc]init];
                [self.navigationController pushViewController:rechRecVC animated:YES];
                
            }else {
                [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
            }
        }];
}

#pragma mark - Private method
// 根据返回的数据 解析成Array
- (NSMutableArray *)chargeArray {
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    if ([NSString isNotBlank:self.topupInfo]) {
        NSArray *bankArray = [self.topupInfo componentsSeparatedByString:@"<br /><br />"];
        for (NSString *htmlStr in bankArray) {
            DLBankTransferModel *model = [[DLBankTransferModel alloc]init];
            model.account_name = [htmlStr firstMatchWithPattern:@"开户名：(.*?)<br />"];
            model.account = [htmlStr firstMatchWithPattern:@"账号：(.*?)<br />"];
            model.opening_bank = [htmlStr firstMatchWithPattern:@"开户行：(\\w+)"];
            [tempArray addObject:model];
        }
    }
    
    return tempArray;
    
}

#pragma mark - Getter

- (NSMutableArray *)bankChargeArray {
    if (_bankChargeArray == nil) {
        _bankChargeArray = [[NSMutableArray alloc] init];
    }
    return _bankChargeArray;
}

@end
