//
//  DLLineDestinationViewController.m
//  Dalv
//
//  Created by Nie on 2017/6/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineDestinationViewController.h"
#import "DLRecommendRouteCollectionViewCell.h"
#import "DLLineTourDetailViewController.h"
#import "DLHomeViewTask.h"

static NSString *kMSLineDestinationTableViewFooter = @"MSLineDestinationTableViewFooter";

@interface DLLineDestinationViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *lineDestinationCollectionView;

@property (nonatomic, strong) NSMutableArray *lineDestinationViewList;

@property (nonatomic, assign) NSInteger pageIndex;


@end

@implementation DLLineDestinationViewController

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
    self.title = @"目的地";
}

#pragma mark - Setup subViews
- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0.0f;
    layout.minimumLineSpacing = 8.0f;
    layout.itemSize = CGSizeMake((self.view.ms_width - 20) * 0.5f, 230.0f);
    UICollectionView *lineDestinationCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    lineDestinationCollectionView.dataSource = self;
    lineDestinationCollectionView.delegate = self;
    lineDestinationCollectionView.backgroundColor = [UIColor clearColor];
    lineDestinationCollectionView.contentInset = UIEdgeInsetsMake(0, 6, 10, 6);
    [lineDestinationCollectionView registerClass:[DLRecommendRouteCollectionViewCell class]forCellWithReuseIdentifier:[DLRecommendRouteCollectionViewCell cellIdentifier]];
    [lineDestinationCollectionView registerClass:[UICollectionReusableView class]
                   forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                          withReuseIdentifier:kMSLineDestinationTableViewFooter];
    
    self.lineDestinationCollectionView = lineDestinationCollectionView;
    [self.view addSubview:lineDestinationCollectionView];
    
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.lineDestinationCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
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
                            @"type" : @"1",
                            @"id" : @"4462",

                            };
    [[DLHUDManager sharedInstance] showProgressWithText:@"正在加载中" OnView:self.view];
    [DLHomeViewTask getOutboundLists:param completion:^(id result, NSError *error) {
        [[DLHUDManager sharedInstance] hiddenHUD];
        if (result) {
            NSArray *lineDestinationViewArray = [DLRecommendRouteModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.lineDestinationViewList removeAllObjects];
            [_lineDestinationViewList addObjectsFromArray:lineDestinationViewArray];
            [self.lineDestinationCollectionView reloadData];
            
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.lineDestinationViewList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DLRecommendRouteCollectionViewCell *cell = [DLRecommendRouteCollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath];
    DLRecommendRouteModel *routeModel = [self.lineDestinationViewList objectAtIndex:indexPath.item];
    cell.routeModel = routeModel;
    [cell configureLineDestinationCell:routeModel];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
           UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kMSLineDestinationTableViewFooter forIndexPath:indexPath];
        
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

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    DLRecommendRouteModel *routeModel = [self.lineDestinationViewList objectAtIndex:indexPath.item];
    
    DLLineTourDetailViewController *linetourDetailVC = [[DLLineTourDetailViewController alloc]init];
    linetourDetailVC.routeModel = routeModel;
    [self.navigationController pushViewController:linetourDetailVC animated:YES];
    
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

- (NSMutableArray *)lineDestinationViewList {
    if (_lineDestinationViewList == nil) {
        _lineDestinationViewList = [[NSMutableArray alloc] init];
    }
    return _lineDestinationViewList;
}


@end
