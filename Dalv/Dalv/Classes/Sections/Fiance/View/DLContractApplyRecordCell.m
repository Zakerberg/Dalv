//
//  DLContractApplyRecordCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplyRecordCell.h"

@implementation DLContractApplyRecordCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    _contractNameLabel = [[UILabel alloc]init];
    _contractNameLabel.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
    _contractNameLabel.textAlignment = NSTextAlignmentLeft;
    _contractNameLabel.font = [UIFont systemFontOfSize:16];
    _contractNameLabel.text = @"合同申请";
    [self.contentView addSubview:_contractNameLabel];
    
    _contractTimeLabel = [[UILabel alloc]init];
    _contractTimeLabel.textColor = [UIColor colorWithHexString:@"#aaaaaa"];
    _contractTimeLabel.textAlignment = NSTextAlignmentRight;
    _contractTimeLabel.font = [UIFont systemFontOfSize:12];
    _contractTimeLabel.text = @"2017-06-01 12:20:05";
    [self.contentView addSubview:_contractTimeLabel];
    
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [self.contentView  addSubview:line];
    
    UILabel *ContractType = [[UILabel alloc]init];
    ContractType.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    ContractType.textAlignment = NSTextAlignmentLeft;
    ContractType.font = [UIFont systemFontOfSize:12];
    ContractType.text = @"状态";
    [self.contentView addSubview:ContractType];
    
    UILabel *ContractInLandCount = [[UILabel alloc]init];
    ContractInLandCount.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    ContractInLandCount.textAlignment = NSTextAlignmentLeft;
    ContractInLandCount.font = [UIFont systemFontOfSize:12];
    ContractInLandCount.text = @"国内合同申请份数";
    [self.contentView addSubview:ContractInLandCount];
    
    
    UILabel *ContractOutboundCount = [[UILabel alloc]init];
    ContractOutboundCount.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    ContractOutboundCount.textAlignment = NSTextAlignmentLeft;
    ContractOutboundCount.font = [UIFont systemFontOfSize:12];
    ContractOutboundCount.text = @"境外合同申请份数";
    [self.contentView addSubview:ContractOutboundCount];
    
    UILabel *ContractPeritemCount = [[UILabel alloc]init];
    ContractPeritemCount.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    ContractPeritemCount.textAlignment = NSTextAlignmentLeft;
    ContractPeritemCount.font = [UIFont systemFontOfSize:12];
    ContractPeritemCount.text = @"单项委托份数";
    [self.contentView addSubview:ContractPeritemCount];
    
    _contractTypelabel = [[UILabel alloc]init];
    _contractTypelabel.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    _contractTypelabel.textAlignment = NSTextAlignmentRight;
    _contractTypelabel.font = [UIFont systemFontOfSize:12];
    _contractTypelabel.text = @"审核通过";
    [self.contentView addSubview:_contractTypelabel];
    
    
    _contractInlandCount = [[UILabel alloc]init];
    _contractInlandCount.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _contractInlandCount.textAlignment = NSTextAlignmentRight;
    _contractInlandCount.font = [UIFont systemFontOfSize:12];
    _contractInlandCount.text = @"5份";
    [self.contentView addSubview:_contractInlandCount];
    
    _contractOutboundCount = [[UILabel alloc]init];
    _contractOutboundCount.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _contractOutboundCount.textAlignment = NSTextAlignmentRight;
    _contractOutboundCount.font = [UIFont systemFontOfSize:12];
    _contractOutboundCount.text = @"5份";
    [self.contentView addSubview:_contractOutboundCount];
    
    
    _contractPeritemCount = [[UILabel alloc]init];
    _contractPeritemCount.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _contractPeritemCount.textAlignment = NSTextAlignmentRight;
    _contractPeritemCount.font = [UIFont systemFontOfSize:12];
    _contractPeritemCount.text = @"5份";
    [self.contentView addSubview:_contractPeritemCount];
    
    
    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [self.contentView  addSubview:line1];
    
    _contractOrderNumber = [[UILabel alloc]init];
    _contractOrderNumber.textColor = [UIColor colorWithHexString:@"#aaaaaa"];
    _contractOrderNumber.textAlignment = NSTextAlignmentLeft;
    _contractOrderNumber.font = [UIFont systemFontOfSize:12];
    _contractOrderNumber.text = @"交易号：1111111111111";
    [self.contentView addSubview:_contractOrderNumber];
    
    [_contractNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
        
    }];
    
    [_contractTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_contractNameLabel);
        make.right.equalTo(@-15);
        make.width.equalTo(@150);
        make.height.equalTo(@25);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contractNameLabel.mas_bottom).with.offset(5);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [ContractType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [ContractInLandCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ContractType.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [ContractOutboundCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ContractInLandCount.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [ContractPeritemCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ContractOutboundCount.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    
    [_contractTypelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ContractType);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [_contractInlandCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ContractInLandCount);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [_contractOutboundCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ContractOutboundCount);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [_contractPeritemCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ContractPeritemCount);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ContractPeritemCount.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [_contractOrderNumber mas_makeConstraints:^(MASConstraintMaker *make) {
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
- (void)configureCell:(DLContractRecordModel *)contractRecordModel{
    
    self.contractTimeLabel.text = contractRecordModel.create_time;
    if ([contractRecordModel.state isEqualToString:@"1"]) {
        self.contractTypelabel.text = @"待审核";
        _contractTypelabel.textColor = [UIColor redColor];
    } else if ([contractRecordModel.state isEqualToString:@"2"]){
        self.contractTypelabel.text = @"审核通过";
        _contractTypelabel.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    }else if ([contractRecordModel.state isEqualToString:@"3"]){
        self.contractTypelabel.text = @"审核失败";
        _contractTypelabel.textColor = [UIColor redColor];
    }else if ([contractRecordModel.state isEqualToString:@"5"]){
        self.contractTypelabel.text = @"待支付";
        _contractTypelabel.textColor = [UIColor redColor];
    }else {
        self.contractTypelabel.text = @"已支付";
        _contractTypelabel.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    }
    self.contractInlandCount.text = [NSString stringWithFormat:@"%@份",contractRecordModel.inland_count];
    self.contractOutboundCount.text = [NSString stringWithFormat:@"%@份",contractRecordModel.outbound_count];
    
    self.contractPeritemCount.text = [NSString stringWithFormat:@"%@份",contractRecordModel.peritem_count];
    
    self.contractOrderNumber.text = [NSString stringWithFormat:@"交易号：%@",contractRecordModel.account];
    
}


@end
