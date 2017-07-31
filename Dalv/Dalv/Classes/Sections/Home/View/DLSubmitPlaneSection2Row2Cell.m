//
//  DLSubmitPlaneSection2Row2Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLSubmitPlaneSection2Row2Cell.h"

@implementation DLSubmitPlaneSection2Row2Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUI];
        
    }
    return self;
}


-(void)setUI{
    

    UILabel *customerType = [[UILabel alloc] init];
    customerType.text = @"乘客类型:";
    customerType.textColor = [UIColor colorWithHexString:@"#a3a3a3"];
    customerType.font = [UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:customerType];
    
    self.customerTypeLabel = [[UILabel alloc] init];
    //self.customerTypeLabel.text = @"成人";
    self.customerTypeLabel.font = [UIFont systemFontOfSize:15];
    self.customerTypeLabel.textColor = [UIColor colorWithHexString:@"#393939"];
    
    [self.contentView addSubview:self.customerTypeLabel];
    
    UILabel *certificateType = [[UILabel alloc] init];
    certificateType.text = @"证件类型:";
    certificateType.textColor = [UIColor colorWithHexString:@"#a3a3a3"];
    certificateType.font = [UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:certificateType];
    
    self.certificateTypeLabel = [[UILabel alloc] init];
    //self.certificateTypeLabel.text = @"身份证";
    self.certificateTypeLabel.font = [UIFont systemFontOfSize:15];
    self.certificateTypeLabel.textColor = [UIColor colorWithHexString:@"#393939"];
    
    [self.contentView addSubview:self.certificateTypeLabel];

    
    self.deleBtn = [UIButton buttonWithType:0];
    self.deleBtn.backgroundColor = [UIColor redColor];
    [self.deleBtn setImage:[UIImage imageNamed:@"dele"] forState:UIControlStateNormal];
    
    [self.contentView addSubview:self.deleBtn];
    
    [customerType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@14);
        make.centerY.offset(0);
    }];
    
    [_customerTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(customerType.mas_right).offset(7);
        make.centerY.offset(0);
    }];
    
    [certificateType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(20);
        make.centerY.offset(0);
    }];
    
    [_certificateTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(certificateType.mas_right).offset(7);
        make.centerY.offset(0);
    }];
    
    [_deleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.height.width.right.offset(20);
        make.centerY.offset(0);
    }];
    
}

@end
