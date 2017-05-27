//
//  DLLineDetialpriceTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineDetialpriceTableViewCell.h"
@interface DLLineDetialpriceTableViewCell ()
@property (nonatomic, strong) UILabel *lineDetialNameLab;

@end

@implementation DLLineDetialpriceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    _lineDetialNameLab = [[UILabel alloc]init];
    _lineDetialNameLab.textColor = [UIColor blackColor];
    _lineDetialNameLab.textAlignment = NSTextAlignmentLeft;
    _lineDetialNameLab.font = [UIFont systemFontOfSize:16];
    _lineDetialNameLab.text = @"标题XXXXXX";
    
    [self.contentView addSubview:_lineDetialNameLab];

}

- (void)layoutCellSubviews {
    [_lineDetialNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@25);
        make.width.equalTo(@200);
        make.height.lessThanOrEqualTo(@40);
    }];

}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

/** 配置Cell */
- (void)configureCell:(DLLineTourDetailInforModel *)lineTourDetailInforModel {



}


@end
