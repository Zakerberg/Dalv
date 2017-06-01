//
//  DLTransactionRecordModel.h
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 测试顾问财务管理->交易记录接口 */
@interface DLTransactionRecordModel : NSObject

/** 交易类型 */
@property (nonatomic, copy) NSString *action;
/** 支付流水号Id */
@property (nonatomic, copy) NSString *payId;
/** 交易金额 */
@property (nonatomic, copy) NSString *amount;
/** 交易时间 */
@property (nonatomic, copy) NSString *create_time;
/** 账户余额址*/
@property (nonatomic, copy) NSString *balance;
/** 订单号*/
@property (nonatomic, copy) NSString *sn;
@end
