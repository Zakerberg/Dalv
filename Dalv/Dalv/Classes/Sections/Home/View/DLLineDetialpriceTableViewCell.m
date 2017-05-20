//
//  DLLineDetialpriceTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineDetialpriceTableViewCell.h"

@implementation DLLineDetialpriceTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _linedetialpricelab = [[UILabel alloc]init];
        _linedetialpricelab.textColor = [UIColor blackColor];
        _linedetialpricelab.textAlignment = NSTextAlignmentLeft;
        _linedetialpricelab.font = [UIFont systemFontOfSize:16];
        _linedetialpricelab.text = @"标题XXXXXX";

        [self.contentView addSubview:_linedetialpricelab];
        
        
        UIView *line1 = [[UIView alloc]init];
        line1.backgroundColor = UIColorFromHex(0xdcdcdc);
        [self.contentView  addSubview:line1];
        
        [_linedetialpricelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@20);
            make.left.equalTo(@25);
            make.width.equalTo(@200);
            make.height.lessThanOrEqualTo(@40);
        }];
        
        
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_linedetialpricelab.mas_bottom).with.offset(20);
            make.left.equalTo(@0);
            make.width.equalTo(self.contentView);
            make.height.equalTo(@0.5);
        }];
        
    }
    return self;
}

@end
