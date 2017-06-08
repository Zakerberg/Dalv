//
//  DLContractApplySection5Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplySection5Cell.h"

@implementation DLContractApplySection5Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
    }
    return self;
}


-(void)setupCellSubviews {
    
   
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submitBtn = submitBtn;
    [submitBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    submitBtn.backgroundColor = [UIColor colorWithHexString:@"#4d67ee"];
    submitBtn.layer.cornerRadius = 8.0;
    
    
    [self.contentView addSubview:submitBtn];
    
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.height.offset(45);
        make.right.equalTo(self.mas_right).offset(-15);
        make.centerY.offset(0);
    }];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
