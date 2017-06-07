//
//  DLContractApplyRecordCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLContractRecordModel.h"

@interface DLContractApplyRecordCell : UITableViewCell
//方式
@property (nonatomic, strong) UILabel *contractNameLabel;
//状态
@property (nonatomic, strong) UILabel *contractTypelabel;
//时间
@property (nonatomic, strong) UILabel *contractTimeLabel;
//国内合同份数
@property (nonatomic, strong) UILabel *contractInlandCount;
//境外合同份数
@property (nonatomic, strong) UILabel *contractOutboundCount;
//单项委托
@property (nonatomic, strong) UILabel *contractPeritemCount;
//订单号
@property (nonatomic, strong) UILabel *contractOrderNumber;

@property (nonatomic, strong) DLContractRecordModel *contractRecordModel;

/** Cell 重用ID */
+(NSString *)cellIdentifier;

/**
 *  配置Cell 数据
 */
- (void)configureCell:(DLContractRecordModel *)contractRecordModel;

@end
