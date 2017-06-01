//
//  DLRechargeRecordTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLRechargeRecordTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *rechargeNamelab;//充值方式
@property (nonatomic, strong) UILabel *rechargeTimelab;//充值时间
@property (nonatomic, strong) UILabel *rechargeTypelab;//状态
@property (nonatomic, strong) UILabel *rechargeAmountlab;//充值金额
@property (nonatomic, strong) UILabel *systemUsageFeelab;//系统使用费
@property (nonatomic, strong) UILabel *actualArrivalab;//实际到账
@property (nonatomic, strong) UILabel *orderNumberlab;//订单号

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

@end
