//
//  DLMineCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMineCell.h"
#import "DLMineModel.h"


@interface DLMineCell ()
@property (weak, nonatomic) IBOutlet UIImageView *picImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation DLMineCell


-(void)setMineModel:(DLMineModel *)mineModel
{
    _mineModel = mineModel;
    
    self.imageView.image = [UIImage imageNamed:mineModel.pic];
    self.titleLabel.text = mineModel.title;
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
