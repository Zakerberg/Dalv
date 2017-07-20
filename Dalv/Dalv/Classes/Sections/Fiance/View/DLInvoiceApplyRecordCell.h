//
//  DLInvoiceApplyRecordCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//    ------------     发票申请记录   ------------

#import <UIKit/UIKit.h>
#import "DLInvoiceRecordModel.h"

@interface DLInvoiceApplyRecordCell : UITableViewCell
@property(nonatomic,strong) UILabel *invoiceNameLabel;
@property(nonatomic,strong) UILabel *invoiceTimeLabel;
@property(nonatomic,strong) UILabel *invoiceTypeLabel;
@property(nonatomic,strong) UILabel *invoiceCompanyLabel;
@property(nonatomic,strong) UILabel *invoiceProjectLabel;
@property(nonatomic,strong) UILabel *invoiceAmountLabel;
@property(nonatomic,strong) UILabel *invoiceOrderNumberLabel;
@property(nonatomic,strong) DLInvoiceRecordModel * invoiceModel;
@property(nonatomic,strong) UILabel *failMemoLabel;
@property(nonatomic,strong) UIView * backview;

+(NSString *)cellIdentifier;

- (void)configureCell:(DLInvoiceRecordModel *)invoiceRecordModel;

@end
