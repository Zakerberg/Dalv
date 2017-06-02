//
//  DLCashRegisterViewTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLCashRegisterModel.h"
@interface DLCashRegisterViewTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *transactionTypelab;//交易类型
@property (nonatomic, strong) UILabel *transactionTimelab;//交易时间
@property (nonatomic, strong) UILabel *transactionPricelab;//交易金额
@property (nonatomic, strong) UILabel *accountBalancelab;//账户余额
@property (nonatomic, strong) UILabel *orderNumberlab;//订单号

@property (nonatomic, strong) DLCashRegisterModel *cashRegisterModel;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

/**
 *  配置Cell 数据
 */
- (void)configureCell:(DLCashRegisterModel *)cashModel;

@end
