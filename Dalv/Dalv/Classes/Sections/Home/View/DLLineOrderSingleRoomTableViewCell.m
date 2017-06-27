//
//  DLLineOrderSingleRoomTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderSingleRoomTableViewCell.h"
#import "DLAddReduceButton.h"

@interface DLLineOrderSingleRoomTableViewCell ()<DLAddReduceButtonDelegate>

@end

@implementation DLLineOrderSingleRoomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    UILabel *resourceslab = [[UILabel alloc]init];
    resourceslab.textColor = [UIColor blackColor];
    resourceslab.textAlignment = NSTextAlignmentLeft;
    resourceslab.font = [UIFont systemFontOfSize:14];
    resourceslab.text = @"可选资源";
    [self.contentView addSubview:resourceslab];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = UIColorFromHex(0xdcdcdc);
    [self.contentView  addSubview:line];
    
    UILabel *singleRoomlab = [[UILabel alloc]init];
    singleRoomlab.textColor = [UIColor blackColor];
    singleRoomlab.textAlignment = NSTextAlignmentLeft;
    singleRoomlab.font = [UIFont systemFontOfSize:16];
    singleRoomlab.text = @"单房差";
    [self.contentView addSubview:singleRoomlab];
    
    DLAddReduceButton *singleRoomButton = [[DLAddReduceButton alloc]init];;
    singleRoomButton.shakeAnimation = YES;
    self.singleRoomButton = singleRoomButton;
//    numberButton.maxValue = 10;
    singleRoomButton.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    [self.contentView addSubview:singleRoomButton];

    
//    self.addBtn = [[UIButton alloc]init];
//    self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.addBtn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
//    
//    [self.addBtn setTitleColor:[UIColor blackColor] forState:0];
//    self.addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
//    [self.addBtn setTitle:@"+" forState:0];
//    [self.contentView addSubview:self.addBtn];
//    
//    self.countTextField = [[UITextField alloc] init];
//    self.countTextField.text = @"1";
//    self.countTextField.textAlignment = NSTextAlignmentCenter;
//    self.countTextField.font = [UIFont systemFontOfSize:15];
//    self.countTextField.backgroundColor = [UIColor colorWithHexString:@"#4D67EE"];
//    [self.contentView addSubview:self.countTextField];
//    
//    self.reduceBtn = [[UIButton alloc]init];
//    self.reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.reduceBtn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
//    [self.reduceBtn setTitleColor:[UIColor blackColor] forState:0];
//    self.reduceBtn.titleLabel.font = [UIFont systemFontOfSize:20];
//    [self.reduceBtn setTitle:@"-" forState:0];
//    [self.contentView addSubview:self.reduceBtn];
    
    [resourceslab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@15);
        make.width.equalTo(self.contentView);
        make.height.lessThanOrEqualTo(@30);
    }];
    
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(resourceslab.mas_bottom).with.offset(5);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [singleRoomlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@40);
    }];
    
    [singleRoomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(singleRoomlab);
        make.right.equalTo(@-15);
        make.width.equalTo(@80);
        make.height.equalTo(@25);
    }];

//    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(singleRoomlab);
//        make.right.equalTo(@-15);
//        make.width.equalTo(@40);
//        make.height.equalTo(@25);
//    }];
//    
//    [self.countTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(singleRoomlab);
//        make.right.equalTo(self.addBtn.mas_left);
//        make.width.equalTo(@40);
//        make.height.equalTo(@25);
//    }];
//    
//    [self.reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(singleRoomlab);
//        make.right.equalTo(self.countTextField.mas_left);
//        make.width.equalTo(@40);
//        make.height.equalTo(@25);
//    }];
    

}

- (void)layoutCellSubviews {
    

}

/**
 自定义加减按钮背景图片
 */

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

@end
