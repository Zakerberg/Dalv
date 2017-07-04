//
//  DLLineDetialpriceTableViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLineTourDetailInforModel.h"
#import "DLRemindSegmentView.h"

@protocol DLLineDetialTableViewCellDelegate <NSObject>

@optional

- (void)segmentTapDelegate:(NSUInteger )index;
- (void)changeThePriceButtonDelegate:(UIButton *)button;
- (void)titleChangeButtonDelegate:(UIButton *)button;
- (void)selectDateViewDelegate:(UITapGestureRecognizer *)tapdate;
@end

/** 线路详情cell*/
@interface DLLineDetialpriceTableViewCell : UITableViewCell

@property (nonatomic , weak) id <DLLineDetialTableViewCellDelegate>delegate;

@property (nonatomic, strong) DLLineTourDetailInforModel *detaiInfoModel;

@property (nonatomic, strong) UILabel *lineDetialNameLab;//标题
@property (nonatomic, strong) UILabel *lineDetialNumberLab;//代码
@property (nonatomic, strong) UILabel *lineDetialSupplierLab;//供应商
@property (nonatomic, strong) UILabel *lineDetialContactsLab;//联系人
@property (nonatomic, strong) UILabel *lineDetialPriceLab;//价格
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIView *departureScheduleView;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *dateImageView;
@property (nonatomic, strong) UILabel *groupDatelab;
@property (nonatomic, strong) UIImageView *rightimage;
@property (nonatomic, strong) UIButton *lineModificationBtn;//改价
@property (nonatomic, strong) UIButton *titleChangeBtn;//改标题

@property (nonatomic, strong) UICollectionView *collectionView;//菜单

@property (nonatomic, strong) DLRemindSegmentView*segmentView;


/**
 *  Cell 重用ID
 */
+ (NSString *)cellIdentifier;

/** 配置Cell */
- (void)configureCell:(DLLineTourDetailInforModel *)lineTourDetailInforModel;

@end
