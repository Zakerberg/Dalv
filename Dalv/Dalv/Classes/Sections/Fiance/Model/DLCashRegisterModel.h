//
//  DLCashRegisterModel.h
//  Dalv
//
//  Created by Nie on 2017/6/2.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 测试顾问财务管理->提现记录列表接口 */
@interface DLCashRegisterModel : NSObject

/** 支付流水号Id */
@property (nonatomic, copy) NSString *withdrawalsId;
/** 提现金额 */
@property (nonatomic, copy) NSString *amount;
/** 交易时间 */
@property (nonatomic, copy) NSString *create_time;
/** 状态*/
@property (nonatomic, copy) NSString *state;
/** 订单号*/
@property (nonatomic, copy) NSString *sn;
/** 提现审核失败后的理由*/
@property (nonatomic, copy) NSString *memo;

@end
