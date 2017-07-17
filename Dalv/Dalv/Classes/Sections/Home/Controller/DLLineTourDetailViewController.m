//
//  DLLineTourDetailViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/17.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ----------------- 首页线路详情  --------------------

#import "DLLineTourDetailViewController.h"
#import "DLLineDetialpriceTableViewCell.h"
#import "DLCycleScrollView.h"
#import "DLLineDetailsScrollViewController.h"
#import "DLPlaceOrderViewController.h"
#import "DLHomeViewTask.h"
#import "DLLineDetialTableViewCell.h"
#import "DLLineModificationViewController.h"
#import "DLChangeTitleViewController.h"
#import "DLCalendarViewController.h"
#import "DLMyAgencyUnBindingController.h"

static NSString *kDLHomeTableViewCell = @"DLHomeTableViewCell";
static NSString *kDLHomeTableViewHeader = @"DLHomeTableViewHeader";

@interface DLLineTourDetailViewController ()< UITableViewDelegate, UITableViewDataSource,DLCycleScrollViewDelegate,DLLineDetialTableViewCellDelegate,UIAlertViewDelegate>
@property (nonatomic, weak) UITableView *homeTableView;

@property (nonatomic, strong) DLCycleScrollView *advertCarouselView;

@property (nonatomic, strong) DLLineTourDetailInforModel *detaiInfoModel;//线路详情模型
@property (nonatomic, copy) NSString *htmlString;//htmlString
@property (nonatomic, strong) NSMutableArray <DLLineTourDetailDaysModel *> *schedulingArray;//日程安排数据
@end

@implementation DLLineTourDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    [self setupConstraints];
//    [self fetchData];
    if([[DLUtils getUser_type]  isEqualToString: @"4"]){
        [self fetchData];
    } else{
        [self ordinaryFetchData];
    }

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupNavBarBackgroundColor:[UIColor colorWithHexString:@"#315599"]titleColor:[UIColor whiteColor]];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self setupNavBarDefaultTheme];
    
}

#pragma mark - Setup navbar
- (void)setupNavbar {
    self.title = @"线路详情";
    
    UIBarButtonItem *backItem = [UIBarButtonItem itemWithImageName:@"navbar_back_white"
                                                     highImageName:nil
                                                            target:self
                                                            action:@selector(didTapBackAction:)];
    self.navigationItem.leftBarButtonItem = backItem;
    
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
    [homeTableView registerClass:[DLLineDetialpriceTableViewCell class]
          forCellReuseIdentifier:[DLLineDetialpriceTableViewCell cellIdentifier]];
    [homeTableView registerClass:[DLLineDetialTableViewCell class]
          forCellReuseIdentifier:[DLLineDetialTableViewCell cellIdentifier]];
    [homeTableView registerClass:[UITableViewHeaderFooterView class]
forHeaderFooterViewReuseIdentifier:kDLHomeTableViewHeader];
    
    self.homeTableView = homeTableView;
    [self.view addSubview:homeTableView];
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-40);
    }];
    
    if([[DLUtils getUser_type]  isEqualToString: @"4"]){
    [self cofigureBottomView];
    }else{
    [self cofigureTellView];
    }
    
}

- (void)cofigureTellView {
    
    UIButton *telSonsultationBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-104, SCREEN_WIDTH, 40)];
    [telSonsultationBtn setTitle:@"电话咨询" forState:(UIControlStateNormal)];
    [telSonsultationBtn setImage:[UIImage imageNamed:@"phone.png"] forState:UIControlStateNormal];
    telSonsultationBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [telSonsultationBtn addTarget:self action:@selector(telSonsultationBtn) forControlEvents:UIControlEventTouchUpInside];
    telSonsultationBtn.backgroundColor = [UIColor colorWithHexString:@"#fE603B"];
    [telSonsultationBtn  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    telSonsultationBtn.imageEdgeInsets =  UIEdgeInsetsMake(0,0,0,10);
    telSonsultationBtn.layer.cornerRadius = 2.0;
    [self.view addSubview:telSonsultationBtn];
}

