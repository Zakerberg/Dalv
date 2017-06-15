//
//  DLOnlineRechargeViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLOnlineRechargeViewController.h"
static NSString *DLOnlineRechargeTableViewHeader = @"DLOnlineRechargeTableViewHeader";
static NSString *DLOnlineRechargeTableViewFooter = @"DLOnlineRechargeTableViewFooter";
@interface DLOnlineRechargeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic, strong) UITableView *onlineRechargeTableView;
@property (nonatomic, assign) NSUInteger selctSection;//选中的section 也就是选中的支付方式
@property (nonatomic, strong) NSMutableArray *bankChargeArray;//银行充值的数组
@property (nonatomic,strong) UITextField *priceTextField;
@end

@implementation DLOnlineRechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    
    self.selctSection = 0;
    
}

#pragma mark - Setup navbar

- (void)setupNavbar {
    self.title = @"线上充值";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    
    self.onlineRechargeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.onlineRechargeTableView.dataSource = self;
    self.onlineRechargeTableView.delegate = self;
    self.onlineRechargeTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.onlineRechargeTableView.showsVerticalScrollIndicator = NO;
    self.onlineRechargeTableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.onlineRechargeTableView];
    [self.onlineRechargeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
       return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return 110.0f;
    }else{
        return CGFLOAT_MIN;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:DLOnlineRechargeTableViewHeader];
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
        make.right.equalTo(headerView.contentView).offset(-15);
        make.height.equalTo(@24);
        make.width.equalTo(@24);
        make.centerY.equalTo(headerView.contentView);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.height.equalTo(@0.5);
        make.right.equalTo(headerView.contentView);
        make.bottom.equalTo(headerView.contentView);
    }];
    switch (section) {
        case 0:
            imageView.image = [UIImage imageNamed:@"fiance_wxpay"];
            headerLabel.text = @"微信充值";
            break;
        case 1:
            imageView.image = [UIImage imageNamed:@"fiance_aipay"];
            headerLabel.text = @"支付宝充值";
            break;
        default:
            break;
    }
    return headerView;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 1) {
        UITableViewHeaderFooterView *footerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:DLOnlineRechargeTableViewFooter];
        footerView.contentView.backgroundColor = [UIColor ms_backgroundColor];
        
        UIView *backview = [[UIView alloc]init];
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
        //        [submitBtn  addTarget:self action:@selector(submitAnApplication) forControlEvents:UIControlEventTouchUpInside];
        submitBtn.layer.cornerRadius = 8.0;
        [backview addSubview:submitBtn];
        
        [backview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.left.equalTo(@0);
            make.width.equalTo(footerView.contentView);
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
            make.width.equalTo(backview).with.offset(-100);
            make.height.equalTo(@50);
        }];
        
        [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(backview.mas_bottom).with.offset(10);
            make.left.equalTo(@20);
            make.right.equalTo(@-20);
            make.height.equalTo(@40);
        }];
        
        
        return footerView;
    }else{
        return nil;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - Fetch data

#pragma mark - Event Handler
- (void)selectRechargeType:(UIButton *)btn {
    
    btn.selected = !btn.selected;
    [self.bankChargeArray removeAllObjects];
    if (btn.selected) {
        self.selctSection = btn.tag - 1000;
        if (btn.tag == 1003) {
            [self.bankChargeArray addObject:@"1"];
            [self.bankChargeArray addObject:@"2"];
        }
        [self.onlineRechargeTableView reloadData];
        
    }

}

#pragma mark - Getter

- (NSMutableArray *)bankChargeArray {
    if (_bankChargeArray == nil) {
        _bankChargeArray = [[NSMutableArray alloc] init];
    }
    return _bankChargeArray;
}

@end
