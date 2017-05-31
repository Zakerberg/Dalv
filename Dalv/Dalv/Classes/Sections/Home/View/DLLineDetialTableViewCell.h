//
//  DLLineDetialTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLineSchedulingTableViewCell.h"

/** 线路详情cell*/
@interface DLLineDetialTableViewCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray <DLLineTourDetailDaysModel *> *schedulingArray;//日程安排数据

/**
 *  Cell 重用ID
 */
+ (NSString *)cellIdentifier;

/** 配置Cell */
- (void)configureCell:(NSString *)htmlSting;

@end
