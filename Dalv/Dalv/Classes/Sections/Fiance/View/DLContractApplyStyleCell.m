//
//  DLContractApplyStyleCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplyStyleCell.h"
@interface DLContractApplyStyleCell()
//自取invite
@property(nonatomic,weak)UIButton *inviteBtn;
//快递Courier
@property(nonatomic,weak)UIButton *courierBtn;
@property(nonatomic,weak) UIImageView *inviteImageView;
@property(nonatomic,weak) UIImageView *courierImageView;
@end

@implementation DLContractApplyStyleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(instancetype)init {
    
    UIButton *inviteBtn = [[UIButton alloc] init];
    self.inviteBtn = inviteBtn;
    inviteBtn.titleLabel.text = @"   快递";
    inviteBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    inviteBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    inviteBtn.tintColor = [UIColor colorWithHexString:@"#494949"];
    [inviteBtn addTarget:self action:@selector(inviteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.contentView addSubview:inviteBtn];
    
    
    UIButton *courierBtn = [[UIButton alloc] init];
    self.courierBtn = courierBtn;
    courierBtn.titleLabel.text = @"   自取";
    courierBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    courierBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    courierBtn.tintColor = [UIColor colorWithHexString:@"#494949"];
    [courierBtn addTarget:self action:@selector(courierBtnClick) forControlEvents:UIControlEventTouchUpInside];
   
    [self.contentView addSubview:courierBtn];
    
    UIImageView *inviteImageView = [[UIImageView alloc] init];
    self.inviteImageView = inviteImageView;
    
    [inviteImageView setImage:[UIImage imageNamed:@"UnCheck"]];
    [self.contentView addSubview:inviteImageView];
    
    UIImageView *courierImageView = [[UIImageView alloc] init];
    self.inviteImageView = inviteImageView;
    
    [courierImageView setImage:[UIImage imageNamed:@"UnCheck"]];
    [self.contentView addSubview:courierImageView];
    
    
    [inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@0);
        make.width.equalTo(@(380/2));
        make.height.offset(45);
    }];
    
    [courierBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(@0);
        make.height.offset(45);
        make.left.equalTo(@(385/2));
    }];
    
    [inviteImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(self.mas_right).offset((320/2));
        make.right.offset(384/2);
        make.height.offset(45/2);
    }];
    
    
    [courierImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(10);
        make.centerY.offset(0);
        make.height.offset(45/2);
        make.left.offset(680/2);
    }];
    
    return self;
}


#pragma mark - --------   BtnClick    -------------------

-(void)inviteBtnClick {
    
    
}

-(void)courierBtnClick {
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
