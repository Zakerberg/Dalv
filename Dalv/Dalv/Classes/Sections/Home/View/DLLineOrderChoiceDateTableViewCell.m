//
//  DLLineOrderChoiceDateTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderChoiceDateTableViewCell.h"

@implementation DLLineOrderChoiceDateTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    UILabel *confirmDatelab = [[UILabel alloc]init];
    confirmDatelab.textColor = [UIColor blackColor];
    confirmDatelab.textAlignment = NSTextAlignmentLeft;
    confirmDatelab.font = [UIFont systemFontOfSize:14];
    confirmDatelab.text = @"确认出团日期";
    [self.contentView addSubview:confirmDatelab];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = UIColorFromHex(0xdcdcdc);
    [self.contentView  addSubview:line];
    
    
    _lineOrderChoiceBackView = [[UIView alloc]init];
    _lineOrderChoiceBackView.backgroundColor = [UIColor whiteColor];
    _lineOrderChoiceBackView.tag = 100;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectDateView:)];
    [_lineOrderChoiceBackView addGestureRecognizer:tap];
    [self.contentView  addSubview:_lineOrderChoiceBackView];
    
    UILabel *groupDatelab = [[UILabel alloc]init];
    groupDatelab.textColor = [UIColor blackColor];
    groupDatelab.textAlignment = NSTextAlignmentLeft;
    groupDatelab.font = [UIFont systemFontOfSize:16];
    groupDatelab.text = @"出团日期";
    [_lineOrderChoiceBackView addSubview:groupDatelab];
    
    UIImageView *rightimage = [[UIImageView alloc]init];
    rightimage.image = [UIImage imageNamed:@"arrowhead_left"];
    [_lineOrderChoiceBackView addSubview:rightimage];
    
    
    UILabel *datelab = [[UILabel alloc]init];
    datelab.textColor = [UIColor colorWithHexString:@"a4a4a4"];
    datelab.textAlignment = NSTextAlignmentRight;
    datelab.font = [UIFont systemFontOfSize:16];
    datelab.text = @"2017-05-23";
    self.datelab = datelab;
    [_lineOrderChoiceBackView addSubview:datelab];
    
    [confirmDatelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@15);
        make.width.equalTo(self.contentView);
        make.height.lessThanOrEqualTo(@30);
    }];
    
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(confirmDatelab.mas_bottom).with.offset(5);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [_lineOrderChoiceBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@50);
    }];

    [groupDatelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@50);
    }];
    
    [rightimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.right.equalTo(@-10);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [datelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.right.equalTo(rightimage.mas_left).with.offset(-5);
        make.width.equalTo(@250);
        make.height.equalTo(@50);
    }];
}

- (void)layoutCellSubviews {
    
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

#pragma mark - private methods
- (void)selectDateView:(UITapGestureRecognizer *)tap {
    NSLog(@"点击了选择日期");
    if (self.delegate && [self.delegate respondsToSelector:@selector(orderSelectDateViewDelegate:)]) {
        [self.delegate orderSelectDateViewDelegate:tap];
    }
    
}

@end
