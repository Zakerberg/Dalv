

//
//  DLContractApplySection0Cell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/12.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLContractApplySection0Cell.h"
#import "DLAddReduceButton.h"

@interface  DLContractApplySection0Cell()
@property (weak, nonatomic) IBOutlet UILabel *inlandLabel;
@property (weak, nonatomic) IBOutlet UILabel *outLandLabel;
@property (weak, nonatomic) IBOutlet UILabel *peritemLabel;

@end




@implementation DLContractApplySection0Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUI];
}

-(void)setUI {
    
    DLAddReduceButton *button1 = [[DLAddReduceButton alloc] init];
    
    self.button1 = button1;
    button1.shakeAnimation = NO;
    button1.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    
    DLAddReduceButton *button2 = [[DLAddReduceButton alloc] init];
        self.button2 = button2;
        button2.shakeAnimation = NO;
    
        button2.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
            NSLog(@"%ld",num);
        };

    DLAddReduceButton *button3 = [[DLAddReduceButton alloc] init];
    self.button3 = button3;
    button3.shakeAnimation = NO;
    
    button3.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    
    
    [self.contentView addSubview:button2];
    [self.contentView addSubview:button1];
    [self.contentView addSubview:button3];
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.inlandLabel);
            make.right.equalTo(@-15);
            make.width.equalTo(@80);
            make.height.equalTo(@25);
        }];

    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.outLandLabel);
        make.right.equalTo(@-15);
        make.height.equalTo(@25);
        make.width.equalTo(@80);
    }];
    
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.peritemLabel);
        make.right.equalTo(@-15);
        make.height.equalTo(@25);
        make.width.equalTo(@80);
    }];
    
    
}

















- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
