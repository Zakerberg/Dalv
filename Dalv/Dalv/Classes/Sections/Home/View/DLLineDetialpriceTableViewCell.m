//
//  DLLineDetialpriceTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/18.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineDetialpriceTableViewCell.h"
#import "DLLineDetialCollectionViewCell.h"
#import "DLRemindSegmentView.h"
#import "DLLineModificationViewController.h"

@interface DLLineDetialpriceTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
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

@end

@implementation DLLineDetialpriceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    _lineDetialNameLab = [[UILabel alloc]init];
    _lineDetialNameLab.textColor = [UIColor colorWithHexString:@"373737"];
    _lineDetialNameLab.textAlignment = NSTextAlignmentLeft;
    _lineDetialNameLab.font = [UIFont systemFontOfSize:14];
    _lineDetialNameLab.text = @"标题XXXXXX";
    _lineDetialNameLab.numberOfLines = 0;
    [self.contentView addSubview:_lineDetialNameLab];
    
    _titleChangeBtn = [[UIButton alloc]init];
    [_titleChangeBtn setImage:[UIImage imageNamed:@"edit.png"] forState:UIControlStateNormal];
    [_titleChangeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_titleChangeBtn addTarget:self action:@selector(pushtitleChang:) forControlEvents:UIControlEventTouchUpInside];
    _titleChangeBtn.layer.cornerRadius = 2.0;
    [self.contentView addSubview:_titleChangeBtn];
    
    _lineDetialNumberLab = [[UILabel alloc]init];
    _lineDetialNumberLab.textColor = [UIColor blackColor];
    _lineDetialNumberLab.textAlignment = NSTextAlignmentLeft;
    _lineDetialNumberLab.font = [UIFont systemFontOfSize:10];
    _lineDetialNumberLab.text = @"代码：104231";
    [self.contentView addSubview:_lineDetialNumberLab];
    
    _lineDetialSupplierLab = [[UILabel alloc]init];
    _lineDetialSupplierLab.textColor = [UIColor blackColor];
    _lineDetialSupplierLab.textAlignment = NSTextAlignmentCenter;
    _lineDetialSupplierLab.font = [UIFont systemFontOfSize:10];
    _lineDetialSupplierLab.text = @"供应商：金旅假期";
    [self.contentView addSubview:_lineDetialSupplierLab];
    
    _lineDetialContactsLab = [[UILabel alloc]init];
    _lineDetialContactsLab.textColor = [UIColor blackColor];
    _lineDetialContactsLab.textAlignment = NSTextAlignmentRight;
    _lineDetialContactsLab.font = [UIFont systemFontOfSize:10];
    _lineDetialContactsLab.text = @"联系人：聂玉林";
    [self.contentView addSubview:_lineDetialContactsLab];
    
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = [UIColor ms_separatorColor];
    [self.contentView  addSubview:_lineView];
    
    _lineDetialPriceLab = [[UILabel alloc]init];
    _lineDetialPriceLab.textColor = [UIColor blackColor];
    _lineDetialPriceLab.textAlignment = NSTextAlignmentLeft;
    _lineDetialPriceLab.font = [UIFont systemFontOfSize:16];
    _lineDetialPriceLab.textColor = [UIColor colorWithHexString:@"fe603b"];
    _lineDetialPriceLab.text = @"¥1699.0";
    [self.contentView addSubview:_lineDetialPriceLab];
    
    _lineModificationBtn = [[UIButton alloc]init];
    [_lineModificationBtn setTitle:@"改价" forState:(UIControlStateNormal)];
    [_lineModificationBtn setTitleColor:[UIColor colorWithHexString:@"#fE603B"] forState:UIControlStateNormal];
    [_lineModificationBtn addTarget:self action:@selector(pushLineModification:) forControlEvents:UIControlEventTouchUpInside];
    [_lineModificationBtn.layer setMasksToBounds:YES];
    [_lineModificationBtn.layer setCornerRadius:2.0];
    [_lineModificationBtn.layer setBorderWidth:1.0];
    _lineModificationBtn.layer.borderColor=[UIColor colorWithHexString:@"#e3e3e4"].CGColor;
    [self.contentView addSubview:_lineModificationBtn];
    
    _departureScheduleView = [[UIView alloc]init];
    _departureScheduleView.backgroundColor = [UIColor colorWithHexString:@"f3f3f3"];
    [self.contentView  addSubview:_departureScheduleView];
    
    _backView = [[UIView alloc]init];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.tag = 200;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectDateView:)];
    [_backView addGestureRecognizer:tap];
    [_departureScheduleView  addSubview:_backView];
    
    _dateImageView = [[UIImageView alloc]init];
    _dateImageView.image = [UIImage imageNamed:@"group_date_select"];
    [_backView addSubview:_dateImageView];
    
    _groupDatelab = [[UILabel alloc]init];
    _groupDatelab.textColor = [UIColor blackColor];
    _groupDatelab.textAlignment = NSTextAlignmentLeft;
    _groupDatelab.font = [UIFont systemFontOfSize:16];
    _groupDatelab.text = @"出团班期";
    [_backView addSubview:_groupDatelab];
    
    _rightimage = [[UIImageView alloc]init];
    _rightimage.image = [UIImage imageNamed:@"arrowhead_left"];
    [_backView addSubview:_rightimage];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(SCREEN_WIDTH * 0.5f, 40);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.scrollEnabled = NO;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.alwaysBounceVertical = YES;
    [collectionView registerClass:[DLLineDetialCollectionViewCell class]
       forCellWithReuseIdentifier:[DLLineDetialCollectionViewCell cellIdentifier]];
    self.collectionView = collectionView;
    
    [self.contentView addSubview:collectionView];
    
    NSArray *titleArray = [NSArray arrayWithObjects:@"行程安排", @"产品亮点", @"费用说明",@"注意事项", nil];
    CGFloat segmentWidth = SCREEN_WIDTH;
    CGFloat eachWidth = segmentWidth / (titleArray.count);
    NSArray *widthArr = [NSArray arrayWithObjects:@(eachWidth), @(eachWidth), @(eachWidth), @(eachWidth), nil];
    _segmentView = [[DLRemindSegmentView alloc] initWithFrame:CGRectMake(0, 0, segmentWidth, 42) titletextArr:titleArray widthArr:widthArr selectIndex:0];
    _segmentView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_segmentView];
    @weakify(self);
    _segmentView.selectBlock = ^(NSInteger index) {
        @strongify(self);
        if (self.delegate && [self.delegate respondsToSelector:@selector(segmentTapDelegate:)]) {
            [self.delegate segmentTapDelegate:index];
        }
    };

}

