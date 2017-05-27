//
//  DLLineOrderTripNumebrTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderTripNumebrTableViewCell.h"
#import "DLAddReduceButton.h"

@interface DLLineOrderTripNumebrTableViewCell ()<DLAddReduceButtonDelegate>

@end

@implementation DLLineOrderTripNumebrTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    UILabel *typelab = [[UILabel alloc]init];
    typelab.textColor = [UIColor blackColor];
    typelab.textAlignment = NSTextAlignmentLeft;
    typelab.font = [UIFont systemFontOfSize:12];
    typelab.text = @"出行人数及类型";
    [self.contentView addSubview:typelab];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = UIColorFromHex(0xdcdcdc);
    [self.contentView  addSubview:line];
    
    UILabel *adultlab = [[UILabel alloc]init];
    adultlab.textColor = [UIColor blackColor];
    adultlab.textAlignment = NSTextAlignmentLeft;
    adultlab.font = [UIFont systemFontOfSize:15];
    adultlab.text = @"成人(常规)";
    [self.contentView addSubview:adultlab];
    
    UILabel *childlab = [[UILabel alloc]init];
    childlab.textColor = [UIColor blackColor];
    childlab.textAlignment = NSTextAlignmentLeft;
    childlab.font = [UIFont systemFontOfSize:15];
    childlab.text = @"儿童(常规)";
    [self.contentView addSubview:childlab];
    
    
    DLAddReduceButton *numberButton = [[DLAddReduceButton alloc]init];;
    numberButton.shakeAnimation = YES;
    numberButton.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    [self.contentView addSubview:numberButton];
    
    DLAddReduceButton *numberButton1 = [[DLAddReduceButton alloc]init];;
    numberButton1.shakeAnimation = YES;
    numberButton1.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
        NSLog(@"%ld",num);
    };
    [self.contentView addSubview:numberButton1];
    
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
    
//    
//    self.addBtn1 = [[UIButton alloc]init];
//    self.addBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.addBtn1 setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
//    
//    [self.addBtn1 setTitleColor:[UIColor blackColor] forState:0];
//    self.addBtn1.titleLabel.font = [UIFont systemFontOfSize:20];
//    [self.addBtn1 setTitle:@"+" forState:0];
//    [self.contentView addSubview:self.addBtn1];
//    
//    self.countTextField1 = [[UITextField alloc] init];
//    self.countTextField1.text = @"1";
//    self.countTextField1.textAlignment = NSTextAlignmentCenter;
//    self.countTextField1.font = [UIFont systemFontOfSize:15];
//    self.countTextField1.backgroundColor = [UIColor colorWithHexString:@"#4D67EE"];
//    [self.contentView addSubview:self.countTextField1];
//    
//    self.reduceBtn1 = [[UIButton alloc]init];
//    self.reduceBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.reduceBtn1 setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
//    [self.reduceBtn1 setTitleColor:[UIColor blackColor] forState:0];
//    self.reduceBtn1.titleLabel.font = [UIFont systemFontOfSize:20];
//    [self.reduceBtn1 setTitle:@"-" forState:0];
//    [self.contentView addSubview:self.reduceBtn1];
    
    
    [typelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@7);
        make.left.equalTo(@15);
        make.width.equalTo(self.contentView);
        make.height.lessThanOrEqualTo(@30);
    }];
    
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(typelab.mas_bottom).offset(5);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [adultlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@40);
    }];
    
    [childlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(adultlab.mas_bottom).with.offset(-10);
        make.left.equalTo(@15);
        make.width.equalTo(@150);
        make.height.equalTo(@40);
    }];
    
    [numberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(adultlab);
        make.right.equalTo(@-15);
        make.width.equalTo(@80);
        make.height.equalTo(@25);
    }];

    [numberButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(childlab);
        make.right.equalTo(@-15);
        make.width.equalTo(@80);
        make.height.equalTo(@25);
    }];

    
//    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(adultlab);
//        make.right.equalTo(@-15);
//        make.width.equalTo(@40);
//        make.height.equalTo(@25);
//    }];
//    
//    [self.countTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(adultlab);
//        make.right.equalTo(self.addBtn.mas_left);
//        make.width.equalTo(@40);
//        make.height.equalTo(@25);
//    }];
//    
//    [self.reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(adultlab);
//        make.right.equalTo(self.countTextField.mas_left);
//        make.width.equalTo(@40);
//        make.height.equalTo(@25);
//    }];
//    
//    [self.addBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(childlab);
//        make.right.equalTo(@-15);
//        make.width.equalTo(@40);
//        make.height.equalTo(@25);
//    }];
//    
//    [self.countTextField1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(childlab);
//        make.right.equalTo(self.addBtn.mas_left);
//        make.width.equalTo(@40);
//        make.height.equalTo(@25);
//    }];
//    
//    [self.reduceBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(childlab);
//        make.right.equalTo(self.countTextField.mas_left);
//        make.width.equalTo(@40);
//        make.height.equalTo(@25);
//    }];

}

- (void)layoutCellSubviews {
    
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

@end
