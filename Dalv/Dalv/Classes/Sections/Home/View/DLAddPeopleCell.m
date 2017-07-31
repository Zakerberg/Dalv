//
//  DLAddPeopleCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/21.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLAddPeopleCell.h"

@implementation DLAddPeopleCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
    }
    return self;
}

-(void)setupCellSubviews {
    
    UITextField *TF = [[UITextField alloc] init];
    self.TF = TF;
    TF.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:TF];
    
    [TF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.height.offset(50);
        make.top.offset(0);
        make.left.offset(120);
    }];
}
@end
