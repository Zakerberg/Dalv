//
//  DLRechargeRecordModel.h
//  Dalv
//
//  Created by Nie on 2017/6/1.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 测试顾问财务管理->充值申请记录接口 */

@interface DLRechargeRecordModel : NSObject

/** 充值金额/100 */
@property (nonatomic, copy) NSString *amount;
/** 交易号 */
@property (nonatomic, copy) NSString *account;
/** 系统使用费（这个属性这里不处理） */
@property (nonatomic, copy) NSString *systemUsageFee;
/** 充值记录id */
@property (nonatomic, copy) NSString *recordId;
/** 充值审核失败的原因 */
@property (nonatomic, copy) NSString *memo;
/** 系统使用费 */
@property (nonatomic, copy) NSString *commission_rate;
/** 实际到账 */
@property (nonatomic, copy) NSString *actualPrice;
/** 充值时间 */
@property (nonatomic, copy) NSString *create_time;
/** 汇款方 */
@property (nonatomic, copy) NSString *payer;
/** 充值状态 */
@property (nonatomic, copy) NSString *state;


@end
