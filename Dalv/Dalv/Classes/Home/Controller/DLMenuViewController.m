//
//  DLMenuViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMenuViewController.h"
#import "DLHomeMenuCollectionViewCell.h"
#import "DLHomePageViewModel.h"
#import "DLLineTourViewController.h"

@interface DLMenuViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *appCollectionView;

@property (nonatomic, strong) NSArray *apps;

@end

@implementation DLMenuViewController

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
    self.title = @"菜单";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    NSInteger row = 4;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0.0f;
    layout.minimumLineSpacing = 0.0f;
    layout.itemSize = CGSizeMake(self.view.ms_width / row, 80);
    UICollectionView *appCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    appCollectionView.dataSource = self;
    appCollectionView.delegate = self;
    appCollectionView.backgroundColor = [UIColor whiteColor];
    appCollectionView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
    [appCollectionView registerClass:[DLHomeMenuCollectionViewCell class]
          forCellWithReuseIdentifier:[DLHomeMenuCollectionViewCell cellIdentifier]];
     
    self.appCollectionView = appCollectionView;
    [self.view addSubview:appCollectionView];
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.appCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Fetch data

- (void)fetchData {
   
    self.apps = [DLHomePageViewModel creatMenuItems];
    [self.appCollectionView reloadData];
    
    if (self.didCompleteLoad) {
        self.didCompleteLoad();
    }

 }

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.apps.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DLHomeMenuCollectionViewCell *cell = [DLHomeMenuCollectionViewCell cellWithCollectionView:collectionView IndexPath:indexPath];
    
    DLHomeMenuItem *menuItem = [self.apps objectAtIndex:indexPath.row];
    cell.showsSeparator = NO;
    [cell configureCell:menuItem];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    DLLineTourViewController *DLlinetourVC = [[DLLineTourViewController alloc]init];
    [self.navigationController pushViewController:DLlinetourVC animated:YES];}


#pragma mark - Public Methods

- (CGFloat)contentHeight {
    [self.view layoutIfNeeded];
    if (self.appCollectionView.contentSize.height == 0) {
        return 0;
    } else {
        return self.appCollectionView.contentSize.height +
        self.appCollectionView.contentInset.top +
        self.appCollectionView.contentInset.bottom;
    }
}

@end
