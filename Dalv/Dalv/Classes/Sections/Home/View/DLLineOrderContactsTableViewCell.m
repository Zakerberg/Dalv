//
//  DLLineOrderContactsTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/24.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderContactsTableViewCell.h"

@implementation DLLineOrderContactsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            [self setupCellSubviews];
            [self layoutCellSubviews];
        }
        return self;
}

- (void)setupCellSubviews {
        UIFont *font = [UIFont systemFontOfSize:15];
        
        UILabel *informationlab = [[UILabel alloc]init];
        informationlab.textColor = [UIColor blackColor];
        informationlab.textAlignment = NSTextAlignmentLeft;
        informationlab.font = [UIFont systemFontOfSize:12];
        informationlab.text = @"预定信息";
        [self.contentView addSubview:informationlab];
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = UIColorFromHex(0xdcdcdc);
        [self.contentView  addSubview:line];
        
        UILabel *contactslab = [[UILabel alloc]init];
        contactslab.textColor = [UIColor blackColor];
        contactslab.textAlignment = NSTextAlignmentLeft;
        contactslab.font = font;
        contactslab.text = @"联系人:";
        [self.contentView addSubview:contactslab];
        
        UIView *line1 = [[UIView alloc]init];
        line1.backgroundColor = UIColorFromHex(0xdcdcdc);
        [self.contentView  addSubview:line1];
        
        UILabel *telllab = [[UILabel alloc]init];
        telllab.textColor = [UIColor blackColor];
        telllab.textAlignment = NSTextAlignmentLeft;
        telllab.font = font;
        telllab.text = @"手机号:";
        [self.contentView addSubview:telllab];
        
        UILabel *remarkslab = [[UILabel alloc]init];
        remarkslab.textColor = [UIColor blackColor];
        remarkslab.textAlignment = NSTextAlignmentLeft;
        remarkslab.font = font;
        remarkslab.text = @"订单备注:";
        [self.contentView addSubview:remarkslab];
        
        UIView *line2 = [[UIView alloc]init];
        line2.backgroundColor = UIColorFromHex(0xdcdcdc);
        [self.contentView  addSubview:line2];
        
        self.contacsTextField = [[UITextField alloc] init];
        self.contacsTextField.keyboardType = UIKeyboardTypeTwitter;
        self.contacsTextField.placeholder = @"填写常用联系人";
        self.contacsTextField.font = font;
        self.contacsTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.contacsTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.contacsTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.contacsTextField.leftViewMode = UITextFieldViewModeAlways;
        [self.contentView addSubview:self.contacsTextField];
        
        self.tellTextField = [[UITextField alloc] init];
        self.tellTextField.placeholder = @"填写入手机号";
        self.tellTextField.font = font;
        self.tellTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.tellTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.tellTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.tellTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.tellTextField.leftViewMode = UITextFieldViewModeAlways;
        [self.contentView addSubview:self.tellTextField];

        self.remarksTextField = [[UITextField alloc] init];
        self.remarksTextField.placeholder = @"有什么是大旅需要注意的呢?";
        self.remarksTextField.font = font;
        self.remarksTextField.keyboardType = UIKeyboardTypeTwitter;
        self.remarksTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.remarksTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.remarksTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.remarksTextField.leftViewMode = UITextFieldViewModeAlways;
        [self.contentView addSubview:self.remarksTextField];
        
        [informationlab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.left.equalTo(@15);
            make.width.equalTo(self.contentView);
            make.height.lessThanOrEqualTo(@30);
        }];
    
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(informationlab.mas_bottom).offset(5);
            make.left.equalTo(@0);
            make.width.equalTo(self.contentView);
            make.height.equalTo(@0.5);
        }];
        
        [contactslab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.mas_bottom).with.offset(5);
            make.left.equalTo(@15);
            make.width.equalTo(@80);
            make.height.equalTo(@40);
        }];
        
        [self.contacsTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(contactslab);
            make.left.equalTo(contactslab.mas_right);
            make.width.equalTo(self.contentView).with.offset(-100);
            make.height.equalTo(@40);
        }];

        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(contactslab.mas_bottom).with.offset(5);
            make.left.equalTo(@0);
            make.width.equalTo(self.contentView);
            make.height.equalTo(@0.5);
        }];

        
        [telllab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line1.mas_bottom).with.offset(5);
            make.left.equalTo(@15);
            make.width.equalTo(@80);
            make.height.equalTo(@40);
        }];
        
        [self.tellTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(telllab);
            make.left.equalTo(telllab.mas_right);
            make.width.equalTo(self.contentView).with.offset(-100);
            make.height.equalTo(@40);
        }];

        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(telllab.mas_bottom).with.offset(5);
            make.left.equalTo(@0);
            make.width.equalTo(self.contentView);
            make.height.equalTo(@0.5);
        }];

        [remarkslab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line2.mas_bottom).with.offset(5);
            make.left.equalTo(@15);
            make.width.equalTo(@80);
            make.height.equalTo(@40);
        }];
        
        [self.remarksTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(remarkslab);
            make.left.equalTo(remarkslab.mas_right);
            make.width.equalTo(self.contentView).with.offset(-100);
            make.height.equalTo(@40);
        }];
    }

- (void)layoutCellSubviews {
    
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

@end