- (void)layoutCellSubviews {
    
    CGFloat width = (self.contentView.ms_width - 30)/3;
    
    [_lineDetialNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView).offset(-40);
    }];
    
    [_titleChangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lineDetialNameLab);
        make.right.equalTo(self.contentView).offset(-10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];

    [_lineDetialNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineDetialNameLab.mas_bottom).with.offset(15);
        make.left.equalTo(@15);
        make.width.equalTo(@(width));
        make.height.lessThanOrEqualTo(@30);
    }];
    
    [_lineDetialSupplierLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lineDetialNumberLab);
        make.left.equalTo(_lineDetialNumberLab.mas_right);
        make.width.equalTo(@(width));
        make.height.lessThanOrEqualTo(@30);
    }];
    
    [_lineDetialContactsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lineDetialNumberLab);
        make.right.equalTo(self.contentView).offset(-15);
        make.width.equalTo(@(width));
        make.height.lessThanOrEqualTo(@30);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineDetialNumberLab.mas_bottom).offset(5);
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
    [_lineDetialPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineView.mas_bottom);
        make.left.equalTo(@15);
        make.width.equalTo(@200);
        make.height.equalTo(@40);
    }];
    
    [_lineModificationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lineDetialPriceLab);
        make.right.equalTo(self.contentView).offset(-10);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];

    [_departureScheduleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineDetialPriceLab.mas_bottom);
        make.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@52);
    }];
    
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_departureScheduleView).offset(5);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@40);
    }];
    
    [_dateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backView.mas_top).offset(5);
        make.left.equalTo(@15);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    [_groupDatelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_dateImageView);
        make.left.equalTo(_dateImageView.mas_right).with.offset(10);
        make.width.equalTo(@120);
        make.height.equalTo(@30);
    }];
    
    [_rightimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_dateImageView);
        make.right.equalTo(@-15);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@120);
        make.top.equalTo(_departureScheduleView.mas_bottom);
    }];
    
    [_segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@42);
        make.top.equalTo(_collectionView.mas_bottom);
    }];


}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

/** 配置Cell */
- (void)configureCell:(DLLineTourDetailInforModel *)lineTourDetailInforModel {
    
    self.lineDetialNameLab.text = lineTourDetailInforModel.list.name;
    self.lineDetialNumberLab.text = [NSString stringWithFormat:@"代码：10%@",lineTourDetailInforModel.list.lineTourId];
    self.lineDetialSupplierLab.text  = [NSString stringWithFormat:@"供应商：%@",lineTourDetailInforModel.list.provider_name];
    self.lineDetialContactsLab.text = [NSString stringWithFormat:@"联系人：%@",lineTourDetailInforModel.list.contact_person];
    self.lineDetialPriceLab.text = [NSString stringWithFormat:@"¥ %.2f",[lineTourDetailInforModel.list.min_price integerValue]/100.00];
    [self.collectionView reloadData];
    
    
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DLLineDetialCollectionViewCell *cell = [DLLineDetialCollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath];
    [cell configureCell:self.detaiInfoModel indexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark - private methods
- (void)selectDateView:(UITapGestureRecognizer *)tap {
    NSLog(@"点击了选择日期");
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectDateViewDelegate:)]) {
        [self.delegate selectDateViewDelegate:tap];
    }

    
}

-(void)pushLineModification:(UIButton *)btn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeThePriceButtonDelegate:)]) {
        [self.delegate changeThePriceButtonDelegate:btn];
    }
 }

-(void)pushtitleChang:(UIButton *)btn {
    if (self.delegate && [self.delegate respondsToSelector:@selector(titleChangeButtonDelegate:)]) {
        [self.delegate titleChangeButtonDelegate:btn];
    }
}
@end
