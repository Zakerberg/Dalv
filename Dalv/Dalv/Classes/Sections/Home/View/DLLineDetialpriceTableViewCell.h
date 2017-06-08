//
//  DLLineDetialpriceTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLineTourDetailInforModel.h"

@protocol DLLineDetialTableViewCellDelegate <NSObject>

@optional

- (void)segmentTapDelegate:(NSUInteger  )index;
- (void)didClickButtonDelegate:(UIButton *)button;

@end

/** 线路详情cell*/
@interface DLLineDetialpriceTableViewCell : UITableViewCell

@property (nonatomic , weak) id <DLLineDetialTableViewCellDelegate>delegate;

@property (nonatomic, strong) DLLineTourDetailInforModel *detaiInfoModel;

@property (nonatomic, strong)void(^btnClick)();


/**
 *  Cell 重用ID
 */
+ (NSString *)cellIdentifier;

/** 配置Cell */
- (void)configureCell:(DLLineTourDetailInforModel *)lineTourDetailInforModel;

@end
