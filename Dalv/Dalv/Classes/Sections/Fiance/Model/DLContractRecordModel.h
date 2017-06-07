//
//  DLContractRecordModel.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLContractRecordModel : NSObject
/***  合同记录  ***/
@property (nonatomic, copy) NSString *recordId;
/***  合同审核失败的理由  ***/
@property (nonatomic, copy) NSString *memo;
/***  国内合同申请份数  ***/
@property (nonatomic, copy) NSString *inland_count;
/***  境外合同申请份数  ***/
@property (nonatomic, copy) NSString *outbound_count;
/***  单项委托份数  ***/
@property (nonatomic, copy) NSString *peritem_count;
/***  合同申请时间  ***/
@property (nonatomic, copy) NSString *create_time;
/***  合同状态  ***/
@property (nonatomic, copy) NSString *state;
/***  交易号  ***/
@property (nonatomic, copy) NSString *account;
@end
