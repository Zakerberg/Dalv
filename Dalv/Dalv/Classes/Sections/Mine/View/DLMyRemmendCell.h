//
//  DLMyRemmendCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLMyRemmendModel.h"

@interface DLMyRemmendCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleBtn;

- (void)configureCell:(DLMyRemmendModel *)myRemmendModelData;

@end
