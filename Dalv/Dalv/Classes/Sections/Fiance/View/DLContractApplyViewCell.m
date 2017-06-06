//
//  DLContractApplyViewCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplyViewCell.h"
#import "DLAddReduceButton.h"

@interface DLContractApplyViewCell ()<DLAddReduceButtonDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property(nonatomic,strong) DLAddReduceButton * button;
@property(nonatomic,strong) DLAddReduceButton * button1;

@end

@implementation DLContractApplyViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

-(void)setup {
    
    self.moneyLabel.tintColor = [UIColor colorWithHexString:@"#fc5a2e"];

    
    
    
    
    DLAddReduceButton *button = [[DLAddReduceButton alloc] init];
    self.button = button;
    button.shakeAnimation = NO;
    button.resultBlock = ^(NSInteger number, BOOL increaseStatus) {
        
    };
    
    
    DLAddReduceButton *button1 = [[DLAddReduceButton alloc] init];
    self.button1 = button1;
    button1.shakeAnimation = NO;
    button1.resultBlock = ^(NSInteger number, BOOL increaseStatus) {
        
    };

    [self.contentView addSubview:button];
    [self.contentView addSubview:button1];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.right.equalTo(@-15);
        make.height.equalTo(@25);
        make.width.equalTo(@80);
    }];
    
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.right.equalTo(@-15);
        make.width.equalTo(@80);
        make.height.equalTo(@25);
    }];
    
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.height.equalTo(@12);
        make.right.equalTo(self.button.mas_left).offset(-15);
    }];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
