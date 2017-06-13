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

/* 订单图片 */
@property (weak, nonatomic) IBOutlet UIImageView *lineOrderPicture;
/* 订单名称 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderNameLabel;
/* 团期时间 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderTimeLabel;
/* 订单价格(应付金额) */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPriceLabel;
/* 订单状态 */
@property (weak, nonatomic) IBOutlet UILabel *lineOrderStateLabel;
#pragma mark - configure



- (void)configureCell:(DLlineOrderModel *)lineOrderModelData ;




@end
