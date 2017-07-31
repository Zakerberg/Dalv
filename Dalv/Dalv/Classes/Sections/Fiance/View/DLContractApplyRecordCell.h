//
//  DLContractApplyRecordCell.h
//  Dalv
//
//  Created by Michael 柏 on 2017/6/7.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import <UIKit/UIKit.h>
#import "DLContractRecordModel.h"

@interface DLContractApplyRecordCell : UITableViewCell
@property (nonatomic, strong) UILabel *contractNameLabel;
@property (nonatomic, strong) UILabel *contractTypelabel;
@property (nonatomic, strong) UILabel *contractTimeLabel;
@property (nonatomic, strong) UILabel *contractInlandCount;
@property (nonatomic, strong) UILabel *contractOutboundCount;
@property (nonatomic, strong) UILabel *contractPeritemCount;
@property (nonatomic, strong) UILabel *contractOrderNumber;
@property (nonatomic, strong) UILabel *contractMemo;
@property (nonatomic, strong) DLContractRecordModel *contractRecordModel;
@property(nonatomic,strong) UILabel *failMemoLabel;
@property(nonatomic,strong) UIView * backview;
+(NSString *)cellIdentifier;

- (void)configureCell:(DLContractRecordModel *)contractRecordModel;

@end
