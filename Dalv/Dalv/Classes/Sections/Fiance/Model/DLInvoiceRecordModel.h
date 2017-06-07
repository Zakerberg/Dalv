//
//  DLInvoiceRecordModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLInvoiceRecordModel : NSObject
/*
 "id": "1115",					发票记录id
 "title": "安广利",					发票公司名称
 "amount": "100.00",				发票金额
 "detail": "旅游费",				发票项目
 "create_time": "2017-05-16 15:17:27", 发票记录创建时间
 "state": "1",						发票状态
 "memo": null,					发票审核失败的理由
 "detail_comm": "代订机票"			发票备注
 */

/*** 发票记录id ***/
@property(nonatomic,strong) UILabel *invoiceid;
/*** 发票公司名称 ***/
@property(nonatomic,strong) UILabel *title;
/*** 发票金额 ***/
@property(nonatomic,strong) UILabel *amount;
/*** 发票项目 ***/
@property(nonatomic,strong) UILabel *detail;
/*** 发票记录创建时间 ***/
@property(nonatomic,strong) UILabel *create_time;
/*** 发票状态 ***/
@property(nonatomic,strong) UILabel *state;
/*** 发票审核失败的理由 ***/
@property(nonatomic,strong) UILabel *memo;
/*** 发票备注 ***/
@property(nonatomic,strong) UILabel *detail_comm;

@end
