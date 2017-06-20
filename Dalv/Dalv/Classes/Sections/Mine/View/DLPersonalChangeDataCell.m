//
//  DLPersonalChangeDataCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLPersonalChangeDataCell.h"

@implementation DLPersonalChangeDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
    }
    return self;
}


-(void)setupCellSubviews{
    
    UILabel *label = [[UILabel alloc] init];
    self.label = label;
    [label sizeToFit];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    [self.contentView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(15);
        make.height.offset(15);
    }];
    
}







@end
