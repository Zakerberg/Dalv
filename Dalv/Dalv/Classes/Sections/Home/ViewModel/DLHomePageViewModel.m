//
//  DLHomePageViewModel.m
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomePageViewModel.h"
#import "DLHomeMenuItem.h"

@implementation DLHomePageViewModel

+ (NSArray *)creatMenuItems {
    return [self createItemsForManger:YES showContract:NO];
}

+ (NSArray *)createItemsForManger:(BOOL)isManager showContract:(BOOL)showContract {

    DLHomeMenuItem *memberLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"surrounding_tourism"] name:@"周边游" selector:NSSelectorFromString(@"didTapMemberLib")];
    DLHomeMenuItem *privateLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"outbound_tourism"] name:@"出境游" selector:NSSelectorFromString(@"free-exercise")];
    DLHomeMenuItem *tempLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"special_offe"] name:@"特价" selector:NSSelectorFromString(@"didTapTempLib")];
    DLHomeMenuItem *liberumLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"free_walker"] name:@"自由行" selector:NSSelectorFromString(@"didTapLiberumLib")];
    
    DLHomeMenuItem *remind = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"passenger_ticket"] name:@"机票" selector:NSSelectorFromString(@"didTapRemind")];
    DLHomeMenuItem *search = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"domestic-travel"] name:@"国内游" selector:NSSelectorFromString(@"didTapLiberumLib")];
    
    return @[memberLib, privateLib, tempLib, liberumLib,remind,search];
 }

+ (NSArray *)creatFianceMenuItems {
    DLHomeMenuItem *memberLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"transaction_record"] name:@"交易记录" selector:NSSelectorFromString(@"didTapMemberLib")];
    DLHomeMenuItem *privateLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"recharge_application"] name:@"充值申请" selector:NSSelectorFromString(@"free-exercise")];
    DLHomeMenuItem *tempLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"recharge_record"] name:@"充值记录" selector:NSSelectorFromString(@"didTapTempLib")];
    DLHomeMenuItem *liberumLib = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"present_application"] name:@"提现申请" selector:NSSelectorFromString(@"didTapLiberumLib")];
    
    DLHomeMenuItem *remind = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"cash_register"] name:@"提现记录" selector:NSSelectorFromString(@"didTapRemind")];
    DLHomeMenuItem *search = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"invoice_application"] name:@"发票申请" selector:NSSelectorFromString(@"didTapLiberumLib")];
    
    DLHomeMenuItem *search1 = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"invoice_record"] name:@"发票记录" selector:NSSelectorFromString(@"didTapLiberumLib")];
    DLHomeMenuItem *search2 = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"contract_application"] name:@"合同申请" selector:NSSelectorFromString(@"didTapLiberumLib")];
    DLHomeMenuItem *search3 = [DLHomeMenuItem itemWithImage:[UIImage imageNamed:@"contract_record"] name:@"合同记录" selector:NSSelectorFromString(@"didTapLiberumLib")];
    return @[memberLib, privateLib, tempLib, liberumLib,remind,search,search1,search2,search3];

}
@end
