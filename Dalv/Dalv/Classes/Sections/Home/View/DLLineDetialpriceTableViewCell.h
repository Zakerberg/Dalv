//
//  DLLineDetialpriceTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLineTourDetailInforModel.h"

@interface DLLineDetialpriceTableViewCell : UITableViewCell

/**
 *  Cell 重用ID
 */
+ (NSString *)cellIdentifier;

/** 配置Cell */
- (void)configureCell:(DLLineTourDetailInforModel *)lineTourDetailInforModel;

@end
