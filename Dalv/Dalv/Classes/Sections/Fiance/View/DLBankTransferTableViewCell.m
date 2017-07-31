//
//  DLBankTransferTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/6/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLBankTransferTableViewCell.h"

@implementation DLBankTransferTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    UIView *bankbackview = [[UIView alloc]init];
    bankbackview.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
    [self.contentView  addSubview:bankbackview];
    self.bankbackview = bankbackview;
    
    UILabel *namelab = [[UILabel alloc]init];
    namelab.textColor = [UIColor colorWithHexString:@"#ff7735"];
    namelab.textAlignment = NSTextAlignmentLeft;
    namelab.font = [UIFont systemFontOfSize:12];
    namelab.text = @"开户名：";
    [bankbackview addSubview:namelab];
    
    _accountNamelab = [[UILabel alloc]init];
    _accountNamelab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
    _accountNamelab.textAlignment = NSTextAlignmentLeft;
    _accountNamelab.font = [UIFont systemFontOfSize:12];
    _accountNamelab.text = @"北京大旅科技有限公司";
    _accountNamelab.numberOfLines = 0;
    [bankbackview addSubview:_accountNamelab];
    
    
    UILabel *numberlab = [[UILabel alloc]init];
    numberlab.textColor = [UIColor colorWithHexString:@"#ff7735"];
    numberlab.textAlignment = NSTextAlignmentLeft;
    numberlab.font = [UIFont systemFontOfSize:12];
    numberlab.text = @"账   号：";
    [bankbackview addSubview:numberlab];

    _accountNumberlab = [[UILabel alloc]init];
    _accountNumberlab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
    _accountNumberlab.textAlignment = NSTextAlignmentLeft;
    _accountNumberlab.font = [UIFont systemFontOfSize:12];
    _accountNumberlab.text = @"0200 0629 1902 4537 456";
    [bankbackview addSubview:_accountNumberlab];
    
    UILabel *banklab = [[UILabel alloc]init];
    banklab.textColor = [UIColor colorWithHexString:@"#ff7735"];
    banklab.textAlignment = NSTextAlignmentLeft;
    banklab.font = [UIFont systemFontOfSize:12];
    banklab.text = @"开户行：";
    [bankbackview addSubview:banklab];

    _openingBanklab = [[UILabel alloc]init];
    _openingBanklab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
    _openingBanklab.textAlignment = NSTextAlignmentLeft;
    _openingBanklab.font = [UIFont systemFontOfSize:12];
    _openingBanklab.text = @"工商银行日坛支行";
    [bankbackview addSubview:_openingBanklab];
    
    [bankbackview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.equalTo(@75);
        
    }];
    
    [namelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@10);
        make.width.equalTo(@50);
        make.height.equalTo(@25);
    }];
    
    [_accountNamelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(namelab);
        make.left.equalTo(namelab.mas_right);
        make.right.equalTo(bankbackview);
//        make.height.equalTo(@25);
    }];
    
    [numberlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(namelab.mas_bottom);
        make.left.equalTo(@10);
        make.width.equalTo(@50);
        make.height.equalTo(@25);
    }];
    
    [_accountNumberlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(numberlab);
        make.left.equalTo(numberlab.mas_right);
        make.right.equalTo(bankbackview);
        make.height.equalTo(@25);
    }];
    
    [banklab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(numberlab.mas_bottom);
        make.left.equalTo(@10);
        make.width.equalTo(@50);
        make.height.equalTo(@25);
    }];
    
    [_openingBanklab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(banklab);
        make.left.equalTo(banklab.mas_right);
        make.right.equalTo(bankbackview);
        make.height.equalTo(@25);
    }];
}

- (void)layoutCellSubviews {
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

/** 配置Cell */
- (void)configureCell:(DLBankTransferModel *)bankModel{
    self.accountNamelab.text = bankModel.account_name;
    self.accountNumberlab.text  = bankModel.account;
    self.openingBanklab.text = bankModel.opening_bank;

}

@end
