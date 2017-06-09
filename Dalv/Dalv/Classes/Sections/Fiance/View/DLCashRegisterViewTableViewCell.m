//
//  DLCashRegisterViewTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCashRegisterViewTableViewCell.h"

@implementation DLCashRegisterViewTableViewCell

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
    _transactionTypelab.text = @"提现";
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
    tpricelab.text = @"提现状态";
    [self.contentView addSubview:tpricelab];
    
    UILabel *abalance = [[UILabel alloc]init];
    abalance.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    abalance.textAlignment = NSTextAlignmentLeft;
    abalance.font = [UIFont systemFontOfSize:12];
    abalance.text = @"提现金额";
    [self.contentView addSubview:abalance];
    
    _transactionPricelab = [[UILabel alloc]init];
    _transactionPricelab.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    _transactionPricelab.textAlignment = NSTextAlignmentRight;
    _transactionPricelab.font = [UIFont systemFontOfSize:12];
    _transactionPricelab.text = @"处理完成";
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
        make.width.equalTo(@150);
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
- (void)configureCell:(DLCashRegisterModel *)cashModel{
    
    if ([cashModel.state isEqualToString:@"1"]) {
        self.transactionPricelab.text = @"待审核";
        _transactionPricelab.textColor = [UIColor redColor];
    } else if ([cashModel.state isEqualToString:@"2"]){
        self.transactionPricelab.text = @"以确认，待财务处理";
        _transactionPricelab.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    }else if ([cashModel.state isEqualToString:@"3"]){
        self.transactionPricelab.text = @"审核失败";
        _transactionPricelab.textColor = [UIColor redColor];
    }else {
        self.transactionPricelab.text = @"已支付";
        _transactionPricelab.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    }
    self.transactionTimelab.text = cashModel.create_time;
    self.accountBalancelab.text  = [NSString stringWithFormat:@"¥ %@",cashModel.amount];
    self.orderNumberlab.text = [NSString stringWithFormat:@"交易号：%@",cashModel.account];
}


@end
