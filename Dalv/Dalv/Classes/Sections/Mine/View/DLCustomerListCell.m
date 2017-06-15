//
//  DLCustomerListCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/5.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCustomerListCell.h"

@implementation DLCustomerListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//
//+ (NSString *)cellIdentifier {
//    return NSStringFromClass([self class]);
//}
//

- (void)configureCell:(DLCustomerListModel *)customerListModel{
    
    
    self.customerNumLabel.text = customerListModel.mobile;
    self.customerNameLabel.text = customerListModel.name;
    self.customerTimeLabel.text = customerListModel.create_time;
    
    NSURL *url = [NSURL URLWithString:customerListModel.head_img];
    
    [self.customerAvatarImageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];

}

@end
