////
////  DLPlaneTicketListTableViewCell.m
////  Dalv
////
////  Created by Nie on 2017/7/7.
////  Copyright © 2017年 Michael 柏. All rights reserved.
////
//
//#import "DLPlaneTicketListTableViewCell.h"
//
//@implementation DLPlaneTicketListTableViewCell
//
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        [self setupCellSubviews];
//        [self layoutCellSubviews];
//    }
//    return self;
//}
//- (void)setupCellSubviews {
//    
//    _departureTimelab = [[UILabel alloc]init];
//    _departureTimelab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
//    _departureTimelab.textAlignment = NSTextAlignmentLeft;
//    _departureTimelab.font = [UIFont systemFontOfSize:16];
//    _departureTimelab.text = @"13:00";
//    [self.contentView addSubview:_departureTimelab];
//    
//    _airimage = [[UIImageView alloc]init];
//    _airimage.backgroundColor = [UIColor orangeColor];
//    [self.contentView addSubview:_airimage];
//
//    
//    _arrivaTimelab = [[UILabel alloc]init];
//    _arrivaTimelab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
//    _arrivaTimelab.textAlignment = NSTextAlignmentRight;
//    _arrivaTimelab.font = [UIFont systemFontOfSize:16];
//    _arrivaTimelab.text = @"15:55";
//    [self.contentView addSubview:_arrivaTimelab];
//    
//    _departureAirportlab = [[UILabel alloc]init];
//    _departureAirportlab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
//    _departureAirportlab.textAlignment = NSTextAlignmentLeft;
//    _departureAirportlab.font = [UIFont systemFontOfSize:16];
//    _departureAirportlab.text = @"首都机场T2";
//    [self.contentView addSubview:_departureAirportlab];
//    
//    _arrivalAirportrlab = [[UILabel alloc]init];
//    _arrivalAirportrlab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
//    _arrivalAirportrlab.textAlignment = NSTextAlignmentRight;
//    _arrivalAirportrlab.font = [UIFont systemFontOfSize:16];
//    _arrivalAirportrlab.text = @"虹桥机场T2";
//    [self.contentView addSubview:_arrivalAirportrlab];
//    
//    _airlineCompanylab = [[UILabel alloc]init];
//    _airlineCompanylab.textColor = [UIColor colorWithHexString:@"#2b2b2b"];
//    _airlineCompanylab.textAlignment = NSTextAlignmentLeft;
//    _airlineCompanylab.font = [UIFont systemFontOfSize:16];
//    _airlineCompanylab.text = @"中国东方航空公司";
//    [self.contentView addSubview:_airlineCompanylab];
//    
//    [_departureTimelab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@5);
//        make.left.equalTo(@15);
//        make.width.equalTo(@150);
//        make.height.equalTo(@30);
//    }];
//    
//    [_airimage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(_departureTimelab);
//        make.centerX.equalTo(self.contentView);
//        make.width.equalTo(@25);
//        make.height.equalTo(@25);
//    }];
//
//    [_arrivaTimelab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(_departureTimelab);
//        make.right.equalTo(@-15);
//        make.width.equalTo(@150);
//        make.height.equalTo(@30);
//    }];
//
//    [_departureAirportlab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_departureTimelab.mas_bottom);
//        make.left.equalTo(@15);
//        make.width.equalTo(@150);
//        make.height.equalTo(@30);
//    }];
//    
//    [_arrivalAirportrlab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(_departureAirportlab);
//        make.right.equalTo(@-15);
//        make.width.equalTo(@150);
//        make.height.equalTo(@25);
//    }];
//
//    [_airlineCompanylab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_departureAirportlab.mas_bottom);
//        make.left.equalTo(@15);
//        make.width.equalTo(@150);
//        make.height.equalTo(@30);
//    }];
//}
//
//- (void)layoutCellSubviews {
//}
//
//+ (NSString *)cellIdentifier {
//    return NSStringFromClass([self class]);
//}
//
//@end