- (void)cofigureBottomView {
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor ms_separatorColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@40.5);
    }];
    
    // 电话咨询和立即订购按钮
    
    UIButton *pushHomePageBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-104, SCREEN_WIDTH/4, 40)];
    [pushHomePageBtn setTitle:@"推到首页" forState:(UIControlStateNormal)];
    [pushHomePageBtn setImage:[UIImage imageNamed:@"recommended_home.png"] forState:UIControlStateNormal];
    [pushHomePageBtn addTarget:self action:@selector(pushHomePageBtn) forControlEvents:UIControlEventTouchUpInside];
    pushHomePageBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    pushHomePageBtn.backgroundColor = [UIColor whiteColor];
    [pushHomePageBtn  setTitleColor:[UIColor colorWithHexString:@"#fE603B"] forState:UIControlStateNormal];
    pushHomePageBtn.imageEdgeInsets =  UIEdgeInsetsMake(0,0,0,5);
    [self.view addSubview:pushHomePageBtn];
    
    UIButton *telSonsultationBtn = [[UIButton alloc]initWithFrame:CGRectMake(pushHomePageBtn.right+1, SCREEN_HEIGHT-104, SCREEN_WIDTH/4, 40)];
    [telSonsultationBtn setTitle:@"电话咨询" forState:(UIControlStateNormal)];
    [telSonsultationBtn setImage:[UIImage imageNamed:@"phone.png"] forState:UIControlStateNormal];
    telSonsultationBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [telSonsultationBtn addTarget:self action:@selector(telSonsultationBtn) forControlEvents:UIControlEventTouchUpInside];
    [telSonsultationBtn  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    telSonsultationBtn.backgroundColor = [UIColor whiteColor];
    telSonsultationBtn.imageEdgeInsets =  UIEdgeInsetsMake(0,0,0,5);
    [self.view addSubview:telSonsultationBtn];
    
    UIButton *OtherBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, telSonsultationBtn.y,SCREEN_WIDTH/2, telSonsultationBtn.height)];
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
    return 1;
    
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
        return cell;
    } else if (indexPath.section == 1) {
        
         if([[DLUtils getUser_type]  isEqualToString: @"4"]){
        DLLineDetialpriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineDetialpriceTableViewCell cellIdentifier]];
        cell.detaiInfoModel = self.detaiInfoModel;
        cell.delegate = self;
        [cell configureCell:self.detaiInfoModel];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
             return cell;
         }else{
             DLLineDetialpriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineDetialpriceTableViewCell cellIdentifier]];
             cell.detaiInfoModel = self.detaiInfoModel;
             cell.delegate = self;
             cell.titleChangeBtn.hidden = YES;
             cell.lineModificationBtn.hidden = YES;
             [cell configureCell:self.detaiInfoModel];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
             return cell;
         }
    } else if (indexPath.section == 2) {
        DLLineDetialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineDetialTableViewCell cellIdentifier]];
        cell.schedulingArray = self.schedulingArray;
        [cell configureCell:self.htmlString];
        return cell;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200.f;
    } else if (indexPath.section == 1) {
        CGFloat titleHeight = [self.detaiInfoModel.list.name autolableHeightWithFont:[UIFont systemFontOfSize:16] Width:(self.view.width - 30)];
        return (titleHeight > 20) ? (titleHeight + 240 + 42) : (265 + 42);
    } else if (indexPath.section == 2) {
        if ([NSString isNotBlank:self.htmlString]) {
            NSAttributedString * attributeStr = [NSString attributedStringWithHTMLString:[NSString htmlEntityDecode:self.htmlString]];
            CGFloat height =  [attributeStr boundingRectWithSize:CGSizeMake((self.view.width - 30), CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
            return height;
        } else {
            CGFloat height = 0.0;
            for (DLLineTourDetailDaysModel *schedulModel in self.schedulingArray) {
                height = height + ([schedulModel.daysDescription autolableHeightWithFont:[UIFont systemFontOfSize:11] Width:(self.view.width - 30)] + 100);
            }
            return height;
        }
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - DLCycleScrollViewDelegate
- (void)cycleScrollView:(DLCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    DLLineDetailsScrollViewController *DLLineDetScrVC = [[DLLineDetailsScrollViewController alloc]init];
    DLLineDetScrVC.routeModel = _routeModel;
    [self.navigationController pushViewController:DLLineDetScrVC animated:YES];
}

#pragma mark - DLLineDetialTableViewCellDelegate

- (void)segmentTapDelegate:(NSUInteger)index {
    NSDictionary *param = @{@"id" : self.routeModel.routeId,};
    switch (index) {
        case 0:
        {
            self.htmlString = @"";
            NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:2];
            [self.homeTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        }
            break;
        case 1:
        {
            @weakify(self);
            [DLHomeViewTask getLineDetialsEdge:param completion:^(id result, NSError *error) {
                @strongify(self);
                NSDictionary *detailsEdgeDict = [result objectForKey:@"list"];
                self.htmlString = [detailsEdgeDict objectForKey:@"description"];
                NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:2];
                [self.homeTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            }];
        }
            break;
        case 2:
        {
            @weakify(self);
            [DLHomeViewTask getLineDetialsCostExplain:param completion:^(id result, NSError *error) {
                @strongify(self);
                NSDictionary *detailsEdgeDict = [result objectForKey:@"list"];
                self.htmlString = [detailsEdgeDict objectForKey:@"fee_include"];
                NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:2];
                [self.homeTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            }];
        }
            break;
        case 3:
        {
            @weakify(self);
            [DLHomeViewTask getLineDetialsNotice:param completion:^(id result, NSError *error) {
                @strongify(self);
                NSDictionary *detailsEdgeDict = [result objectForKey:@"list"];
                self.htmlString = [detailsEdgeDict objectForKey:@"notice"];
                NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:2];
                [self.homeTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            }];
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - Fetch data

- (void)ordinaryFetchData {
    if ([[DLUtils getUser_bingdingState] isEqualToString:@"1"]) {

    //    NSDictionary *param = @{@"id" : self.routeModel.routeId,};
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"id" : self.routeModel.routeId,
                            @"sign_token" : [DLUtils getSign_token],};
    [[DLHUDManager sharedInstance] showProgressWithText:@"正在加载"];
    @weakify(self);
    [DLHomeViewTask getTouristIndexDetails:param completion:^(id result, NSError *error) {
        @strongify(self);
        [[DLHUDManager sharedInstance] hiddenHUD];
        if (result) {
            self.detaiInfoModel = [DLLineTourDetailInforModel mj_objectWithKeyValues:result];
            self.advertCarouselView.imageURLStringsGroup = self.detaiInfoModel.picArr;
            NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:1];
            [self.homeTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
    
    [DLHomeViewTask getLineDetialsScheduling:param completion:^(id result, NSError *error) {
        NSArray *schedulingArray = [DLLineTourDetailDaysModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"tour_description"]];
        [self.schedulingArray removeAllObjects];
        [self.schedulingArray addObjectsFromArray:schedulingArray];
        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:2];
        [self.homeTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        
    }];
    } else {
            NSDictionary *param = @{@"id" : self.routeModel.routeId,};
//        NSDictionary *param = @{@"uid" : [DLUtils getUid],
//                                @"id" : self.routeModel.routeId,
//                                @"sign_token" : [DLUtils getSign_token],};
        [[DLHUDManager sharedInstance] showProgressWithText:@"正在加载"];
        @weakify(self);
        [DLHomeViewTask getLineDetials:param completion:^(id result, NSError *error) {
            @strongify(self);
            [[DLHUDManager sharedInstance] hiddenHUD];
            if (result) {
                self.detaiInfoModel = [DLLineTourDetailInforModel mj_objectWithKeyValues:result];
                self.advertCarouselView.imageURLStringsGroup = self.detaiInfoModel.picArr;
                NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:1];
                [self.homeTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            } else {
                [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
            }
        }];
        
        [DLHomeViewTask getLineDetialsScheduling:param completion:^(id result, NSError *error) {
            NSArray *schedulingArray = [DLLineTourDetailDaysModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"tour_description"]];
            [self.schedulingArray removeAllObjects];
            [self.schedulingArray addObjectsFromArray:schedulingArray];
            NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:2];
            [self.homeTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            
        }];

        
    }
    
}
- (void)fetchData {
    
    //    NSDictionary *param = @{@"id" : self.routeModel.routeId,};
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"id" : self.routeModel.routeId,
                            @"sign_token" : [DLUtils getSign_token],};
    [[DLHUDManager sharedInstance] showProgressWithText:@"正在加载"];
    @weakify(self);
    [DLHomeViewTask getAgencyDetails:param completion:^(id result, NSError *error) {
        @strongify(self);
        [[DLHUDManager sharedInstance] hiddenHUD];
        if (result) {
            self.detaiInfoModel = [DLLineTourDetailInforModel mj_objectWithKeyValues:result];
            self.advertCarouselView.imageURLStringsGroup = self.detaiInfoModel.picArr;
            NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:1];
            [self.homeTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
    
    [DLHomeViewTask getLineDetialsScheduling:param completion:^(id result, NSError *error) {
        NSArray *schedulingArray = [DLLineTourDetailDaysModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"tour_description"]];
        [self.schedulingArray removeAllObjects];
        [self.schedulingArray addObjectsFromArray:schedulingArray];
        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:2];
        [self.homeTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        
    }];
    
    
}

#pragma mark - Event Handler

- (void)telSonsultationBtn {
    NSLog(@"点击了电话咨询");
    if ([NSString isBlank:self.detaiInfoModel.list.mobile]) {
    //        [[DLHUDManager sharedInstance] showTextOnly:@"你还没有绑定顾问，请去绑定顾问"];
    UIAlertView *phoneAlert = [[UIAlertView alloc]initWithTitle:@"你还没有绑定顾问，去绑定顾问?" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        phoneAlert.tag = 45;
        [phoneAlert show];
    } else {
    UIAlertView *phoneAlert = [[UIAlertView alloc]initWithTitle:@"拨打电话" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"呼叫", nil];
    phoneAlert.tag = 100;
    [phoneAlert show];
    }
}

- (void)OtherBtn {
    DLPlaceOrderViewController *placeOrderVC = [[DLPlaceOrderViewController alloc]init];
    placeOrderVC.detaiInfoModel = self.detaiInfoModel;
    placeOrderVC.routeModel = self.routeModel;
    [self.navigationController pushViewController:placeOrderVC animated:YES];
    
}

-(void)changeThePriceButtonDelegate:(UIButton *)button {
    DLLineModificationViewController *lineModificationVC = [[DLLineModificationViewController alloc]init];
    lineModificationVC.routeModel = _routeModel;
    [self.navigationController pushViewController:lineModificationVC animated:YES];
}

-(void)titleChangeButtonDelegate:(UIButton *)button {
    DLChangeTitleViewController *changTitleVC = [[DLChangeTitleViewController alloc]init];
    changTitleVC.routeModel = _routeModel;
    [self.navigationController pushViewController:changTitleVC animated:YES];
}

- (void)selectDateViewDelegate:(UITapGestureRecognizer *)tapdate
{
    //    NSLog(@"点击了选择日期");
    //    LGLCalenderViewController * ctl = [[LGLCalenderViewController alloc] init];
    //    [ctl seleDateWithBlock:^(NSMutableDictionary *paramas) {
    //        NSString * date = [NSString stringWithFormat:@"%@-%@-%@", paramas[@"year"], paramas[@"month"], paramas[@"day"]];
    //        NSString * price = paramas[@"price"];
    //    }];
    //    [self.navigationController pushViewController:ctl animated:YES];
    
    NSLog(@"点击了选择日期");
    DLCalendarViewController *calendarViewController = [[DLCalendarViewController alloc] init];
    calendarViewController.tourSkuDate = self.detaiInfoModel.tourSkuDate;
    [self.navigationController pushViewController:calendarViewController animated:YES];
    
}
- (void)pushHomePageBtn {
    UIAlertView *pushHomeAlert = [[UIAlertView alloc]initWithTitle:@"确定推到首页吗？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    pushHomeAlert.tag = 81;
    [pushHomeAlert show];
}
#pragma mark -UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 81){
        if (buttonIndex == 1) {
            
            NSDictionary *param = @{@"uid" : [DLUtils getUid],
                                    @"tour_id" : self.routeModel.routeId,
                                    @"sign_token" : [DLUtils getSign_token],};
            [DLHomeViewTask getAgencyRecommend:param completion:^(id result, NSError *error) {
                if ([[result objectForKey:@"status"] isEqualToString:@"00000"]) {
                    [[DLHUDManager sharedInstance] showTextOnly:[result objectForKey:@"msg"]];
                }else {
                    [[DLHUDManager sharedInstance]showTextOnly:[result objectForKey:@"msg"]];
                }
            }];
        }
    }
    if([[DLUtils getUser_type]  isEqualToString: @"4"]){
    if (alertView.tag == 100){
            if (buttonIndex == 1) {
               if(![[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.detaiInfoModel.list.contact_phone]]] ){
                [[DLHUDManager sharedInstance]showTextOnly:@"设备不支持"];
            }
        }
    }
    } else {
        
        if (alertView.tag == 100){
            if (buttonIndex == 1) {
                if(![[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",self.detaiInfoModel.list.mobile]]] ){
                    [[DLHUDManager sharedInstance]showTextOnly:@"设备不支持"];
                }
            }
        }
    }
    
    if (alertView.tag == 45){
        if (buttonIndex == 1) {
        DLMyAgencyUnBindingController *unBindingVC = [[DLMyAgencyUnBindingController alloc] init];
        [self.navigationController pushViewController:unBindingVC animated:YES];
        }
    }

    
}


- (void)didTapBackAction:(UIBarButtonItem *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Getter

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

#pragma mark - Getter

- (NSMutableArray *)schedulingArray {
    if (_schedulingArray == nil) {
        _schedulingArray = [[NSMutableArray alloc] init];
    }
    return _schedulingArray;
}

@end
