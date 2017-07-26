//
//  DLplaneTankCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------- 飞机舱位Cell ------------------

#import <UIKit/UIKit.h>
#import "DLPlaneListDetailModel.h"

@interface DLplaneTankCell : UITableViewCell
/// 舱位
@property (weak, nonatomic) IBOutlet UILabel *tankLabel;
/// 折扣
@property (weak, nonatomic) IBOutlet UILabel *disCountLabel;
/// 顾客看到的钱
@property (weak, nonatomic) IBOutlet UILabel *CustomerMoneyLabel;
/// 顾问看到的钱
@property (weak, nonatomic) IBOutlet UILabel *agencyMoneyLabel;
/// 顾问挣的钱
@property (weak, nonatomic) IBOutlet UILabel *ownMoneyLabel;
/// 剩余票数
@property (weak, nonatomic) IBOutlet UILabel *ticketCountLabel;
/// 预订
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;
/// 总价钱
@property (weak, nonatomic) IBOutlet UILabel *totalMoney;

/// 剩余 / 张
@property (weak, nonatomic) IBOutlet UILabel *left;
@property (weak, nonatomic) IBOutlet UILabel *right;

- (void)configureCell:(DLPlaneListDetailModel *)planeListDetailModelData;

@end
