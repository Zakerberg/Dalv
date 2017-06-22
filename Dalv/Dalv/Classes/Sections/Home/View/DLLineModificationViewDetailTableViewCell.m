//
//  DLLineModificationViewDetailTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineModificationViewDetailTableViewCell.h"

@implementation DLLineModificationViewDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    _modificationImage = [[UIImageView  alloc] init];
    _modificationImage.image = [UIImage imageNamed:@"mine_theme"];
    [self.contentView addSubview:_modificationImage];
    
    _lineDetialNameLab = [[UILabel alloc]init];
    _lineDetialNameLab.textColor = [UIColor colorWithHexString:@"373737"];
    _lineDetialNameLab.textAlignment = NSTextAlignmentLeft;
    _lineDetialNameLab.font = [UIFont systemFontOfSize:16];
    _lineDetialNameLab.text = @"标题XXXXXX";
    _lineDetialNameLab.numberOfLines = 0;
    [self.contentView addSubview:_lineDetialNameLab];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"dcdcdc"];
    [self.contentView  addSubview:line];

    _lineDetialTravelLab = [[UILabel alloc]init];
    _lineDetialTravelLab.textColor = [UIColor redColor];
    _lineDetialTravelLab.textAlignment = NSTextAlignmentLeft;
    _lineDetialTravelLab.font = [UIFont systemFontOfSize:14];
    _lineDetialTravelLab.text = @"出境游";
    [self.contentView addSubview:_lineDetialTravelLab];
    
    _lineDetialPriceLab = [[UILabel alloc]init];
    _lineDetialPriceLab.textColor = [UIColor redColor];
    _lineDetialPriceLab.textAlignment = NSTextAlignmentRight;
    _lineDetialPriceLab.font = [UIFont systemFontOfSize:16];
    _lineDetialPriceLab.text = @"¥1999";
    [self.contentView addSubview:_lineDetialPriceLab];
    
    UIView *backview = [[UIView alloc]init];
    backview.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    [self.contentView  addSubview:backview];

    
    [_modificationImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@100);
    }];

    [_lineDetialNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_modificationImage.mas_bottom);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
//        make.height.equalTo(@40);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineDetialNameLab.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [_lineDetialTravelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@40);
    }];

    [_lineDetialPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lineDetialTravelLab);
        make.right.equalTo(@-15);
        make.width.equalTo(@250);
        make.height.equalTo(@40);
    }];
    
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineDetialPriceLab.mas_bottom);
        make.left.equalTo(@0);
        make.right.equalTo(self.contentView);
        make.height.equalTo(@10);
    }];

}

- (void)layoutCellSubviews {
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

/** 配置Cell */
- (void)configureCell:(DLLineModificationModel *)lineModificationModel{
    
    NSURL *URL = [NSURL URLWithString:lineModificationModel.tour_list.cover_pic];
    [self.modificationImage sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
    self.lineDetialNameLab.text = lineModificationModel.tour_list.name;
    self.lineDetialTravelLab.text = lineModificationModel.tour_list.lineTypeName;
    self.lineDetialPriceLab.text = [NSString stringWithFormat:@"¥%.2f",[lineModificationModel.tour_list.min_price integerValue]/100.00];
}

@end
