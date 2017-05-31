//
//  DLLineSchedulingTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLineTourDetailDaysModel.h"

/** 线路详情日程安排cell*/
@interface DLLineSchedulingTableViewCell : UITableViewCell

/**
 *  Cell 重用ID
 */
+ (NSString *)cellIdentifier;

/** 配置Cell */
- (void)configureCell:(DLLineTourDetailDaysModel *)detailDaysModel indexPath:(NSIndexPath *)indexPath;

@end
