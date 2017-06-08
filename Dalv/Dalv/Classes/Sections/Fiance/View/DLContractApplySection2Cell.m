//
//  DLContractApplySection2Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplySection2Cell.h"

@interface DLContractApplySection2Cell ()

@property(nonatomic,strong) UILabel * addressLabel1;
@property(nonatomic,strong) UILabel * numberLabel1;


@end


@implementation DLContractApplySection2Cell

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


    UILabel *addressLabel = [[UILabel alloc] init];
    addressLabel.text = @"公司地址:";
    [addressLabel sizeToFit];
    addressLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:addressLabel];
    
    UILabel *addressLabel1 = [[UILabel alloc] init];
    self.addressLabel1 = addressLabel1;
    addressLabel1.text = @"XXXXXXXXXXX";
    [addressLabel1 sizeToFit];
    addressLabel1.textColor = [UIColor blackColor];
    
    [self.contentView addSubview:addressLabel1];
    
    UILabel *numberLabel = [[UILabel alloc] init];
    numberLabel.text = @"联系电话:";
    [numberLabel sizeToFit];
    numberLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:numberLabel];
    
    
    UILabel *numberLabel1 = [[UILabel alloc] init];
    self.numberLabel1 = numberLabel1;
    numberLabel1.text = @"010-XXXXXXXXX";
    [numberLabel1 sizeToFit];
    numberLabel1.textColor = [UIColor blackColor];

    [self.contentView addSubview:numberLabel1];
    

    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.height.offset(15);
    }];
    
    [addressLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addressLabel.mas_right).offset(15);
        make.centerY.equalTo(addressLabel).offset(0);
        make.height.offset(15);
    }];
    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressLabel1.mas_bottom).offset(15);
        make.left.height.offset(15);
    }];
    
    [numberLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(numberLabel.mas_right).offset(15);
        make.centerY.equalTo(numberLabel);
        make.height.offset(15);
    }];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
