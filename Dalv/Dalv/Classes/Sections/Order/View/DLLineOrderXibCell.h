//
//  DLLineOrderXibCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLlineOrderModel.h"

@interface DLLineOrderXibCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *lineOrderPicture;/// 订单图片
@property (weak, nonatomic) IBOutlet UILabel *lineOrderNameLabel;/// 订单名称
@property (weak, nonatomic) IBOutlet UILabel *lineOrderTimeLabel;/// 团期时间
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPriceLabel;/// 订单价格(应付金额)
@property (weak, nonatomic) IBOutlet UILabel *lineOrderStateLabel;/// 订单状态

- (void)configureCell:(DLlineOrderModel *)lineOrderModelData;

@end
