//
//  DLMineViewCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMineViewCell.h"

@implementation DLMineViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}


- (void)setupCellSubviews {
    
    UITextField *nameTF = [[UITextField alloc] init];
    //    WithFrame:CGRectMake(20, 34, MAIN_SCREEN_WIDTH, 52)];
    self.nameTF = nameTF;
    nameTF.placeholder = @"输入名字";
    [self.contentView addSubview:nameTF];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    
    [self.contentView addSubview:line];

//    cell.textLabel.text = @"输入城市 ";
//    cell.textColor = [UIColor colorWithHexString:@"b4b4b4"];
    
    UIButton *changeCityBtn = [[UIButton alloc] init];
//
//    //Frame:CGRectMake(20, 86, MAIN_SCREEN_WIDTH, 52)];
//    self.changeCityBtn = changeCityBtn;
//    
//
    
    self.changeCityBtn = changeCityBtn;
    
    [changeCityBtn setTitle:@"输入城市" forState:UIControlStateNormal];
    
    changeCityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    
    [self.contentView addSubview:changeCityBtn];
    
    [nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@34);
        make.height.equalTo(@52);
        make.left.right.equalTo(@20);
    }];
    
    
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(1);
        make.left.right.offset(0);
        make.top.equalTo(nameTF.mas_bottom);
    }];

    
    [changeCityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.height.equalTo(@52);
        make.right.offset(0);
        make.left.equalTo(@20);
    }];
    
    
    
}



- (void)layoutCellSubviews {
    
    
    
    
    
    
}










- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
