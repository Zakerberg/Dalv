//
//  DLInvoiceApplyRecordCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLInvoiceApplyRecordCell.h"

@implementation DLInvoiceApplyRecordCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    _invoiceNameLabel = [[UILabel alloc]init];
    _invoiceNameLabel.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
    _invoiceNameLabel.textAlignment = NSTextAlignmentLeft;
    _invoiceNameLabel.font = [UIFont systemFontOfSize:16];
    _invoiceNameLabel.text = @"发票申请";
    [self.contentView addSubview:_invoiceNameLabel];
    
    _invoiceTimeLabel = [[UILabel alloc]init];
    _invoiceTimeLabel.textColor = [UIColor colorWithHexString:@"#aaaaaa"];
    _invoiceTimeLabel.textAlignment = NSTextAlignmentRight;
    _invoiceTimeLabel.font = [UIFont systemFontOfSize:12];
    _invoiceTimeLabel.text = @"2017-06-01 12:20:05";
    [self.contentView addSubview:_invoiceTimeLabel];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [self.contentView  addSubview:line];
    
    UILabel *InvoiceType = [[UILabel alloc]init];
    InvoiceType.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    InvoiceType.textAlignment = NSTextAlignmentLeft;
    InvoiceType.font = [UIFont systemFontOfSize:12];
    InvoiceType.text = @"状态:";
    [self.contentView addSubview:InvoiceType];
    
    
    _backview = [[UIView alloc]init];
    _backview.backgroundColor = [UIColor colorWithHexString:@"#f1f1f1"];
    [self.contentView addSubview:_backview];
    
    
    UILabel *fail = [[UILabel  alloc] init];
    fail.textColor = [UIColor colorWithHexString:@"#ff7735"];
    fail.textAlignment = NSTextAlignmentLeft;
    fail.font = [UIFont systemFontOfSize:12];
    fail.text = @"失败原因：";
    
    [_backview addSubview:fail];
    
    
    UILabel *failMemoLabel = [[UILabel alloc] init];
    self.failMemoLabel = failMemoLabel;
    failMemoLabel.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
    failMemoLabel.textAlignment = NSTextAlignmentLeft;
    failMemoLabel.font = [UIFont systemFontOfSize:12];
    failMemoLabel.text = @"提现失败";
    [_backview addSubview:failMemoLabel];
    
    
    UILabel *InvoiceCompany = [[UILabel alloc]init];
    InvoiceCompany.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    InvoiceCompany.textAlignment = NSTextAlignmentLeft;
    InvoiceCompany.font = [UIFont systemFontOfSize:12];
    InvoiceCompany.text = @"发票抬头:";
    [self.contentView addSubview:InvoiceCompany];

    UILabel *InvoiceProject = [[UILabel alloc]init];
    InvoiceProject.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    InvoiceProject.textAlignment = NSTextAlignmentLeft;
    InvoiceProject.font = [UIFont systemFontOfSize:12];
    InvoiceProject.text = @"发票项目:";
    [self.contentView addSubview:InvoiceProject];

    UILabel *InvoiceAmount = [[UILabel alloc]init];
    InvoiceAmount.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    InvoiceAmount.textAlignment = NSTextAlignmentLeft;
    InvoiceAmount.font = [UIFont systemFontOfSize:12];
    InvoiceAmount.text = @"发票金额:";
    [self.contentView addSubview:InvoiceAmount];
    
    _invoiceTypeLabel = [[UILabel alloc]init];
    _invoiceTypeLabel.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    _invoiceTypeLabel.textAlignment = NSTextAlignmentRight;
    _invoiceTypeLabel.font = [UIFont systemFontOfSize:12];
    _invoiceTypeLabel.text = @"审核通过";
    [self.contentView addSubview:_invoiceTypeLabel];

    
    _invoiceCompanyLabel = [[UILabel alloc]init];
    _invoiceCompanyLabel.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _invoiceCompanyLabel.textAlignment = NSTextAlignmentRight;
    _invoiceCompanyLabel.font = [UIFont systemFontOfSize:12];
    _invoiceCompanyLabel.text = @"5份";
    [self.contentView addSubview:_invoiceCompanyLabel];
    
    _invoiceProjectLabel = [[UILabel alloc]init];
    _invoiceProjectLabel.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _invoiceProjectLabel.textAlignment = NSTextAlignmentRight;
    _invoiceProjectLabel.font = [UIFont systemFontOfSize:12];
    _invoiceProjectLabel.text = @"5份";
    [self.contentView addSubview:_invoiceProjectLabel];
    
    
    _invoiceAmountLabel = [[UILabel alloc]init];
    _invoiceAmountLabel.textColor = [UIColor colorWithHexString:@"#ff7735"];
    _invoiceAmountLabel.textAlignment = NSTextAlignmentRight;
    _invoiceAmountLabel.font = [UIFont systemFontOfSize:12];
    _invoiceAmountLabel.text = @"5份";
    [self.contentView addSubview:_invoiceAmountLabel];
    
    
    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [self.contentView  addSubview:line1];
    
    _invoiceOrderNumberLabel = [[UILabel alloc]init];
    _invoiceOrderNumberLabel.textColor = [UIColor colorWithHexString:@"#aaaaaa"];
    _invoiceOrderNumberLabel.textAlignment = NSTextAlignmentLeft;
    _invoiceOrderNumberLabel.font = [UIFont systemFontOfSize:12];
    _invoiceOrderNumberLabel.text = @"交易号：1111111111111";
    [self.contentView addSubview:_invoiceOrderNumberLabel];
    
    [_invoiceNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
        
    }];

    
    [_invoiceTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_invoiceNameLabel);
        make.right.equalTo(@-15);
        make.width.equalTo(@150);
        make.height.equalTo(@25);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_invoiceNameLabel.mas_bottom).with.offset(5);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [InvoiceType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    

    [_backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(InvoiceType.mas_bottom);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.equalTo(@20);
    }];
    
    [fail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@10);
        make.width.equalTo(@65);
        make.height.equalTo(@20);
    }];
    
    
    [failMemoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(fail);
        make.left.equalTo(fail.mas_right);
        make.right.equalTo(_backview).offset(-15);
        make.height.equalTo(@20);
    }];
    
    
    [InvoiceCompany mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom).offset(-120);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [InvoiceProject mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(InvoiceCompany.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [InvoiceAmount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(InvoiceProject.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    
    [_invoiceTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(InvoiceType);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [_invoiceCompanyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(InvoiceCompany);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [_invoiceProjectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(InvoiceProject);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [_invoiceAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(InvoiceAmount);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(InvoiceAmount.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [_invoiceOrderNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

/** 配置Cell */
-(void)configureCell:(DLInvoiceRecordModel *)invoiceRecordModel{
    
    _backview.hidden = YES;

    self.invoiceTimeLabel.text = invoiceRecordModel.create_time;
    
    if ([invoiceRecordModel.state isEqualToString:@"1"]) {
        self.invoiceTypeLabel.text = @"未审核";
        _invoiceTypeLabel.textColor = [UIColor redColor];
    } else if ([invoiceRecordModel.state isEqualToString:@"2"]){
        self.invoiceTypeLabel.text = @"审核通过";
        _invoiceTypeLabel.textColor = [UIColor colorWithHexString:@"#5fc82b"];
    }else if ([invoiceRecordModel.state isEqualToString:@"3"]){
        self.invoiceTypeLabel.text = @"审核失败";
            _backview.hidden = NO;
            _failMemoLabel.text = invoiceRecordModel.memo;

        _invoiceTypeLabel.textColor = [UIColor redColor];
    }
    self.invoiceCompanyLabel.text = [NSString stringWithFormat:@"%@",invoiceRecordModel.title];
    self.invoiceProjectLabel.text = [NSString stringWithFormat:@"%@",invoiceRecordModel.detail];
    
    self.invoiceAmountLabel.text = [NSString stringWithFormat:@"%@",invoiceRecordModel.amount];
    
    self.invoiceOrderNumberLabel.text = [NSString stringWithFormat:@"交易号：%@",invoiceRecordModel.account];
}

@end
