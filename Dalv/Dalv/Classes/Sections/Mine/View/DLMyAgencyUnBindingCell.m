//
//  DLMyAgencyUnBindingCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMyAgencyUnBindingCell.h"

@implementation DLMyAgencyUnBindingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
    }
    return self;
}

-(void)setupCellSubviews {
    
    UIImageView *headImageView = [[UIImageView alloc] init];
    self.headImageView = headImageView;
    
    [self.contentView addSubview:headImageView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLabel = nameLabel;
    nameLabel.font = [UIFont boldSystemFontOfSize:16];
    [nameLabel sizeToFit];
    
    [self.contentView addSubview:nameLabel];
    
    UIImageView *sexImageView = [[UIImageView alloc] init];
    self.sexImageView = sexImageView;
    
    [self.contentView addSubview:sexImageView];
    
    
    UILabel *integral = [[UILabel alloc] init];
    integral.text = @"积分:";
    [integral sizeToFit];
    integral.font = [UIFont systemFontOfSize:15];
    integral.textColor = [UIColor colorWithHexString:@"#616161"];
    
    [self.contentView addSubview:integral];
    
    UILabel *integralLabel = [[UILabel alloc] init];
    self.integralLabel = integralLabel;
    [integralLabel sizeToFit];
    integralLabel.font = [UIFont systemFontOfSize:15];
    integralLabel.textColor = [UIColor colorWithHexString:@"#4d65f3"];
    
    [self.contentView addSubview:integralLabel];
    
    
    UILabel *workTime = [[UILabel alloc] init];
    workTime.text = @"从业时间:";
    [workTime sizeToFit];
    workTime.font = [UIFont systemFontOfSize:15];
    workTime.textColor = [UIColor colorWithHexString:@"#616161"];
    
    [self.contentView addSubview:workTime];
    
    UILabel *workingTimeLabel = [[UILabel alloc] init];
    self.workingTimeLabel = workingTimeLabel;
    [workingTimeLabel sizeToFit];
    workingTimeLabel.font = [UIFont systemFontOfSize:15];
    workingTimeLabel.textColor = [UIColor colorWithHexString:@"#ff673e"];
    
    [self.contentView addSubview:workingTimeLabel];
    
    
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(15);
        make.width.height.offset(55);
    }];
    
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headImageView.mas_top).offset(0);
        make.left.equalTo(headImageView.mas_right).offset(15);
        make.height.offset(16);
    }];
    
    
    [sexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_right).offset(6);
        make.centerY.equalTo(nameLabel.mas_centerY);
        make.height.width.offset(16);
    }];
    
    
    [integral mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_left).offset(0);
        make.top.equalTo(nameLabel.mas_bottom).offset(20);
        make.height.offset(15);
    }];
    
    [integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(integral.mas_right).offset(4);
        make.centerY.equalTo(integral.mas_centerY);
        make.height.offset(15);
    }];
    
    [workTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(integralLabel.mas_right).offset(15);
        make.centerY.equalTo(integralLabel.mas_centerY);
        make.height.offset(15);
    }];
    
    [workingTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(workTime.mas_right).offset(4);
        make.centerY.equalTo(workTime.mas_centerY);
        make.height.offset(15);
    }];

}

+(NSString *)cellIdentifier{
    
    return NSStringFromClass([self class]);
    
}

- (void)configureCell:(DLMyAgencyUnBindingModel *)myAgencyUnBindingModelData{
    
    NSURL *url = [NSURL URLWithString:myAgencyUnBindingModelData.head_pic];
    
    [_headImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"dalvu_tabar_my_nor@2x"]];
    
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.cornerRadius = 27.5;
    
    if ([myAgencyUnBindingModelData.sex isEqualToString:@"0"]) {
        [self.sexImageView setImage:[UIImage imageNamed:@"性别男"]];
        
    } else if ([myAgencyUnBindingModelData.sex isEqualToString:@"1"]){
        [self.sexImageView setImage:[UIImage imageNamed:@"性别女"]];
    }else{
        [self.sexImageView setImage:[UIImage imageNamed:@""]];
    }
    
    self.nameLabel.text = myAgencyUnBindingModelData.name;
    self.integralLabel.text = myAgencyUnBindingModelData.integral;
    
    if([myAgencyUnBindingModelData.working_time isEqualToString:@""]){
        self.workingTimeLabel.text = @"未设置";
    }else{
        
        self.workingTimeLabel.text = myAgencyUnBindingModelData.working_time;
    }
}

@end
