//
//  DLLineTourViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/12.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineTourViewController.h"
#import "DLRecommendRouteCollectionViewCell.h"
#import "DLLineTourDetailViewController.h"
#import "DLHomeViewTask.h"
#import "DLLineDestinationViewController.h"
static NSString *kMSLineTourViewTableViewHeader = @"MSLineTourViewTableViewHeader";
static NSString *kMSLineTourViewTableViewFooter = @"MSLineTourViewTableViewFooter";

@interface DLLineTourViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *lineTourViewCollectionView;

@property (nonatomic, strong) NSMutableArray *lineTourViewList;

@property (strong, nonatomic) UISearchBar *searchBar;

@property (strong,nonatomic) UIImageView *headImage;

@property (nonatomic, assign) NSInteger pageIndex;

@end

@implementation DLLineTourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex = 1;
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
    self.title = _homeMenuItem.name;
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0.0f;
    layout.minimumLineSpacing = 8.0f;
    layout.itemSize = CGSizeMake((self.view.ms_width - 20) * 0.5f, 230.0f);
    UICollectionView *lineTourViewCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    lineTourViewCollectionView.dataSource = self;
    lineTourViewCollectionView.delegate = self;
    lineTourViewCollectionView.backgroundColor = [UIColor clearColor];
    lineTourViewCollectionView.contentInset = UIEdgeInsetsMake(0, 6, 10, 6);
    [lineTourViewCollectionView registerClass:[DLRecommendRouteCollectionViewCell class]
               forCellWithReuseIdentifier:[DLRecommendRouteCollectionViewCell cellIdentifier]];
    [lineTourViewCollectionView registerClass:[UICollectionReusableView class]
               forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                      withReuseIdentifier:kMSLineTourViewTableViewHeader];
    [lineTourViewCollectionView registerClass:[UICollectionReusableView class]
               forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                      withReuseIdentifier:kMSLineTourViewTableViewFooter];

    self.lineTourViewCollectionView = lineTourViewCollectionView;
    [self.view addSubview:lineTourViewCollectionView];

}

#pragma mark - Layout

- (void)setupConstraints {
    [self.lineTourViewCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Fetch data

- (void)beginLoading {
    [self fetchData];
}
- (void)fetchData {
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            @"page" : @(self.pageIndex),
                            @"type" : self.homeMenuItem.type,
                            };
    [[DLHUDManager sharedInstance] showProgressWithText:@"正在加载中" OnView:self.view];
    [DLHomeViewTask getHomeOutbound:param completion:^(id result, NSError *error) {
        [[DLHUDManager sharedInstance] hiddenHUD];
        if (result) {
            NSArray *recommendRouteArray = [DLRecommendRouteModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.lineTourViewList removeAllObjects];
            [_lineTourViewList addObjectsFromArray:recommendRouteArray];
            [self.lineTourViewCollectionView reloadData];
            
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.lineTourViewList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DLRecommendRouteCollectionViewCell *cell = [DLRecommendRouteCollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath];
    DLRecommendRouteModel *routeModel = [self.lineTourViewList objectAtIndex:indexPath.item];
    cell.routeModel = routeModel;
    [cell configureLineTourCell:routeModel];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {

        UICollectionReusableView *hotTopicHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kMSLineTourViewTableViewHeader forIndexPath:indexPath];
        hotTopicHeaderView.backgroundColor = [UIColor whiteColor];
    
        UIView *flagView = [[UIView alloc] init];
        [hotTopicHeaderView addSubview:flagView];
    
        self.headImage = [[UIImageView alloc]init];
        self.headImage.image = [UIImage imageNamed:@"mine_theme"];
        [flagView addSubview:self.headImage];
        
        _searchBar = [[UISearchBar alloc] init];
        [flagView addSubview:_searchBar];
        _searchBar.placeholder = @"支持模糊搜索：路线,景点,代码";
        self.searchBar.tintColor = [UIColor ms_orangeColor];
        self.searchBar.backgroundColor = [UIColor whiteColor];
        [self.searchBar setBackgroundImage: [UIImage imageWithColor:[UIColor whiteColor] ] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        for (UIView *view in self.searchBar.subviews.firstObject.subviews) {
            if ([view isKindOfClass:[UITextField class]]) {
                view.backgroundColor = [UIColor ms_backgroundColor];
            }
        }
        _searchBar.showsCancelButton = NO;
    
    [flagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(hotTopicHeaderView);
        make.height.equalTo(@140);
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(flagView);
        make.height.equalTo(@100);
    }];
        
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage.mas_bottom).offset(10);
        make.left.equalTo(@20);
        make.width.equalTo(flagView).offset(-40);
        make.height.equalTo(@40);
    }];
        return hotTopicHeaderView;
    }else if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kMSLineTourViewTableViewFooter forIndexPath:indexPath];
        
                UIButton *footerButton = [footerView viewWithTag:10001];
                if (footerButton == nil) {
                    footerButton = [[UIButton alloc] init];
                    footerButton.tag = 10001;
                    [footerButton setTitle:@"查  看  更  多" forState:UIControlStateNormal];
                    [footerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    footerButton.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
                    footerButton.layer.cornerRadius = 12.0f;
                    footerButton.layer.masksToBounds = YES;
                    footerButton.layer.borderColor = [UIColor colorWithHexString:@"#fE603B"].CGColor;
                    footerButton.layer.borderWidth = 0.5f;

                    footerButton.titleLabel.font = [UIFont systemFontOfSize:18];
                    [footerButton addTarget:self action:@selector(didTapViewMore:) forControlEvents:UIControlEventTouchUpInside];
        
                    [footerView addSubview:footerButton];
                    [footerButton mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.height.equalTo(@30);
                        make.top.equalTo(@15);
                        make.left.equalTo(@100);
                        make.right.equalTo(self.view.mas_right).offset(-100);
                    }];
                }
        return footerView;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    DLRecommendRouteModel *routeModel = [self.lineTourViewList objectAtIndex:indexPath.item];
    
    DLLineTourDetailViewController *linetourDetailVC = [[DLLineTourDetailViewController alloc]init];
    linetourDetailVC.routeModel = routeModel;
    [self.navigationController pushViewController:linetourDetailVC animated:YES];
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.ms_width, 160.0f);
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(self.view.ms_width, 50.0f);
}

#pragma mark - Event Handler

- (void)didTapViewMore:(UIButton *)sender {
    NSLog(@"点击了查看更多");
    self.pageIndex++;
    [self fetchData];

}

#pragma mark - Getter

- (NSMutableArray *)lineTourViewList {
    if (_lineTourViewList == nil) {
        _lineTourViewList = [[NSMutableArray alloc] init];
    }
    return _lineTourViewList;
}

@end
