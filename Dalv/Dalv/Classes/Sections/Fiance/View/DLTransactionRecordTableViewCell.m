//
//  DLTransactionRecordTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLTransactionRecordTableViewCell.h"

@implementation DLTransactionRecordTableViewCell


#pragma mark - Life cycle


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    _transactionTypelab = [[UILabel alloc]init];
    _transactionTypelab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
    _transactionTypelab.textAlignment = NSTextAlignmentLeft;
    _transactionTypelab.font = [UIFont systemFontOfSize:16];
    _transactionTypelab.text = @"支出线路产品订单";
    [self.contentView addSubview:_transactionTypelab];
    
    _transactionTimelab = [[UILabel alloc]init];
    _transactionTimelab.textColor = [UIColor colorWithHexString:@"#aaaaaa"];
    _transactionTimelab.textAlignment = NSTextAlignmentRight;
    _transactionTimelab.font = [UIFont systemFontOfSize:12];
    _transactionTimelab.text = @"2017-06-01 12:20:05";
    [self.contentView addSubview:_transactionTimelab];
    
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [self.contentView  addSubview:line];
    
    UILabel *tpricelab = [[UILabel alloc]init];
    tpricelab.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    tpricelab.textAlignment = NSTextAlignmentLeft;
    tpricelab.font = [UIFont systemFontOfSize:12];
    tpricelab.text = @"发生金额";
    [self.contentView addSubview:tpricelab];
    
    UILabel *abalance = [[UILabel alloc]init];
    abalance.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    abalance.textAlignment = NSTextAlignmentLeft;
    abalance.font = [UIFont systemFontOfSize:12];
    abalance.text = @"账户余额";
    [self.contentView addSubview:abalance];
    
    _transactionPricelab = [[UILabel alloc]init];
    _transactionPricelab.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _transactionPricelab.textAlignment = NSTextAlignmentRight;
    _transactionPricelab.font = [UIFont systemFontOfSize:12];
    _transactionPricelab.text = @"¥ 1999";
    [self.contentView addSubview:_transactionPricelab];
    
    _accountBalancelab = [[UILabel alloc]init];
    _accountBalancelab.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _accountBalancelab.textAlignment = NSTextAlignmentRight;
    _accountBalancelab.font = [UIFont systemFontOfSize:12];
    _accountBalancelab.text = @"¥1399";
    [self.contentView addSubview:_accountBalancelab];
    
    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [self.contentView  addSubview:line1];
    
    _orderNumberlab = [[UILabel alloc]init];
    _orderNumberlab.textColor = [UIColor colorWithHexString:@"#aaaaaa"];
    _orderNumberlab.textAlignment = NSTextAlignmentLeft;
    _orderNumberlab.font = [UIFont systemFontOfSize:12];
    _orderNumberlab.text = @"交易号：1111111111111";
    [self.contentView addSubview:_orderNumberlab];
    
    [_transactionTypelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@15);
        make.width.equalTo(@180);
        make.height.equalTo(@30);

    }];
    
    [_transactionTimelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_transactionTypelab);
        make.right.equalTo(@-15);
        make.width.equalTo(@150);
        make.height.equalTo(@25);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_transactionTypelab.mas_bottom).with.offset(5);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [tpricelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [abalance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tpricelab.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [_transactionPricelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(tpricelab);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [_accountBalancelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(abalance);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(abalance.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [_orderNumberlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];


}

- (void)layoutCellSubviews {
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

/** 配置Cell */
- (void)configureCell:(DLTransactionRecordModel *)transactionRmodel{

    self.transactionTypelab.text = transactionRmodel.action;
    self.transactionTimelab.text = transactionRmodel.create_time;
    self.transactionPricelab.text  = [NSString stringWithFormat:@"¥ %.2f",[transactionRmodel.amount integerValue]/100.00];
    self.accountBalancelab.text = [NSString stringWithFormat:@"¥ %.2f",[transactionRmodel.balance integerValue]/100.00];
    self.orderNumberlab.text = [NSString stringWithFormat:@"交易号：%@",transactionRmodel.sn];
}

@end
