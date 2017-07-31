//
//  DLCustomerChangeDataCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/3.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCustomerChangeDataCell.h"

@implementation DLCustomerChangeDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self ConfigureCell];
    }
    return self;
}

-(void)ConfigureCell {
    
    UILabel *label = [[UILabel alloc] init];
    self.label = label;
    [label sizeToFit];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor colorWithHexString:@"#3b3b3b"];
    
    [self.contentView addSubview:label];
    
    UITextField *TF = [[UITextField alloc] init];
    self.TF = TF;
    TF.textAlignment = NSTextAlignmentRight;
    TF.font = [UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:TF];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(15);
        make.height.offset(15);
    }];
    
    [TF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.height.offset(44);
        make.top.offset(0);
        make.left.equalTo(self.label.mas_right).offset(0);
    }];

}

@end
