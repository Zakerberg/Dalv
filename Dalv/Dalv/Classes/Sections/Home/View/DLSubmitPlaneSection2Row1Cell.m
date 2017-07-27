//
//  DLSubmitPlaneSection2Row1Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLSubmitPlaneSection2Row1Cell.h"

@implementation DLSubmitPlaneSection2Row1Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    [self setUI];
        
    }
    return self;
}

-(void)setUI{
    
    UILabel *name = [[UILabel alloc] init];
    name.text = @"姓名:";
    name.textColor = [UIColor colorWithHexString:@"#a3a3a3"];
    name.font = [UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:name];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"乔布斯";
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    self.nameLabel.textColor = [UIColor colorWithHexString:@"#393939"];
    
    [self.contentView addSubview:self.nameLabel];
    
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@14);
        make.centerY.offset(0);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(name.mas_right).offset(7);
        make.centerY.offset(0);
    }];
}

@end
