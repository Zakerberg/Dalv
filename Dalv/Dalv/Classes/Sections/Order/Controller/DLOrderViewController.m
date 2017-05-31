//
//  DLOrderViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLOrderViewController.h"
#import "DLHomeMenuCollectionViewCell.h"
#import "DLHomePageViewModel.h"

static NSString *kDLFianceCollectionViewHeader = @"DLFianceCollectionViewHeader";

@interface DLOrderViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *appCollectionView;

@property (nonatomic, strong) NSArray *apps;

@end

@implementation DLOrderViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
    [self fetchData];
}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
    
}

- (void)setupNavbar {
    self.title = @"订单";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - Setup subViews

- (void)setupSubviews {
//    self.view.backgroundColor = [UIColor ms_backgroundColor];
//    
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"这是订单界面";
//    label.textColor = [UIColor ms_blackColor];
//    label.font = [UIFont systemFontOfSize:25];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.backgroundColor = [UIColor randomColor];
//    
//    [self.view addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.left.and.right.equalTo(self.view);
//        make.height.equalTo(@100);
//    }];
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    NSInteger row = 4;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0.0f;
    layout.minimumLineSpacing = 0.0f;
    layout.headerReferenceSize = CGSizeMake(self.view.ms_width, 165);
    layout.itemSize = CGSizeMake(self.view.ms_width / row, 80);
    UICollectionView *appCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    appCollectionView.dataSource = self;
    appCollectionView.delegate = self;
    appCollectionView.backgroundColor = [UIColor whiteColor];
    appCollectionView.alwaysBounceVertical = YES;
    [appCollectionView registerClass:[DLHomeMenuCollectionViewCell class]
          forCellWithReuseIdentifier:[DLHomeMenuCollectionViewCell cellIdentifier]];
    [appCollectionView registerClass:[UICollectionReusableView class]
               forSupplementaryViewOfKind:UICollectionElementKindSectionHeader                      withReuseIdentifier:kDLFianceCollectionViewHeader];
    self.appCollectionView = appCollectionView;
    [self.view addSubview:appCollectionView];

}

#pragma mark - Layout

- (void)updateViewConstraints {
    
    [super updateViewConstraints];
}

- (void)setupConstraints {
    [self.appCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
#pragma mark - Fetch data

- (void)fetchData {
    self.apps = [DLHomePageViewModel creatFianceMenuItems];
    [self.appCollectionView reloadData];
 
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.apps.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DLHomeMenuCollectionViewCell *cell = [DLHomeMenuCollectionViewCell cellWithCollectionView:collectionView IndexPath:indexPath];
    
    DLHomeMenuItem *menuItem = [self.apps objectAtIndex:indexPath.item];
    cell.showsSeparator = YES;
    [cell configureCell:menuItem];
    return cell;
    
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *hotTopicHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kDLFianceCollectionViewHeader forIndexPath:indexPath];
        hotTopicHeaderView.backgroundColor = [UIColor whiteColor];
 
        UILabel *totalPriceLabel = [[UILabel alloc] init];
        totalPriceLabel.text = @"4890.0";
        totalPriceLabel.textAlignment = NSTextAlignmentCenter;
        totalPriceLabel.textColor = [UIColor colorWithHexString:@"#434343"];
        totalPriceLabel.font = [UIFont systemFontOfSize:26];
        [hotTopicHeaderView addSubview:totalPriceLabel];

        UILabel *totalAccountLabel = [[UILabel alloc] init];
        totalAccountLabel.text = @"账户总额";
        totalAccountLabel.textAlignment = NSTextAlignmentCenter;
        totalAccountLabel.textColor = [UIColor colorWithHexString:@"#b0b0b0"];
        totalAccountLabel.font = [UIFont systemFontOfSize:14];
        [hotTopicHeaderView addSubview:totalAccountLabel];

        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor colorWithHexString:@"efefef"];
        [hotTopicHeaderView  addSubview:line];
        
        UILabel *blockedPriceLabel = [[UILabel alloc] init];
        blockedPriceLabel.text = @"2000.0";
        blockedPriceLabel.textAlignment = NSTextAlignmentCenter;
        blockedPriceLabel.textColor = [UIColor colorWithHexString:@"#434343"];
        blockedPriceLabel.font = [UIFont systemFontOfSize:20];
        [hotTopicHeaderView addSubview:blockedPriceLabel];
        
        UILabel *blockedAssetsLabel = [[UILabel alloc] init];
        blockedAssetsLabel.text = @"冻结资金";
        blockedAssetsLabel.textAlignment = NSTextAlignmentCenter;
        blockedAssetsLabel.textColor = [UIColor colorWithHexString:@"#b0b0b0"];
        blockedAssetsLabel.font = [UIFont systemFontOfSize:14];
        [hotTopicHeaderView addSubview:blockedAssetsLabel];
        
        UIView *line1 = [[UIView alloc]init];
        line1.backgroundColor = [UIColor colorWithHexString:@"efefef"];
        [hotTopicHeaderView  addSubview:line1];

        
        UILabel *availablePriceLabel = [[UILabel alloc] init];
        availablePriceLabel.text = @"2890.0";
        availablePriceLabel.textAlignment = NSTextAlignmentCenter;
        availablePriceLabel.textColor = [UIColor colorWithHexString:@"#434343"];
        availablePriceLabel.font = [UIFont systemFontOfSize:20];
        [hotTopicHeaderView addSubview:availablePriceLabel];
        
        UILabel *availableBalanceLabel = [[UILabel alloc] init];
        availableBalanceLabel.text = @"可用余额";
        availableBalanceLabel.textAlignment = NSTextAlignmentCenter;
        availableBalanceLabel.textColor = [UIColor colorWithHexString:@"#b0b0b0"];
        availableBalanceLabel.font = [UIFont systemFontOfSize:14];
        [hotTopicHeaderView addSubview:availableBalanceLabel];
        
        UIView *backview = [[UIView alloc]init];
        backview.backgroundColor = [UIColor colorWithHexString:@"e9e9e9"];
        [hotTopicHeaderView  addSubview:backview];

        
        [totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@25);
            make.left.equalTo(hotTopicHeaderView.mas_left).with.offset(100);
            make.right.equalTo(hotTopicHeaderView.mas_right).with.offset(-100);
            make.height.equalTo(@30);
        }];
        
        [totalAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(totalPriceLabel.mas_bottom);
            make.left.equalTo(hotTopicHeaderView.mas_left).with.offset(100);
            make.right.equalTo(hotTopicHeaderView.mas_right).with.offset(-100);
            make.height.equalTo(@20);
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(totalAccountLabel.mas_bottom).with.offset(10);
            make.left.equalTo(@0);
            make.width.equalTo(hotTopicHeaderView);
            make.height.equalTo(@0.5);
        }];

        [blockedPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.mas_bottom).with.offset(10);
            make.left.equalTo(hotTopicHeaderView);
            make.width.equalTo(hotTopicHeaderView).multipliedBy(0.5);
            make.height.equalTo(@30);
        }];
        
        [blockedAssetsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockedPriceLabel.mas_bottom);
            make.left.equalTo(hotTopicHeaderView);
            make.width.equalTo(hotTopicHeaderView).multipliedBy(0.5);
            make.height.equalTo(@20);
        }];

        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.mas_bottom).with.offset(10);
            make.left.equalTo(hotTopicHeaderView.mas_centerX);
            make.width.equalTo(@1);
            make.height.equalTo(@50);
        }];
        
        [availablePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.mas_bottom).with.offset(10);
            make.right.equalTo(hotTopicHeaderView);
            make.width.equalTo(hotTopicHeaderView).multipliedBy(0.5);
            make.height.equalTo(@30);
        }];
        
        [availableBalanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(availablePriceLabel.mas_bottom);
            make.right.equalTo(hotTopicHeaderView);
            make.width.equalTo(hotTopicHeaderView).multipliedBy(0.5);
            make.height.equalTo(@20);
        }];

        [backview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(availableBalanceLabel.mas_bottom).with.offset(10);
            make.left.equalTo(@0);
            make.width.equalTo(hotTopicHeaderView);
            make.height.equalTo(@10);
        }];
        return hotTopicHeaderView;
    }
    return nil;
}


#pragma mark - Event Handler

#pragma mark - Getter




@end
