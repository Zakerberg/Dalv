//
//  DLLineOrderPriceTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLPlaceLineOrderModel.h"

@interface DLLineOrderPriceTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *lineOederNamelab;
@property (nonatomic, strong) UILabel *perrAdultlab;
@property (nonatomic, strong) UILabel *preeChildlab;
@property (nonatomic, strong) UILabel *singleRoomDifferencelab;

@property (nonatomic, strong) DLPlaceLineOrderModel *lineOrderoModel;


/** Cell 重用ID */
+ (NSString *)cellIdentifier;

/** 配置Cell */
- (void)configureCell:(DLPlaceLineOrderModel *)placeLineOrderModel;


@end
