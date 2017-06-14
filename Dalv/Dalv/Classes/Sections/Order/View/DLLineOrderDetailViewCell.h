//
//  DLLineOrderDetailViewCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLineOrderDetailModel.h"

@interface DLLineOrderDetailViewCell : UITableViewCell
/*** 订单名称 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderNameLabel;
/*** 订单状态 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderStateLabel;
/*** 订单创建时间 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderCreatTimeLabel;
/*** 订单图片 ***/
@property (weak, nonatomic) IBOutlet UIImageView *lineOrderPicImageView;
/*** 订单成人数量 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderAdultCountLabel;
/*** 订单儿童数量 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderChildCountLabel;
/*** 订单团期时间 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderStartTimeLabel;
/*** 订单金额 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPriceTotaLabel;
/*** 订单调整金额 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPriceAdjustLabel;
/*** 订单应付金额 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPayableLabel;
/*** 订单特别说明 ***/
@property (weak, nonatomic) IBOutlet UILabel *lineOrderMemoLabel;

/*** lineId ***/
@property(nonatomic,strong) NSString * lineId;




- (void)configureCell:(DLLineOrderDetailModel *)lineOrderDetailModelData ;









@end
