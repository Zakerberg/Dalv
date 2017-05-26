//
//  DLLineOrderPriceTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderPriceTableViewCell.h"

@implementation DLLineOrderPriceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    _lineOederNamelab = [[UILabel alloc]init];
    _lineOederNamelab.textColor = [UIColor blackColor];
    _lineOederNamelab.textAlignment = NSTextAlignmentLeft;
    _lineOederNamelab.font = [UIFont systemFontOfSize:16];
    _lineOederNamelab.text = @"";
    _lineOederNamelab.numberOfLines = 0;
    [self.contentView addSubview:_lineOederNamelab];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"dcdcdc"];
    [self.contentView  addSubview:line];
    
    UILabel *adultlab = [[UILabel alloc]init];
    adultlab.textColor = [UIColor blackColor];
    adultlab.textAlignment = NSTextAlignmentLeft;
    adultlab.font = [UIFont systemFontOfSize:16];
    adultlab.text = @"成人(常规)";
    [self.contentView addSubview:adultlab];
    
    UILabel *childlab = [[UILabel alloc]init];
    childlab.textColor = [UIColor blackColor];
    childlab.textAlignment = NSTextAlignmentLeft;
    childlab.font = [UIFont systemFontOfSize:16];
    childlab.text = @"儿童(常规)";
    [self.contentView addSubview:childlab];
    
    _perrAdultlab = [[UILabel alloc]init];
    _perrAdultlab.textColor = [UIColor redColor];
    _perrAdultlab.textAlignment = NSTextAlignmentRight;
    _perrAdultlab.font = [UIFont systemFontOfSize:16];
    _perrAdultlab.text = @"同行价¥1999";
    [self.contentView addSubview:_perrAdultlab];
    
    _preeChildlab = [[UILabel alloc]init];
    _preeChildlab.textColor = [UIColor redColor];
    _preeChildlab.textAlignment = NSTextAlignmentRight;
    _preeChildlab.font = [UIFont systemFontOfSize:16];
    _preeChildlab.text = @"同行价¥1399";
    [self.contentView addSubview:_preeChildlab];
    
    [_lineOederNamelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineOederNamelab.mas_bottom).with.offset(10);
        make.left.equalTo(@20);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [adultlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(5);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [childlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(adultlab.mas_bottom).offset(5);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
    
    [_perrAdultlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(adultlab);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];
    
    [_preeChildlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(childlab);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@25);
    }];

}

- (void)layoutCellSubviews {
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

- (void)configureCell:(NSString *)routeName {

    self.lineOederNamelab.text = routeName;
}

@end
