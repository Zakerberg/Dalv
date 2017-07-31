//
//  DLSubmitSection3Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLSubmitSection3Cell.h"

@implementation DLSubmitSection3Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUI];
        
    }
    return self;
}

-(void)setUI{
    
    _NAME = [[UILabel alloc] init];
    _NAME.font = [UIFont systemFontOfSize:16];
    _NAME.textColor = [UIColor colorWithHexString:@"#3b3a3a"];
    [_NAME sizeToFit];
    
    [self.contentView addSubview:_NAME];
    
    
    _TF = [[UITextField alloc] init];
    _TF.borderStyle = UITextBorderStyleNone;
    
    [self.contentView addSubview:_TF];
    
    [_NAME mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(@15);
        make.top.equalTo(@15);
    }];
    
    [_TF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(44);
        make.left.equalTo(_NAME.mas_right).offset(15);
        make.centerY.equalTo(_NAME.mas_centerY);
        make.width.offset(MAIN_SCREEN_WIDTH-10);
    }];
}

@end
