//
//  DLHomePageViewModel.m
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomePageViewModel.h"
#import "DLFinanceMenuItem.h"

@implementation DLHomePageViewModel

+ (NSArray *)creatFianceMenuItems {
   DLFinanceMenuItem *memberLib = [DLFinanceMenuItem itemWithImage:[UIImage imageNamed:@"transaction_record"] name:@"交易记录" selector:NSSelectorFromString(@"didTapMemberLib")];
   DLFinanceMenuItem *privateLib = [DLFinanceMenuItem itemWithImage:[UIImage imageNamed:@"recharge_application"] name:@"充值申请" selector:NSSelectorFromString(@"free-exercise")];
   DLFinanceMenuItem *tempLib = [DLFinanceMenuItem itemWithImage:[UIImage imageNamed:@"recharge_record"] name:@"充值记录" selector:NSSelectorFromString(@"didTapTempLib")];
   DLFinanceMenuItem *liberumLib = [DLFinanceMenuItem itemWithImage:[UIImage imageNamed:@"present_application"] name:@"提现申请" selector:NSSelectorFromString(@"didTapLiberumLib")];
    
   DLFinanceMenuItem *remind = [DLFinanceMenuItem itemWithImage:[UIImage imageNamed:@"cash_register"] name:@"提现记录" selector:NSSelectorFromString(@"didTapRemind")];
   DLFinanceMenuItem *search = [DLFinanceMenuItem itemWithImage:[UIImage imageNamed:@"invoice_application"] name:@"发票申请" selector:NSSelectorFromString(@"didTapLiberumLib")];
    
   DLFinanceMenuItem *search1 = [DLFinanceMenuItem itemWithImage:[UIImage imageNamed:@"invoice_record"] name:@"发票记录" selector:NSSelectorFromString(@"didTapLiberumLib")];
   DLFinanceMenuItem *search2 = [DLFinanceMenuItem itemWithImage:[UIImage imageNamed:@"contract_application"] name:@"合同申请" selector:NSSelectorFromString(@"didTapLiberumLib")];
   DLFinanceMenuItem *search3 = [DLFinanceMenuItem itemWithImage:[UIImage imageNamed:@"contract_record"] name:@"合同记录" selector:NSSelectorFromString(@"didTapLiberumLib")];
    return @[memberLib, privateLib, tempLib, liberumLib,remind,search,search1,search2,search3];

}
@end
