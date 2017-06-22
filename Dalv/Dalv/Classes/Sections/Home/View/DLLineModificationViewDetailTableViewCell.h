//
//  DLLineModificationViewDetailTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLineModificationModel.h"
@interface DLLineModificationViewDetailTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *lineDetialNameLab;//标题
@property (nonatomic, strong) UILabel *lineDetialTravelLab;//分类
@property (nonatomic, strong) UIImageView *modificationImage;//改价图
@property (nonatomic, strong) UILabel *lineDetialPriceLab;//价格

@property (nonatomic, strong) DLLineModificationModel *modificationModel;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

/** 配置Cell */
- (void)configureCell:(DLLineModificationModel *)lineModificationModel;


@end
