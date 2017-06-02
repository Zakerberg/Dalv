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

@property (nonatomic, strong) UIImageView *dinnerimage;//用餐界面图标

@property (nonatomic, strong) UILabel *haveDinnerLab;//用餐lab

@property (nonatomic, strong) UIImageView *hotelimage;//酒店界面图标

@property (nonatomic, strong) UILabel *hotelviewLab;//酒店lab

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
    
    self.dinnerimage = [[UIImageView alloc]init];
    self.dinnerimage.image = [UIImage imageNamed:@"have_dinner"];
    [self.dinnerView addSubview:self.dinnerimage];

    self.haveDinnerLab = [[UILabel alloc]init];
    self.haveDinnerLab.textColor = [UIColor blackColor];
    self.haveDinnerLab.font = [UIFont systemFontOfSize:14];
    self.haveDinnerLab.text = @"用餐:";
    [self.dinnerView addSubview:self.haveDinnerLab];
    
    self.dinnerLab = [[UILabel alloc]init];
    self.dinnerLab.textColor = [UIColor blackColor];
    self.dinnerLab.font = [UIFont systemFontOfSize:11];
    self.dinnerLab.textAlignment = NSTextAlignmentRight;
    self.dinnerLab.text = @"111111";
    [self.dinnerView addSubview:self.dinnerLab];
    
    self.hotelView = [[UIView alloc]init];
    self.hotelView.layer.masksToBounds = YES;
    self.hotelView.layer.cornerRadius = 6.0;
    self.hotelView.layer.borderWidth = 1.0;
    self.hotelView.layer.borderColor = [[UIColor ms_backgroundColor] CGColor];
    [self.contentView addSubview:self.hotelView];

    self.hotelimage = [[UIImageView alloc]init];
    self.hotelimage.image = [UIImage imageNamed:@"hotel"];
    [self.hotelView addSubview:self.hotelimage];
    
    self.hotelviewLab = [[UILabel alloc]init];
    self.hotelviewLab.textColor = [UIColor blackColor];
    self.hotelviewLab.font = [UIFont systemFontOfSize:14];
    self.hotelviewLab.text = @"酒店:";
    [self.hotelView addSubview:self.hotelviewLab];
    
    self.hotelLab = [[UILabel alloc]init];
    self.hotelLab.textColor = [UIColor blackColor];
    self.hotelLab.font = [UIFont systemFontOfSize:11];
    self.hotelLab.textAlignment = NSTextAlignmentRight;
    self.hotelLab.text = @"222222";
    [self.hotelView addSubview:self.hotelLab];
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
    
    [self.dinnerimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@7.5);
        make.left.equalTo(@5);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [self.haveDinnerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.dinnerimage);
        make.left.equalTo(self.dinnerimage.mas_right).offset(5);
        make.width.equalTo(@35);
        make.height.equalTo(@30);
    }];

    [self.dinnerLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.dinnerimage);
        make.left.equalTo(self.haveDinnerLab.mas_right);
        make.right.equalTo(self.dinnerView.mas_right).offset(-5);
        make.height.equalTo(@30);
    }];
    
    [self.hotelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.schedulingLab.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_centerX).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.equalTo(@40);
    }];
    
    [self.hotelimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@7.5);
        make.left.equalTo(@5);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [self.hotelviewLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.hotelimage);
        make.left.equalTo(self.hotelimage.mas_right).offset(5);
        make.width.equalTo(@35);
        make.height.equalTo(@30);
    }];
    
    [self.hotelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.hotelimage);
        make.left.equalTo(self.hotelviewLab.mas_right);
        make.right.equalTo(self.hotelView.mas_right).offset(-5);
        make.height.equalTo(@30);
    }];
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

/** 配置Cell */
- (void)configureCell:(DLLineTourDetailDaysModel *)detailDaysModel indexPath:(NSIndexPath *)indexPath {

    self.schedulingLab.text = detailDaysModel.daysDescription;
    self.dayLab.text = [NSString stringWithFormat:@"第%ld天",(indexPath.row + 1)];
    self.dinnerLab.text = detailDaysModel.dining;
    self.hotelLab.text = detailDaysModel.hotel;
}

@end
