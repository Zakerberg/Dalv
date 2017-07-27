//
//  DLSubmitPlaneSection2Row1Cell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/7/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLSubmitPlaneSection2Row1Cell : UITableViewCell
@property(nonatomic,strong) UILabel * nameLabel;
@property(nonatomic,strong) UILabel * typeLabel;
@property(nonatomic,strong) UILabel * certificateTypeLabel;// 证件类型
@property(nonatomic,strong) UILabel * certificateNumberLabel; // 证件号码
@property(nonatomic,strong) UILabel * customerType; // 乘客类型
@end
