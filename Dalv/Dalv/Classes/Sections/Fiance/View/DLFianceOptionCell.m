//
//  DLFianceOptionCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFianceOptionCell.h"
#import "DLOptionModel.h"
@interface DLFianceOptionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end



@implementation DLFianceOptionCell

- (void)setMineOption:(DLOptionModel *)mineOption {
    self.option = mineOption;
    
    self.iconView.image = [UIImage imageNamed:mineOption.icon];
    self.nameLabel.text = mineOption.name;
}

@end
