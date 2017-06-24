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

/** 顾问姓名 **/
@property(nonatomic,strong) UILabel *nameLabel;
/** 顾问积分 **/
@property(nonatomic,strong) UILabel *integralLabel;
/** 头像 **/
@property(nonatomic,strong) UIImageView *headImageView;
/** 工作时间 **/
@property(nonatomic,strong) UILabel *workingTimeLabel;

/** Cell 重用ID */
+(NSString *)cellIdentifier;

/**
 *  配置Cell 数据
 */
- (void)configureCell:(DLMyAgencyUnBindingModel *)myAgencyUnBindingModelData;

@end
