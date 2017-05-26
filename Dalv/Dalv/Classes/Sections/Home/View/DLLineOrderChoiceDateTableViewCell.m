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
        
        UILabel *groupDatelab = [[UILabel alloc]init];
        groupDatelab.textColor = [UIColor blackColor];
        groupDatelab.textAlignment = NSTextAlignmentLeft;
        groupDatelab.font = [UIFont systemFontOfSize:16];
        groupDatelab.text = @"出团日期";
        [self.contentView addSubview:groupDatelab];
    
       UIImageView *rightimage = [[UIImageView alloc]init];
       rightimage.image = [UIImage imageNamed:@"arrowhead_left"];
       [self.contentView addSubview:rightimage];
    

        UILabel *datelab = [[UILabel alloc]init];
        datelab.textColor = [UIColor colorWithHexString:@"a4a4a4"];
        datelab.textAlignment = NSTextAlignmentRight;
        datelab.font = [UIFont systemFontOfSize:16];
        datelab.text = @"2017-05-23";
         self.datelab = datelab;
        [self.contentView addSubview:datelab];
    
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
        
        [groupDatelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.mas_bottom);
            make.left.equalTo(@15);
            make.width.equalTo(@150);
            make.height.equalTo(@50);
        }];
    
        [rightimage mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(line.mas_bottom).with.offset(15);
           make.right.equalTo(@-10);
           make.width.equalTo(@20);
           make.height.equalTo(@20);
    }];

        [datelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.mas_bottom);
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
    
@end
