//
//  BLMCityTableViewCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLMCityTableViewCell : UITableViewCell
{
    NSArray * _cityArray;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cityArray:(NSArray*)array;
@property (nonatomic,copy)void(^didSelectedBtn)(int tag);
@end
