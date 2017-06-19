//
//  DLLineDetailsScrollViewTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/6/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLDestinationAtlasModel.h"
@interface DLLineDetailsScrollViewTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *lineDetailsImage;
@property (nonatomic, strong) UILabel *lineDetailsNamelab;
@property (nonatomic, strong) DLDestinationAtlasModel *destAtlasModel;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

/**
 *  配置Cell 数据
 */
- (void)configureCell:(DLDestinationAtlasModel *)destModel;

@end
