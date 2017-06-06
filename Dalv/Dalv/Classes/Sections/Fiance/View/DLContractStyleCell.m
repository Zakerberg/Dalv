//
//  DLContractStyleCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractStyleCell.h"
@interface DLContractStyleCell()
//快递
@property (weak, nonatomic) IBOutlet UIButton *courierBtn;
//自取
@property (weak, nonatomic) IBOutlet UIButton *inviteBtn;
@property (weak, nonatomic) IBOutlet UIImageView *courierImageV;
@property (weak, nonatomic) IBOutlet UIImageView *inviteImageV;

@end

@implementation DLContractStyleCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}


    
- (IBAction)courierBtnClick:(UIButton *)sender {
    
    self.courierBtn.tag = 100;
    [self.courierImageV setImage:[UIImage imageNamed:@"Check"]];
    [self.inviteImageV setImage:[UIImage imageNamed:@"UnCheck"]];

}
    
- (IBAction)inviteBtnClick:(UIButton *)sender {
    
    self.inviteBtn.tag = 101;
    
    [self.inviteImageV setImage:[UIImage imageNamed:@"Check"]];
    [self.courierImageV setImage:[UIImage imageNamed:@"UnCheck"]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
