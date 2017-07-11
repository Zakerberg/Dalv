//
//  DLMineViewCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMineViewCell.h"

@implementation DLMineViewCell

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
    [self.contentView addSubview:TF];
    
    [TF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.height.offset(52);
        make.width.offset(MAIN_SCREEN_WIDTH);
        make.left.offset(20);
    }];
}

@end
