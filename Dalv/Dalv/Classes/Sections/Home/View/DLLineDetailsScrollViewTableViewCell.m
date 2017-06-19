//
//  DLLineDetailsScrollViewTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/6/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineDetailsScrollViewTableViewCell.h"

@implementation DLLineDetailsScrollViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    _lineDetailsImage = [[UIImageView alloc]init];
    _lineDetailsImage.image = [UIImage imageNamed:@"mine_theme"];
    [self.contentView addSubview:_lineDetailsImage];

    
    _lineDetailsNamelab = [[UILabel alloc]init];
    _lineDetailsNamelab.textColor = [UIColor blackColor];
    _lineDetailsNamelab.textAlignment = NSTextAlignmentCenter;
    _lineDetailsNamelab.font = [UIFont systemFontOfSize:14];
    _lineDetailsNamelab.numberOfLines = 0;
    [self.contentView addSubview:_lineDetailsNamelab];
    
    [_lineDetailsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.height.equalTo(@150);

    }];
    
    [_lineDetailsNamelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineDetailsImage.mas_bottom).with.offset(10);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.height.equalTo(@30);
    }];

}

- (void)layoutCellSubviews {
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

/** 配置Cell */
- (void)configureCell:(DLDestinationAtlasModel *)destModel{
    
    [self.lineDetailsImage sd_setImageWithURL:[NSURL URLWithString:destModel.img] placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
    self.lineDetailsNamelab.text = destModel.name;

}

@end
