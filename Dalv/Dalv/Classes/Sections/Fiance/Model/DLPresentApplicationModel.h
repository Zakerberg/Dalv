//
//  DLPresentApplicationModel.h
//  Dalv
//
//  Created by Nie on 2017/6/12.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 测试顾问财务管理->提现申请页面接口 */

@interface DLPresentApplicationModel : NSObject
/** 顾问id */
@property (nonatomic, copy) NSString *presentAppId;
/** 顾问姓名 */
@property (nonatomic, copy) NSString *name;
/** 运营商id（1北京，3天津，4石家庄，5唐山） */
@property (nonatomic, copy) NSString *operator_id;
/** 顾问手机号码 */
@property (nonatomic, copy) NSString *mobile;
/** 顾问修改的title */
@property (nonatomic, copy) NSString *share_home_title;
/** 账户总额*/
@property (nonatomic, copy) NSString *account_balance;
/** 银行账号 */
@property (nonatomic, copy) NSString *bank_account;
/** 银行名称*/
@property (nonatomic, copy) NSString *bank_name;
/** 账户状态（如果不等于1，则被冻结）*/
@property (nonatomic, copy) NSString *account_state;
/** 可提现额度 */
@property (nonatomic, copy) NSString *availableBalance;


@end
