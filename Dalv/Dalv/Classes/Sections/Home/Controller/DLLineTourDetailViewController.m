//
//  DLLineTourDetailViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineTourDetailViewController.h"
#import "DLLineDetialpriceTableViewCell.h"
#import "DLCycleScrollView.h"
#import "DLLineDetailsScrollViewController.h"
#import "DLPlaceOrderViewController.h"


static NSString *kDLHomeTableViewCell = @"DLHomeTableViewCell";
static NSString *kDLLineDetialpriceTableViewCell = @"DLLineDetialpriceTableViewCell";
static NSString *kDLHomeTableViewHeader = @"DLHomeTableViewHeader";
@interface DLLineTourDetailViewController ()< UITableViewDelegate, UITableViewDataSource,DLCycleScrollViewDelegate>
@property (nonatomic, weak) UITableView *homeTableView;
@property (nonatomic, strong) DLCycleScrollView *advertCarouselView;

@end

@implementation DLLineTourDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
    [self fetchData];

    self.view.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - Setup navbar
- (void)setupNavbar {
    self.title = @"线路详情";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    UITableView *homeTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    homeTableView.delegate = self;
    homeTableView.dataSource = self;
    homeTableView.backgroundColor = [UIColor clearColor];
    homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    homeTableView.tableFooterView = [[UIView alloc] init];
    [homeTableView registerClass:[UITableViewCell class]
          forCellReuseIdentifier:kDLHomeTableViewCell];
    [homeTableView registerClass:[UITableViewCell class]
          forCellReuseIdentifier:kDLLineDetialpriceTableViewCell];
    [homeTableView registerClass:[UITableViewHeaderFooterView class]
    forHeaderFooterViewReuseIdentifier:kDLHomeTableViewHeader];
    
    self.homeTableView = homeTableView;
    [self.view addSubview:homeTableView];
    
    [self cofigureBottomView];
    
}

- (void)cofigureBottomView {
    
    UIButton *pushHomePageBtn = [[UIButton alloc]init];
    [pushHomePageBtn setTitle:@"推到首页" forState:(UIControlStateNormal)];
    [pushHomePageBtn setImage:[UIImage imageNamed:@"recommended_home.png"] forState:UIControlStateNormal];
    [pushHomePageBtn addTarget:self action:@selector(pushHomePageBtn) forControlEvents:UIControlEventTouchUpInside];
    pushHomePageBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
    pushHomePageBtn.imageEdgeInsets =  UIEdgeInsetsMake(0,0,0,10);
    pushHomePageBtn.layer.cornerRadius = 20.0;
    [self.view addSubview:pushHomePageBtn];
    
    [pushHomePageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.width.equalTo(@150);
    }];

    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor ms_separatorColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@40.5);
    }];
    
    // 电话咨询和立即订购按钮
    UIButton *telSonsultationBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-104, SCREEN_WIDTH/2, 40)];
    [telSonsultationBtn setTitle:@"电话咨询" forState:(UIControlStateNormal)];
    [telSonsultationBtn setImage:[UIImage imageNamed:@"phone.png"] forState:UIControlStateNormal];
    [telSonsultationBtn addTarget:self action:@selector(telSonsultationBtn) forControlEvents:UIControlEventTouchUpInside];
    [telSonsultationBtn  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    telSonsultationBtn.backgroundColor = [UIColor whiteColor];
    telSonsultationBtn.imageEdgeInsets =  UIEdgeInsetsMake(0,0,0,10);
    [self.view addSubview:telSonsultationBtn];
    
    UIButton *OtherBtn = [[UIButton alloc]initWithFrame:CGRectMake(telSonsultationBtn.right, telSonsultationBtn.y,telSonsultationBtn.width, telSonsultationBtn.height)];
    [OtherBtn addTarget:self action:@selector(OtherBtn) forControlEvents:UIControlEventTouchUpInside];
    OtherBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
    [OtherBtn setTitle:@"立即订购" forState:(UIControlStateNormal)];
    [self.view addSubview:OtherBtn];
    
}
#pragma mark - Layout

- (void)setupConstraints {
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDLHomeTableViewCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    if (indexPath.section == 0) {
        [cell.contentView addSubview:self.advertCarouselView];
        [self.advertCarouselView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
    } else if (indexPath.section == 1) {
        
    } else if (indexPath.section == 2) {
//        [cell.contentView addSubview:self.hotTopicViewController.view];
//        [self.hotTopicViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(cell.contentView);
//        }];
        
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100.f;
    } else if (indexPath.section == 1) {
//        return [self.appCenterViewController contentHeight];
    } else if (indexPath.section == 2) {
//        NSLog(@"高度%f",[self.hotTopicViewController contentHeight]);
//        return [self.hotTopicViewController contentHeight];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 2 ? 40.0f : 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)cycleScrollView:(DLCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    DLLineDetailsScrollViewController *DLLineDetScrVC = [[DLLineDetailsScrollViewController alloc]init];
    [self.navigationController pushViewController:DLLineDetScrVC animated:YES];
}

- (DLCycleScrollView *)advertCarouselView {
    if (_advertCarouselView == nil) {
        _advertCarouselView = [[DLCycleScrollView alloc] init];
        _advertCarouselView.delegate = self;
        _advertCarouselView.backgroundColor = [UIColor clearColor];
        _advertCarouselView.autoScrollTimeInterval = 4.0f;
        _advertCarouselView.pageControlBottomOffset = -5.0f;
        _advertCarouselView.pageDotColor = [UIColor whiteColor];
    }
    return _advertCarouselView;
}

#pragma mark - Fetch data

- (void)fetchData {
    self.advertCarouselView.imageURLStringsGroup = @[@"http://u1.img.mobile.sina.cn/public/files/image/640x172_img5900ada55a074.png",
                                                     @"http://7xje8b.com1.z0.glb.clouddn.com/huodong1@3x.png",
                                                     @"http://u1.img.mobile.sina.cn/public/files/image/640x172_img59018d4a6d8f9.png",
                                                     @"http://u1.img.mobile.sina.cn/public/files/image/640x172_img5901926890af4.png",
                                                     @"http://7xje8b.com1.z0.glb.clouddn.com/huodong1@3x.png"];
   

}


- (void)telSonsultationBtn
{
    NSLog(@"点击了电话咨询");
}

- (void)OtherBtn
{
    DLPlaceOrderViewController *placeOrderVC = [[DLPlaceOrderViewController alloc]init];
        placeOrderVC.routeName = @"迷情乌镇双飞三日游迷情乌镇双飞三日游迷情乌镇双飞三日游迷情乌镇双飞三日游迷情乌镇双飞三日游迷情乌镇双飞三日游迷情乌镇双飞三日游迷情乌镇双飞三日游迷情乌镇双飞三日游迷情乌镇双飞三日游迷情乌镇双飞三日游";
    [self.navigationController pushViewController:placeOrderVC animated:YES];

}

- (void)pushHomePageBtn
{
    NSLog(@"点击了推到首页");
}


@end
