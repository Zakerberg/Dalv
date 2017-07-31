//
//  DLContractApplySection1Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplySection1Cell.h"

@interface DLContractApplySection1Cell ()

@property(nonatomic,strong)UILabel *inviteLabel;
@property(nonatomic,strong)UILabel *courierLabel;

@end

@implementation DLContractApplySection1Cell

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

- (void)setupCellSubviews {
    
    UIButton *inviteBtn = [[UIButton alloc] init];
    self.inviteBtn = inviteBtn;
    [inviteBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    [inviteBtn setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateSelected];
    
    [self.contentView addSubview:inviteBtn];
    
    
    UIButton *courierBtn = [[UIButton alloc] init];
    self.courierBtn = courierBtn;
    [courierBtn setImage:[UIImage imageNamed:@"UnCheck"] forState:UIControlStateNormal];
    [courierBtn setImage:[UIImage imageNamed:@"Check"] forState:UIControlStateSelected];

    [self.contentView addSubview:courierBtn];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    
    [self.contentView addSubview:line];
    
    UILabel *inviteLabel = [[UILabel alloc] init];
    self.inviteLabel = inviteLabel;
    inviteLabel.text = @"自取";
    [inviteLabel sizeToFit];
    inviteLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    
    [self.contentView addSubview:inviteLabel];
    
    UILabel *courierLabel = [[UILabel alloc] init];
    self.courierLabel = courierLabel;
    courierLabel.text = @"快递";
    [courierLabel sizeToFit];
    courierLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    
    [self.contentView addSubview:courierLabel];
    
    UIButton *blankInviteBtn = [[UIButton alloc] init];
    self.blankInviteBtn = blankInviteBtn;
    blankInviteBtn.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:blankInviteBtn];
    
    UIButton *blankCourierBtn = [[UIButton alloc] init];
    self.blankCourierBtn = blankCourierBtn;
    blankCourierBtn.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:blankCourierBtn];
    
    [courierBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.height.with.offset(20);
        make.right.equalTo(self.mas_centerX).offset(-12);
    }];
    
    [inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.offset(0);
        make.height.with.offset(20);
        make.right.equalTo(self.mas_right).offset(-12);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(0);
        make.center.offset(0);
        make.width.offset(1);
    }];

    [courierLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.left.equalTo(self.mas_left).offset(15);
        make.height.offset(15);
    }];
    
    [inviteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.left.equalTo(self.mas_centerX).offset(15);
        make.height.offset(15);
    }];
    
    [blankInviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.width.offset(MAIN_SCREEN_WIDTH/2);
        make.height.offset(44);
    }];
    
    [blankCourierBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.width.offset(MAIN_SCREEN_WIDTH/2);
        make.height.offset(44);
    }];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
