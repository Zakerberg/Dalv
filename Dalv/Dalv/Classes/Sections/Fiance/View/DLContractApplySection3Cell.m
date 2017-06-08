//
//  DLContractApplySection3Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplySection3Cell.h"

@interface DLContractApplySection3Cell ()

@property(nonatomic,strong) UILabel * payforLabel;
@property(nonatomic,strong) UILabel * mailLabel;

@end

@implementation DLContractApplySection3Cell

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
    
    UIButton *payforBtn = [[UIButton alloc] init];
    self.payforBtn = payforBtn;
    [payforBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    
    [self.contentView addSubview:payforBtn];
    
    
    UIButton *mailBtn = [[UIButton alloc] init];
    self.mailBtn = mailBtn;
    [mailBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    
    [self.contentView addSubview:mailBtn];
    
    UILabel *payforLabel = [[UILabel alloc] init];
    self.payforLabel = payforLabel;
    payforLabel.text = @"到付";
    [payforLabel sizeToFit];
    payforLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    
    [self.contentView addSubview:payforLabel];
    
    UILabel *mailLabel = [[UILabel alloc] init];
    self.mailLabel = mailLabel;
    mailLabel.text = @"邮寄";
    [mailLabel sizeToFit];
    mailLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    
    [self.contentView addSubview:mailLabel];
    
    [payforBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.height.with.offset(20);
        make.right.equalTo(self.mas_centerX).offset(-12);
    }];
    
    [mailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.offset(0);
        make.height.with.offset(20);
        make.right.equalTo(self.mas_right).offset(-12);
    }];
    
    [payforLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.left.equalTo(self.mas_left).offset(15);
        make.height.offset(15);
    }];
    
    [mailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.left.equalTo(self.mas_centerX).offset(15);
        make.height.offset(15);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
