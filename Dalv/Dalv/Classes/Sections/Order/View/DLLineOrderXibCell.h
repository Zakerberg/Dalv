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
@property (weak, nonatomic) IBOutlet UIImageView *lineOrderPicture;
@property (weak, nonatomic) IBOutlet UILabel *lineOrderNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lineOrderTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lineOrderPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *lineOrderStateLabel; 

- (void)configureCell:(DLlineOrderModel *)lineOrderModelData;

@end
