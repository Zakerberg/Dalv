//
//  DLLineDetailsScrollViewTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/6/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLLineDetailsScrollViewTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *lineDetailsImage;
@property (nonatomic, strong) UILabel *lineDetailsNamelab;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

@end
