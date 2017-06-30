//
//  DLFianceController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/24.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRechargeApplicationViewController.h"
#import "DLPresentApplicationViewController.h"
#import "DLTransactionRecordViewController.h"
#import "DLContractApplyRecordController.h"
#import "DLRechargeRecordViewController.h"
#import "DLInvoiceApplyRecordController.h"
#import "DLHomeMenuCollectionViewCell.h"
#import "DLCashRegisterViewController.h"
#import "DLInvioiceApplyController.h"
#import "DLContractApplyController.h"
#import "DLHomePageViewModel.h"
#import "DLFianceController.h"
#import "DLHomeViewTask.h"

static NSString *kDLFianceCollectionViewHeader = @"DLFianceCollectionViewHeader";

@interface DLFianceController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *appCollectionView;
@property (nonatomic, strong) NSArray *apps;

@property (nonatomic,strong) NSMutableDictionary *fianceDict;
@property (nonatomic,strong) UILabel *totalPriceLabel;
@property (nonatomic,strong) UILabel *blockedPriceLabel;
@property (nonatomic,strong) UILabel *availablePriceLabel;

@end

@implementation DLFianceController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
    [self fetchData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refershfiance)
                                                 name:kFianceNotification
                                               object:nil];
}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
    
}

- (void)setupNavbar {
    self.title = @"财务";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - Setup subViews

- (void)setupSubviews {
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
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],};
     @weakify(self);
    [DLHomeViewTask getAgencyFinance:param completion:^(id result, NSError *error) {
        @strongify(self);
       if (result) {
           self.fianceDict = [[NSMutableDictionary alloc] init];
           self.fianceDict = [result objectForKey:@"agencyInfo"];
           [self.appCollectionView reloadData];
       }else {
           [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
       }
    }];
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.apps.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DLHomeMenuCollectionViewCell *cell = [DLHomeMenuCollectionViewCell cellWithCollectionView:collectionView IndexPath:indexPath];
    
    DLFinanceMenuItem *menuItem = [self.apps objectAtIndex:indexPath.item];
    cell.showsSeparator = YES;
    [cell configureFinanceCell:menuItem];
    return cell;
    
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:{
            DLTransactionRecordViewController *transrecordVC = [[DLTransactionRecordViewController alloc]init];
            [self.navigationController pushViewController:transrecordVC animated:YES];
        }
            break;
        case 1:
        {
            DLRechargeApplicationViewController *recharVC = [[DLRechargeApplicationViewController alloc]init];
            [self.navigationController pushViewController:recharVC animated:YES];
        }
            break;
        case 2:
        {
            DLRechargeRecordViewController *recharReVC = [[DLRechargeRecordViewController alloc]init];
            [self.navigationController pushViewController:recharReVC animated:YES];
        }
            break;
        case 3:
        {
            DLPresentApplicationViewController *presentReVC = [[DLPresentApplicationViewController alloc]init];
            [self.navigationController pushViewController:presentReVC animated:YES];
        }
            break;
        case 4:
        {
            DLCashRegisterViewController *cashRVC = [[DLCashRegisterViewController alloc]init];
            [self.navigationController pushViewController:cashRVC animated:YES];
        }
            break;
        case 5:
        {
            DLInvioiceApplyController *invoiceApplyVC = [[DLInvioiceApplyController alloc] init];
            [self.navigationController pushViewController:invoiceApplyVC animated:YES];
        }
            break;
        case 6:
        {
            DLInvoiceApplyRecordController *invoiceVC = [[DLInvoiceApplyRecordController alloc] init];
            [self.navigationController pushViewController:invoiceVC animated:YES];
        }
            break;
        case 7:
        {
            DLContractApplyController *contractVC = [[DLContractApplyController alloc] init];
            [self.navigationController pushViewController:contractVC animated:YES];
        }
            break;
        case 8:
        {
            DLContractApplyRecordController *contractApplyRecordVC = [[DLContractApplyRecordController alloc] init];
            [self.navigationController pushViewController:contractApplyRecordVC animated:YES];
        }
            break;
        default:
            break;
    }
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *hotTopicHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kDLFianceCollectionViewHeader forIndexPath:indexPath];
        hotTopicHeaderView.backgroundColor = [UIColor whiteColor];
        
        UILabel *totalPriceLabel = [[UILabel alloc] init];
        totalPriceLabel.textAlignment = NSTextAlignmentCenter;
        totalPriceLabel.textColor = [UIColor colorWithHexString:@"#434343"];
        totalPriceLabel.font = [UIFont systemFontOfSize:26];
        [hotTopicHeaderView addSubview:totalPriceLabel];
        self.totalPriceLabel = totalPriceLabel;
        if (self.fianceDict) {
            totalPriceLabel.text = [NSString stringWithFormat:@"%.2f",[[self.fianceDict objectForKey:@"account_balance"] integerValue]/100.00];
        }
        
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
        blockedPriceLabel.textAlignment = NSTextAlignmentCenter;
        blockedPriceLabel.textColor = [UIColor colorWithHexString:@"#434343"];
        blockedPriceLabel.font = [UIFont systemFontOfSize:20];
        [hotTopicHeaderView addSubview:blockedPriceLabel];
        self.blockedPriceLabel = blockedPriceLabel;
        if (self.fianceDict) {
            blockedPriceLabel.text = [NSString stringWithFormat:@"%.2f",[[self.fianceDict objectForKey:@"freezeMoney"]integerValue]/100.00];
        }
       
        
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
        availablePriceLabel.textAlignment = NSTextAlignmentCenter;
        availablePriceLabel.textColor = [UIColor colorWithHexString:@"#434343"];
        availablePriceLabel.font = [UIFont systemFontOfSize:20];
        [hotTopicHeaderView addSubview:availablePriceLabel];
        self.availablePriceLabel = availablePriceLabel;
        if (self.fianceDict) {
            availablePriceLabel.text = [NSString stringWithFormat:@"%.2f",[[self.fianceDict objectForKey:@"availableBalance"]integerValue]/100.00];
        }
        
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
            make.left.equalTo(hotTopicHeaderView.mas_left).with.offset(20);
            make.right.equalTo(hotTopicHeaderView.mas_right).with.offset(-20);
            make.height.equalTo(@30);
        }];
        
        [totalAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(totalPriceLabel.mas_bottom);
            make.left.equalTo(hotTopicHeaderView.mas_left).with.offset(20);
            make.right.equalTo(hotTopicHeaderView.mas_right).with.offset(-20);
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

- (void)refershfiance {
    self.totalPriceLabel.text = @"";
    self.blockedPriceLabel.text = @"";
    self.availablePriceLabel.text = @"";
    [self fetchData];
}

@end
