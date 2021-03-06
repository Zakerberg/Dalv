//
//  DLRoutePricingTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRoutePricingTableViewCell.h"

@implementation DLRoutePricingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    UIFont *font = [UIFont systemFontOfSize:12];

    _dateImageView = [[UIImageView alloc]init];
    _dateImageView.image = [UIImage imageNamed:@"group_date_select"];
    [self.contentView addSubview:_dateImageView];
    
    _groupDatelab = [[UILabel alloc]init];
    _groupDatelab.textColor = [UIColor blackColor];
    _groupDatelab.textAlignment = NSTextAlignmentLeft;
    _groupDatelab.font = [UIFont systemFontOfSize:16];
    _groupDatelab.text = @"团期";
    [self.contentView addSubview:_groupDatelab];
    
    _datelab = [[UILabel alloc]init];
    _datelab.textColor = [UIColor colorWithHexString:@"a4a4a4"];
    _datelab.textAlignment = NSTextAlignmentRight;
    _datelab.font = [UIFont systemFontOfSize:16];
    _datelab.text = @"2017-06-08";
    [self.contentView addSubview:_datelab];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"dcdcdc"];
    [self.contentView  addSubview:line];
    
    UILabel *colleaguePricelab = [[UILabel alloc]init];
    colleaguePricelab.textAlignment = NSTextAlignmentLeft;
    colleaguePricelab.font = [UIFont systemFontOfSize:14];
    colleaguePricelab.text = @"同行价/建议零售价";
    [self.contentView addSubview:colleaguePricelab];
    
    UILabel *customPricelab = [[UILabel alloc]init];
    customPricelab.textAlignment = NSTextAlignmentLeft;
    customPricelab.font = [UIFont systemFontOfSize:14];
    customPricelab.text = @"自定义价";
    [self.contentView addSubview:customPricelab];

    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor colorWithHexString:@"dcdcdc"];
    [self.contentView  addSubview:line1];

    _adultPricelab = [[UILabel alloc]init];
    _adultPricelab.textColor = [UIColor colorWithHexString:@"a4a4a4"];
    _adultPricelab.textAlignment = NSTextAlignmentLeft;
    _adultPricelab.font = font;
    _adultPricelab.text = @"成人价：¥1288/1588";
    [self.contentView addSubview:_adultPricelab];
    
    _childPricelab = [[UILabel alloc]init];
    _childPricelab.textColor = [UIColor colorWithHexString:@"a4a4a4"];
    _childPricelab.textAlignment = NSTextAlignmentLeft;
    _childPricelab.font = font;
    _childPricelab.text = @"儿童价：¥1188/1388";
    [self.contentView addSubview:_childPricelab];
    
    _roomDifferencelab = [[UILabel alloc]init];
    _roomDifferencelab.textColor = [UIColor colorWithHexString:@"a4a4a4"];
    _roomDifferencelab.textAlignment = NSTextAlignmentLeft;
    _roomDifferencelab.font = font;
    _roomDifferencelab.text = @"单房差：¥400";
    [self.contentView addSubview:_roomDifferencelab];
    
    UIView *line2 = [[UIView alloc]init];
    line2.backgroundColor = [UIColor colorWithHexString:@"dcdcdc"];
    [self.contentView  addSubview:line2];

    UIView *line3 = [[UIView alloc]init];
    line3.backgroundColor = [UIColor colorWithHexString:@"dcdcdc"];
    [self.contentView  addSubview:line3];

    self.adultPriceTextField = [[UITextField alloc] init];
    self.adultPriceTextField.placeholder = @"请输入修改后价格";
    self.adultPriceTextField.font = font;
    self.adultPriceTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.adultPriceTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.adultPriceTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.adultPriceTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.adultPriceTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.contentView addSubview:self.adultPriceTextField];
    
    UIView *line4 = [[UIView alloc]init];
    line4.backgroundColor = [UIColor colorWithHexString:@"dcdcdc"];
    [self.contentView  addSubview:line4];

    self.childPriceTextField = [[UITextField alloc] init];
    self.childPriceTextField.placeholder = @"请输入修改后价格";
    self.childPriceTextField.font = font;
    self.childPriceTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.childPriceTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.childPriceTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.childPriceTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.childPriceTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.contentView addSubview:self.childPriceTextField];
    
    UIView *line5 = [[UIView alloc]init];
    line5.backgroundColor = [UIColor colorWithHexString:@"dcdcdc"];
    [self.contentView  addSubview:line5];
    
    self.roomDifferenceTextField = [[UITextField alloc] init];
    self.roomDifferenceTextField.placeholder = @"请输入修改后价格";
    self.roomDifferenceTextField.font = font;
    self.roomDifferenceTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.roomDifferenceTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.roomDifferenceTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.roomDifferenceTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.roomDifferenceTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.contentView addSubview:self.roomDifferenceTextField];
    
    _preservationBtn = [[UIButton alloc]init];
    [_preservationBtn setTitle:@"保存" forState:(UIControlStateNormal)];
    [_preservationBtn  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_preservationBtn addTarget:self action:@selector(preservation) forControlEvents:UIControlEventTouchUpInside];
    _preservationBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
    _preservationBtn.layer.cornerRadius = 2.0;
    [self.contentView addSubview:_preservationBtn];
    
    UIView *backview = [[UIView alloc]init];
    backview.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    [self.contentView  addSubview:backview];
    
    [_dateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@15);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    [_groupDatelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_dateImageView);
        make.left.equalTo(_dateImageView.mas_right).with.offset(10);
        make.width.equalTo(@120);
        make.height.equalTo(@30);
    }];
    
    [_datelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_dateImageView);
        make.right.equalTo(@-15);
        make.width.equalTo(@120);
        make.height.equalTo(@30);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_dateImageView.mas_bottom).offset(5);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];

    [colleaguePricelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(5);
        make.left.equalTo(@15);
        make.width.equalTo(@200);
        make.height.equalTo(@30);
    }];

    [customPricelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(colleaguePricelab);
        make.left.equalTo(line3.mas_right).offset(15);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@30);
    }];

    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(colleaguePricelab.mas_bottom).offset(5);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [_adultPricelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom);
        make.left.equalTo(@15);
        make.right.equalTo(line3.mas_left);
        make.height.equalTo(@30);
    }];

    [_childPricelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_adultPricelab.mas_bottom);
        make.left.equalTo(@15);
        make.right.equalTo(line3.mas_left);
        make.height.equalTo(@30);
    }];
    
    [_roomDifferencelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_childPricelab.mas_bottom);
        make.left.equalTo(@15);
        make.right.equalTo(line3.mas_left);
        make.height.equalTo(@30);
    }];

    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_roomDifferencelab.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];

    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom);
        make.left.equalTo(self.contentView.mas_centerX);
        make.width.equalTo(@1);
        make.height.equalTo(@90);
    }];

    [_adultPriceTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_adultPricelab);
        make.left.equalTo(line3.mas_right).offset(15);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@30);
    }];
    
    [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_adultPriceTextField.mas_bottom);
        make.left.equalTo(self.contentView.mas_centerX);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@0.5);
    }];
    
    [_childPriceTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_childPricelab);
        make.left.equalTo(line3.mas_right).offset(15);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@30);
    }];

    [line5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_childPriceTextField.mas_bottom);
        make.left.equalTo(self.contentView.mas_centerX);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@0.5);
    }];
    
    [_roomDifferenceTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_roomDifferencelab);
        make.left.equalTo(line3.mas_right).offset(15);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@30);
    }];
    
    [_preservationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.mas_bottom).offset(10);
        make.left.equalTo(@100);
        make.right.equalTo(self.contentView.mas_right).offset(-100);
        make.height.equalTo(@30);
    }];
    
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_preservationBtn.mas_bottom).offset(10);
        make.left.equalTo(@0);
        make.right.equalTo(self.contentView);
        make.height.equalTo(@10);
    }];
}

-(void)preservation
{
    NSLog(@"点击了保存");
}

- (void)layoutCellSubviews {
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

@end
