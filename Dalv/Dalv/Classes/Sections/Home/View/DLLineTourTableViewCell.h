//
//  DLLineTourTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLLineTourTableViewCell : UITableViewCell
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong,nonatomic) UIImageView *headImage;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

@end
