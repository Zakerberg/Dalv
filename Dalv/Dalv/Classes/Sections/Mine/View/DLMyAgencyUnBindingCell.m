//
//  DLMyAgencyUnBindingCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMyAgencyUnBindingCell.h"

@implementation DLMyAgencyUnBindingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
    }
    return self;
}

-(void)setupCellSubviews {
    
    UIImageView *headImageView = [[UIImageView alloc] init];
    self.headImageView = headImageView;
    
    [self.contentView addSubview:headImageView];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}


+(NSString *)cellIdentifier{
    
    return NSStringFromClass([self class]);
    
}

- (void)configureCell:(DLMyAgencyUnBindingModel *)myAgencyUnBindingModelData{
    
    NSURL *url = [NSURL URLWithString:myAgencyUnBindingModelData.head_pic];
    
    [self.headImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_my_nor@2x"]];
    
}

@end
