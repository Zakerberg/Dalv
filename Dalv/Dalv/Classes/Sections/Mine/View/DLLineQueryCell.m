//
//  DLLineQueryCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineQueryCell.h"
#import "DLAddReduceButton.h"

@implementation DLLineQueryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
    }
    return self;
}

-(void)setupCellSubviews {
    
    UILabel *label = [[UILabel alloc] init];
    self.label = label;
    [label sizeToFit];
    
    [self.contentView addSubview:label];
    
    DLAddReduceButton *button = [[DLAddReduceButton alloc] init];
    self.button = button;
    button.shakeAnimation = NO;
    button.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        // NSLog(@"%ld",num);
    };
    
    [self.contentView addSubview:button];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(15);
        make.height.offset(15);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.right.equalTo(@-15);
        make.width.equalTo(@80);
        make.height.equalTo(@25);
    }];
}

@end
