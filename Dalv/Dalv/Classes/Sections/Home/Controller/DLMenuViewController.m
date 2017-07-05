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
#import "DLHomeViewTask.h"
#import "DLHomePageMenuModel.h"
#import "DLPlaneTicketViewController.h"
@interface DLMenuViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *appCollectionView;

@property (nonatomic, strong) NSArray *apps;

@property (nonatomic, strong) DLHomeMenuItem *columnList;


@end

@implementation DLMenuViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
    
    if([[DLUtils getUser_type]  isEqualToString: @"4"]){
    [self fetchData];
    } else{
    [self ordinaryFetchData];
    }
    
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

- (void)ordinaryFetchData {
    
    if ([[DLUtils getUser_bingdingState] isEqualToString:@"1"]) {

    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                                    @"sign_token" : [DLUtils getSign_token],};
    [DLHomeViewTask getTouristAgencyIndexMod:param completion:^(id result, NSError *error) {
        DLHomePageMenuModel *homePageMenuModel = [DLHomePageMenuModel mj_objectWithKeyValues:result];
        self.apps = homePageMenuModel.columnList;
        [self.appCollectionView reloadData];
        if (self.didCompleteLoad) {
            self.didCompleteLoad(homePageMenuModel);
        }
    }];
    } else {
        
//        NSDictionary *param = @{@"uid" : [DLUtils getUid],
//                                @"sign_token" : [DLUtils getSign_token],};
        [DLHomeViewTask getHomeIndexMod:nil completion:^(id result, NSError *error) {
            DLHomePageMenuModel *homePageMenuModel = [DLHomePageMenuModel mj_objectWithKeyValues:result];
            self.apps = homePageMenuModel.columnList;
            [self.appCollectionView reloadData];
            
            if (self.didCompleteLoad) {
                self.didCompleteLoad(homePageMenuModel);
            }
        }];

    }
}
- (void)fetchData {
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],};
    [DLHomeViewTask getHomeAgencyIndexModl:param completion:^(id result, NSError *error) {
        DLHomePageMenuModel *homePageMenuModel = [DLHomePageMenuModel mj_objectWithKeyValues:result];
        self.apps = homePageMenuModel.columnList;
        [self.appCollectionView reloadData];
        if (self.didCompleteLoad) {
            self.didCompleteLoad(homePageMenuModel);
        }
    }];
 }

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.apps.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DLHomeMenuCollectionViewCell *cell = [DLHomeMenuCollectionViewCell cellWithCollectionView:collectionView IndexPath:indexPath];
    
    DLHomeMenuItem *menuItem = [self.apps objectAtIndex:indexPath.row];
    cell.homeMenuItem = menuItem;
    cell.showsSeparator = NO;
    [cell configureCell:menuItem];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    DLHomeMenuCollectionViewCell *cell = (DLHomeMenuCollectionViewCell*) [self.appCollectionView cellForItemAtIndexPath:indexPath];
    if (cell.homeMenuItem.type.integerValue == 5 ||
        cell.homeMenuItem.type.integerValue == 7) {
        [[DLHUDManager sharedInstance] showTextOnly:@"正在拼命开发中...."];
    } else if (cell.homeMenuItem.type.integerValue == 6) {
        DLPlaneTicketViewController *planeticketVC = [[DLPlaneTicketViewController alloc]init];
        [self.navigationController pushViewController:planeticketVC animated:YES];
    } else {
        DLLineTourViewController *linetourVC = [[DLLineTourViewController alloc]init];
        linetourVC.homeMenuItem = [self.apps objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:linetourVC animated:YES];
    }
}


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
