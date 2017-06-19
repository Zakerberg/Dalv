//
//  DLBankTransferModel.h
//  Dalv
//
//  Created by Nie on 2017/6/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLBankTransferModel : NSObject

/** 开户行*/
@property (nonatomic, copy) NSString *opening_bank;
/** 账号 */
@property (nonatomic, copy) NSString *account;
/** 开户名 */
@property (nonatomic, copy) NSString *account_name;

@end
