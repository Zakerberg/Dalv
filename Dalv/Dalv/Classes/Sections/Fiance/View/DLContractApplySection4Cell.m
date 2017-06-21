//
//  DLContractApplySection4Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplySection4Cell.h"
@interface DLContractApplySection4Cell()

@end

@implementation DLContractApplySection4Cell

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
    
    UILabel *mailAddressLabel = [[UILabel alloc] init];
    mailAddressLabel.text = @"邮寄地址:";
    mailAddressLabel.font = [UIFont systemFontOfSize:15];
    mailAddressLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    [mailAddressLabel sizeToFit];
    
    [self.contentView addSubview: mailAddressLabel];
    
    UITextView *addressTV = [[UITextView alloc] init];
    self.addressTV = addressTV;
//    addressTV.font = [UIFont systemFontOfSize:15];
//    addressTV.text = @"请填写您的收货地址";
//    addressTV.textColor = [UIColor colorWithHexString:@"#c1c1c1"];
    
    [self.contentView addSubview: addressTV];
    
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    
    [self.contentView addSubview:line];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"联系人姓名:";
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    [nameLabel sizeToFit];
    
    [self.contentView addSubview:nameLabel];
    
    UITextField *nameTF = [[UITextField alloc] init];
    self.nameTF = nameTF;
    nameTF.placeholder = @"输入收件人姓名";
    nameTF.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:nameTF];
    
   
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    
    [self.contentView addSubview:line1];
    
    
    UILabel *numberLabel = [[UILabel alloc] init];
    numberLabel.text = @"联系人电话:";
    numberLabel.font = [UIFont systemFontOfSize:15];
    numberLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    [numberLabel sizeToFit];

    [self.contentView addSubview:numberLabel];
    
    
    UITextField *numberTF = [[UITextField alloc] init];
    self.numberTF = numberTF;
    numberTF.placeholder = @"输入手机号码";
    numberTF.keyboardType = UIKeyboardTypeNumberPad;
    numberTF.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:numberTF];

    
    [mailAddressLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(self.mas_top).offset(16);
         make.left.equalTo(self.mas_left).offset(15);
         make.height.offset(15);
     }];
    
    
    [addressTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(7.5);
        make.left.equalTo(mailAddressLabel.mas_right).offset(15);
        make.right.offset(0);
        make.height.offset(70);
    }];
    
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(0);
        make.height.offset(1);
        make.left.right.offset(0);
        make.top.equalTo(addressTV.mas_bottom).offset(1);
    }];
    
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(15);
        make.left.height.equalTo(@15);
    }];
    
    
    [nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(nameLabel.mas_centerY).offset(0);
        make.left.equalTo(nameLabel.mas_right).offset(15);
        make.height.offset(44);
        make.width.equalTo(self.mas_width);
    }];

    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(0);
        make.height.offset(1);
        make.left.right.offset(0);
        make.top.equalTo(line.mas_top).offset(45);
    }];

    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(12);
        make.left.height.equalTo(@15);
    }];
    
    
    [numberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(numberLabel.mas_centerY).offset(0);
        make.left.equalTo(numberLabel.mas_right).offset(15);
        make.height.offset(44);
        make.width.equalTo(self.mas_width);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
