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

- (void)setupNavbar {
    self.title = @"订单";
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
    layout.headerReferenceSize = CGSizeMake(self.view.ms_width, 200);
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
        hotTopicHeaderView.backgroundColor = [UIColor randomColor];
        UIView *flagView = [[UIView alloc] init];
        flagView.backgroundColor = [UIColor colorWithHexString:@"#f74c31"];
        
        UILabel *headerLabel = [[UILabel alloc] init];
        headerLabel.text = @"推荐线路";
        headerLabel.textColor = [UIColor ms_blackColor];
        headerLabel.font = [UIFont systemFontOfSize:14];
        
        [hotTopicHeaderView addSubview:flagView];
        [hotTopicHeaderView addSubview:headerLabel];
        [flagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hotTopicHeaderView);
            make.size.mas_equalTo(CGSizeMake(5, 15));
            make.centerY.equalTo(hotTopicHeaderView);
        }];
        [headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(flagView.mas_right).with.offset(5);
            make.height.equalTo(@15);
            make.centerY.equalTo(hotTopicHeaderView);
        }];
        return hotTopicHeaderView;
    }
    return nil;
}


#pragma mark - Event Handler

#pragma mark - Getter




@end
