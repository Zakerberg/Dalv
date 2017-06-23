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

/*** 名称 ***/
@property(nonatomic,strong) UILabel *invoiceNameLabel;
/*** 申请时间 ***/
@property(nonatomic,strong) UILabel *invoiceTimeLabel;
/*** 状态 ***/
@property(nonatomic,strong) UILabel *invoiceTypeLabel;
/*** 发票抬头 ***/
@property(nonatomic,strong) UILabel *invoiceCompanyLabel;
/*** 发票项目 ***/
@property(nonatomic,strong) UILabel *invoiceProjectLabel;
/*** 发票金额 ***/
@property(nonatomic,strong) UILabel *invoiceAmountLabel;
/*** 交易号 ***/
@property(nonatomic,strong) UILabel *invoiceOrderNumberLabel;

@property(nonatomic,strong) DLInvoiceRecordModel * invoiceModel;

/*** 失败原因 ***/
@property(nonatomic,strong) UILabel *failMemoLabel;

@property(nonatomic,strong) UIView * backview;


/** Cell 重用ID */
+(NSString *)cellIdentifier;

/**
 *  配置Cell 数据
 */
- (void)configureCell:(DLInvoiceRecordModel *)invoiceRecordModel;

@end
