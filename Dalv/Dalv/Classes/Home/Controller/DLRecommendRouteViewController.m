//
//  DLRecommendRouteViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRecommendRouteViewController.h"
#import "DLRecommendRouteCollectionViewCell.h"

static NSString *kMSHotTopicTableViewHeader = @"MSHotTopicTableViewHeader";
static NSString *kMSHotTopicTableViewFooter = @"MSHotTopicTableViewFooter";

@interface DLRecommendRouteViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *hotTopicCollectionView;

@property (nonatomic, strong) NSMutableArray *topicList;

@end

@implementation DLRecommendRouteViewController

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
    self.title = @"推荐线路";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0.0f;
    layout.minimumLineSpacing = 8.0f;
    layout.itemSize = CGSizeMake((self.view.ms_width - 20) * 0.5f, 230.0f);
    UICollectionView *hotTopicCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    hotTopicCollectionView.dataSource = self;
    hotTopicCollectionView.delegate = self;
    hotTopicCollectionView.backgroundColor = [UIColor clearColor];
    hotTopicCollectionView.contentInset = UIEdgeInsetsMake(0, 6, 10, 6);
    [hotTopicCollectionView registerClass:[DLRecommendRouteCollectionViewCell class]
               forCellWithReuseIdentifier:[DLRecommendRouteCollectionViewCell cellIdentifier]];
    //    [hotTopicCollectionView registerClass:[UICollectionReusableView class]
    //               forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
    //                      withReuseIdentifier:kMSHotTopicTableViewHeader];
    [hotTopicCollectionView registerClass:[UICollectionReusableView class]
               forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                      withReuseIdentifier:kMSHotTopicTableViewFooter];
    self.hotTopicCollectionView = hotTopicCollectionView;
    [self.view addSubview:hotTopicCollectionView];
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.hotTopicCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Fetch data

- (void)fetchData {
    
    //  模拟请求推荐线路的数据
    NSMutableArray *recommendRouteArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < random() % 30; i++) {
        DLRecommendRouteModel *topic = [[DLRecommendRouteModel alloc] init];
        [recommendRouteArray addObject:topic];
    }
    
    [self.topicList addObjectsFromArray:recommendRouteArray];
    [self.hotTopicCollectionView reloadData];
    
    if (self.didCompleteLoad) {
        self.didCompleteLoad();
    }

}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.topicList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DLRecommendRouteCollectionViewCell *cell = [DLRecommendRouteCollectionViewCell cellWithCollectionView:collectionView indexPath:indexPath];
    DLRecommendRouteModel *model = [self.topicList objectAtIndex:indexPath.row];
     [cell configureCell:model];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *hotTopicHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kMSHotTopicTableViewHeader forIndexPath:indexPath];
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
    } else if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kMSHotTopicTableViewFooter forIndexPath:indexPath];
        
        UIButton *footerButton = [footerView viewWithTag:10001];
        if (footerButton == nil) {
            footerButton = [[UIButton alloc] init];
            footerButton.tag = 10001;
            [footerButton setTitle:@"查看更多>>" forState:UIControlStateNormal];
            [footerButton setTitleColor:[UIColor ms_blackColor] forState:UIControlStateNormal];
            footerButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [footerButton addTarget:self action:@selector(didTapViewMore:) forControlEvents:UIControlEventTouchUpInside];
            
            [footerView addSubview:footerButton];
            [footerButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@15);
                make.center.equalTo(footerView);
            }];
        }
        return footerView;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    NSLog(@"点击了推荐线路");
 }


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(self.view.ms_width, 50.0f);
}

#pragma mark - Event Handler

- (void)didTapViewMore:(UIButton *)sender {
    NSLog(@"点击了查看更多");

}

#pragma mark - Public Methods

- (CGFloat)contentHeight {
    [self.view layoutIfNeeded];
    if (self.topicList.count == 0 || self.hotTopicCollectionView.contentSize.height == 0) {
        return 0;
    } else {
        return self.hotTopicCollectionView.contentSize.height +
        self.hotTopicCollectionView.contentInset.top +
        self.hotTopicCollectionView.contentInset.bottom;
    }
}

#pragma mark - Getter

- (NSMutableArray *)topicList {
    if (_topicList == nil) {
        _topicList = [[NSMutableArray alloc] init];
    }
    return _topicList;
}


@end
