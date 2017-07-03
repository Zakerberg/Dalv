//
//  DLMyAgencyUnBindingCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLMyAgencyUnBindingModel.h"

@interface DLMyAgencyUnBindingCell : UITableViewCell
@property(nonatomic,strong) UILabel *nameLabel;/// 顾问姓名
@property(nonatomic,strong) UILabel *integralLabel;/// 顾问积分
@property(nonatomic,strong) UIImageView *headImageView;/// 头像
@property(nonatomic,strong) UILabel *workingTimeLabel;/// 工作时间
@property(nonatomic,strong) UIImageView *sexImageView;/// 顾问性别
@property (nonatomic, strong) DLMyAgencyUnBindingModel *myAgencyUnBindingModel;

/** Cell 重用ID */
+(NSString *)cellIdentifier;

/**
 *  配置Cell 数据
 */
- (void)configureCell:(DLMyAgencyUnBindingModel *)myAgencyUnBindingModelData;

@end
