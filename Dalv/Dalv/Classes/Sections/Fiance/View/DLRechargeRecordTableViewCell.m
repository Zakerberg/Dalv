//
//  DLRechargeRecordTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRechargeRecordTableViewCell.h"

@implementation DLRechargeRecordTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    _rechargeNamelab = [[UILabel alloc]init];
    _rechargeNamelab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
    _rechargeNamelab.textAlignment = NSTextAlignmentLeft;
    _rechargeNamelab.font = [UIFont systemFontOfSize:16];
    _rechargeNamelab.text = @"充值";
    [self.contentView addSubview:_rechargeNamelab];
    
    _rechargeTimelab = [[UILabel alloc]init];
    _rechargeTimelab.textColor = [UIColor colorWithHexString:@"#aaaaaa"];
    _rechargeTimelab.textAlignment = NSTextAlignmentRight;
    _rechargeTimelab.font = [UIFont systemFontOfSize:12];
    _rechargeTimelab.text = @"2017-06-01 12:20:05";
    [self.contentView addSubview:_rechargeTimelab];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [self.contentView  addSubview:line];
    
    UILabel *rtypeab = [[UILabel alloc]init];
    rtypeab.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    rtypeab.textAlignment = NSTextAlignmentLeft;
    rtypeab.font = [UIFont systemFontOfSize:12];
    rtypeab.text = @"状态";
    [self.contentView addSubview:rtypeab];
    
    UILabel *ramount = [[UILabel alloc]init];
    ramount.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    ramount.textAlignment = NSTextAlignmentLeft;
    ramount.font = [UIFont systemFontOfSize:12];
    ramount.text = @"充值金额";
    [self.contentView addSubview:ramount];
    
    UILabel *sufee = [[UILabel alloc]init];
    sufee.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    sufee.textAlignment = NSTextAlignmentLeft;
    sufee.font = [UIFont systemFontOfSize:12];
    sufee.text = @"系统使用费";
    [self.contentView addSubview:sufee];
    

    UILabel *arrivalab = [[UILabel alloc]init];
    arrivalab.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    arrivalab.textAlignment = NSTextAlignmentLeft;
    arrivalab.font = [UIFont systemFontOfSize:12];
    arrivalab.text = @"实际到账";
    [self.contentView addSubview:arrivalab];
    
    _rechargeTypelab = [[UILabel alloc]init];
    _rechargeTypelab.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    _rechargeTypelab.textAlignment = NSTextAlignmentRight;
    _rechargeTypelab.font = [UIFont systemFontOfSize:12];
    _rechargeTypelab.text = @"审核通过";
    [self.contentView addSubview:_rechargeTypelab];
    
    _rechargeAmountlab = [[UILabel alloc]init];
    _rechargeAmountlab.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _rechargeAmountlab.textAlignment = NSTextAlignmentRight;
    _rechargeAmountlab.font = [UIFont systemFontOfSize:12];
    _rechargeAmountlab.text = @"¥1399";
    [self.contentView addSubview:_rechargeAmountlab];
    
    _backview = [[UIView alloc]init];
    _backview.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
    [self.contentView  addSubview:_backview];
    
    _failureReasonlab = [[UILabel alloc]init];
    _failureReasonlab.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _failureReasonlab.textAlignment = NSTextAlignmentLeft;
    _failureReasonlab.font = [UIFont systemFontOfSize:12];
    _failureReasonlab.text = @"失败原因：";
    [_backview addSubview:_failureReasonlab];
    
    _memolab = [[UILabel alloc]init];
    _memolab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
    _memolab.textAlignment = NSTextAlignmentLeft;
    _memolab.font = [UIFont systemFontOfSize:12];
    _memolab.text = @"提现失败";
    [_backview addSubview:_memolab];
    
    _systemUsageFeelab = [[UILabel alloc]init];
    _systemUsageFeelab.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _systemUsageFeelab.textAlignment = NSTextAlignmentRight;
    _systemUsageFeelab.font = [UIFont systemFontOfSize:12];
    _systemUsageFeelab.text = @"0%";
    [self.contentView addSubview:_systemUsageFeelab];
    
    _actualArrivalab = [[UILabel alloc]init];
    _actualArrivalab.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _actualArrivalab.textAlignment = NSTextAlignmentRight;
    _actualArrivalab.font = [UIFont systemFontOfSize:12];
    _actualArrivalab.text = @"¥1499";
    [self.contentView addSubview:_actualArrivalab];
    
    
    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [self.contentView  addSubview:line1];
    
    _orderNumberlab = [[UILabel alloc]init];
    _orderNumberlab.textColor = [UIColor colorWithHexString:@"#aaaaaa"];
    _orderNumberlab.textAlignment = NSTextAlignmentLeft;
    _orderNumberlab.font = [UIFont systemFontOfSize:12];
    _orderNumberlab.text = @"交易号：1111111111111";
    [self.contentView addSubview:_orderNumberlab];
    
    [_rechargeNamelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
        
    }];
    
    [_rechargeTimelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_rechargeNamelab);
        make.right.equalTo(@-15);
        make.width.equalTo(@150);
        make.height.equalTo(@25);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rechargeNamelab.mas_bottom).with.offset(5);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [rtypeab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [ramount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backview.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [sufee mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ramount.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];

    [arrivalab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sufee.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];

    
    [_rechargeTypelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(rtypeab);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [_backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rechargeTypelab.mas_bottom);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.equalTo(@20);
        
    }];
    
    [_failureReasonlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@10);
        make.width.equalTo(@65);
        make.height.equalTo(@20);
    }];
    
    [_memolab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_failureReasonlab);
        make.left.equalTo(_failureReasonlab.mas_right);
        make.right.equalTo(_backview).offset(-15);
        make.height.equalTo(@20);
    }];
    

    [_rechargeAmountlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ramount);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [_systemUsageFeelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sufee);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];

    [_actualArrivalab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(arrivalab);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];

    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(arrivalab.mas_bottom);
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
- (void)configureCell:(DLRechargeRecordModel *)rechargeModel{
    
    _backview.hidden = YES;

    self.rechargeTimelab.text = rechargeModel.create_time;
    if ([rechargeModel.state isEqualToString:@"1"]) {
        self.rechargeTypelab.text = @"待审核";
    _rechargeTypelab.textColor = [UIColor redColor];
    } else if ([rechargeModel.state isEqualToString:@"2"]){
        self.rechargeTypelab.text = @"审核通过";
        _rechargeTypelab.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    }else if ([rechargeModel.state isEqualToString:@"3"]){
        self.rechargeTypelab.text = @"审核失败";
        _backview.hidden = NO;
        _memolab.text = rechargeModel.memo;
        _rechargeTypelab.textColor = [UIColor redColor];
    }else if ([rechargeModel.state isEqualToString:@"5"]){
        self.rechargeTypelab.text = @"待支付";
        _rechargeTypelab.textColor = [UIColor redColor];
    }else {
        self.rechargeTypelab.text = @"已支付";
        _rechargeTypelab.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    }
    self.rechargeAmountlab.text = [NSString stringWithFormat:@"¥%.2f",[rechargeModel.amount integerValue]/100.00];
    self.systemUsageFeelab.text = [NSString stringWithFormat:@"%.f%%",[rechargeModel.commission_rate integerValue]/1000.00];

    self.actualArrivalab.text = [NSString stringWithFormat:@"¥%.2f",[rechargeModel.actualPrice integerValue]/100.00];
    self.orderNumberlab.text = [NSString stringWithFormat:@"交易号：%@",rechargeModel.account];

}



@end
