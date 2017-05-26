//
//  DLLineOrderChoiceDateTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLLineOrderChoiceDateTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *datelab;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

@end
