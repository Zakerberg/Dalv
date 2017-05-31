//
//  DLLineSchedulingTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineSchedulingTableViewCell.h"

@interface DLLineSchedulingTableViewCell ()

@property (nonatomic, strong) UILabel *dayLab;//第几天

@property (nonatomic, strong) UILabel *schedulingLab;//行程安排

@property (nonatomic, strong) UIView *dinnerView;//用餐界面

@property (nonatomic, strong) UIView *hotelView;//酒店界面

@property (nonatomic, strong) UILabel *dinnerLab;//用餐lab 默认自理

@property (nonatomic, strong) UILabel *hotelLab;//酒店lab 默认无

@end

@implementation DLLineSchedulingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    self.dayLab = [[UILabel alloc]init];
    self.dayLab.textColor = [UIColor colorWithHexString:@"6d82f3"];
    self.dayLab.font = [UIFont systemFontOfSize:12];
    self.dayLab.text = @"第一天";
    [self.contentView addSubview:self.dayLab];
    
    self.schedulingLab = [[UILabel alloc]init];
    self.schedulingLab.textColor = [UIColor blackColor];
    self.schedulingLab.font = [UIFont systemFontOfSize:11];
    self.schedulingLab.numberOfLines = 0;
    self.schedulingLab.text = @"";
    [self.contentView addSubview:self.schedulingLab];
    
    self.dinnerView = [[UIView alloc]init];
    self.dinnerView.layer.masksToBounds = YES;
    self.dinnerView.layer.cornerRadius = 6.0;
    self.dinnerView.layer.borderWidth = 1.0;
    self.dinnerView.layer.borderColor = [[UIColor ms_backgroundColor] CGColor];
    [self.contentView addSubview:self.dinnerView];
    
    self.hotelView = [[UIView alloc]init];
    self.hotelView.layer.masksToBounds = YES;
    self.hotelView.layer.cornerRadius = 6.0;
    self.hotelView.layer.borderWidth = 1.0;
    self.hotelView.layer.borderColor = [[UIColor ms_backgroundColor] CGColor];
    [self.contentView addSubview:self.hotelView];

}

- (void)layoutCellSubviews {
 
    [self.dayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(15);
        make.left.equalTo(@15);
        make.width.equalTo(@100);
        make.height.lessThanOrEqualTo(@30);
    }];
    
    [self.schedulingLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dayLab.mas_bottom).offset(10);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView).offset(-15);
    }];
    
    [self.dinnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.schedulingLab.mas_bottom).offset(10);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView.mas_centerX).offset(-15);
        make.height.equalTo(@40);
    }];
    
    
    [self.hotelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.schedulingLab.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_centerX).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.equalTo(@40);
    }];
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

/** 配置Cell */
- (void)configureCell:(DLLineTourDetailDaysModel *)detailDaysModel indexPath:(NSIndexPath *)indexPath {

    self.schedulingLab.text = detailDaysModel.daysDescription;
    self.dayLab.text = [NSString stringWithFormat:@"第%ld天",(indexPath.row + 1)];

}

@end
