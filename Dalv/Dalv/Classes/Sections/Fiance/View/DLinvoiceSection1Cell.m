//
//  DLinvoiceSection1Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLinvoiceSection1Cell.h"

@interface DLinvoiceSection1Cell ()

@end

@implementation DLinvoiceSection1Cell

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

    UILabel *invoiceAmountLabel = [[UILabel alloc] init];
    invoiceAmountLabel.text = @"发票金额";
    invoiceAmountLabel.font = [UIFont systemFontOfSize:16];
    invoiceAmountLabel.textColor = [UIColor colorWithHexString:@"#494949"];
    [invoiceAmountLabel sizeToFit];
    
    [self.contentView addSubview:invoiceAmountLabel];
    
    
    UITextField *invoiceAmountTF = [[UITextField alloc] init];
    self.invoiceAmountTF = invoiceAmountTF;
    invoiceAmountTF.placeholder = @"请输入发票金额";
    invoiceAmountTF.borderStyle = UITextBorderStyleNone;
//    invoiceAmountTF.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.contentView addSubview:invoiceAmountTF];
    
    [invoiceAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(@15);
        make.top.equalTo(@15);
    }];
    
    [invoiceAmountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.left.equalTo(invoiceAmountLabel.mas_right).offset(15); make.top.equalTo(@15);
    }];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
