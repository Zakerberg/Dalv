//
//  DLTransactionRecordTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLTransactionRecordModel.h"
@interface DLTransactionRecordTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *transactionTypelab;//交易类型
@property (nonatomic, strong) UILabel *transactionTimelab;//交易时间
@property (nonatomic, strong) UILabel *transactionPricelab;//交易金额
@property (nonatomic, strong) UILabel *accountBalancelab;//账户余额
@property (nonatomic, strong) UILabel *orderNumberlab;//订单号
@property (nonatomic, strong) DLTransactionRecordModel *transactionRecordModel;


+ (NSString *)cellIdentifier;

- (void)configureCell:(DLTransactionRecordModel *)transactionRmodel;

@end
