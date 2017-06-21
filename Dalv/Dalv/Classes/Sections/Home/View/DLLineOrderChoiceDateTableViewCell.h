//
//  DLLineOrderChoiceDateTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DLLineOrderChoiceDateTableViewCellDelegate <NSObject>

@optional

- (void)orderSelectDateViewDelegate:(UITapGestureRecognizer *)tapdate;

@end

@interface DLLineOrderChoiceDateTableViewCell : UITableViewCell

@property (nonatomic , weak) id <DLLineOrderChoiceDateTableViewCellDelegate>delegate;


@property (nonatomic, strong) UILabel *datelab;
@property (nonatomic, strong) UIView *lineOrderChoiceBackView;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

@end
