//
//  DLLineModificationViewController.m
//  Dalv
//
//  Created by Nie on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineModificationViewController.h"
#import "DLLineModificationViewDetailTableViewCell.h"
#import "DLRoutePricingTableViewCell.h"
#import "DLHomeViewTask.h"
@interface DLLineModificationViewController ()<UITableViewDelegate,UITableViewDataSource,LineModificationDelegate>
@property (nonatomic, strong) UITableView *lineModificationTableView;//
@property (nonatomic, strong) DLLineModificationModel *modificationModel;//顾问线路改价模型
@property (nonatomic, strong) NSArray *modificationarry;

@end

@implementation DLLineModificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    [self fetchData];

    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Setup navbar

- (BOOL)dl_blueNavbar {
    return YES;
    
}

- (void)setupNavbar {
    self.title = @"路线改价";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    self.lineModificationTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.lineModificationTableView.dataSource = self;
    self.lineModificationTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.lineModificationTableView.delegate = self;
    [self.lineModificationTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.lineModificationTableView.showsVerticalScrollIndicator = NO;
    [self.lineModificationTableView registerClass:[DLLineModificationViewDetailTableViewCell class] forCellReuseIdentifier:[DLLineModificationViewDetailTableViewCell cellIdentifier]];
    [self.lineModificationTableView registerClass:[DLRoutePricingTableViewCell class] forCellReuseIdentifier:[DLRoutePricingTableViewCell cellIdentifier]];
    [self.view addSubview:self.lineModificationTableView];
    
    [self.lineModificationTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.lineModificationTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Fetch data

- (void)fetchData {
    
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"id" : self.routeModel.routeId,
                            @"sign_token" : [DLUtils getSign_token],};
    [[DLHUDManager sharedInstance] showProgressWithText:@"正在加载"];
    @weakify(self);
    [DLHomeViewTask getAgencyChangePrice:param completion:^(id result, NSError *error) {
        @strongify(self);
        [[DLHUDManager sharedInstance] hiddenHUD];
        if (result) {
            self.modificationModel = [DLLineModificationModel mj_objectWithKeyValues:result];
            self.modificationarry = self.modificationModel.list;
            if (self.modificationModel.list.count == 0) {
                [[DLHUDManager sharedInstance] showTextOnly:@"没有线路团期"];
                return;
            }
            [self.lineModificationTableView reloadData];
        } else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 1;
    }else{
        return self.modificationarry.count;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
    DLLineModificationViewDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineModificationViewDetailTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.modificationModel = self.modificationModel;
    [cell configureCell:self.modificationModel];
    return cell;
    } else {
    DLRoutePricingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLRoutePricingTableViewCell cellIdentifier]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    LineModificationList * modificationList = [self.modificationarry objectAtIndex:indexPath.row];
    cell.modificationModel = modificationList;
    [cell configureCell:modificationList];
    return cell;

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        CGFloat titleHeight = [self.modificationModel.tour_list.name autolableHeightWithFont:[UIFont systemFontOfSize:16] Width:(self.view.width - 30)];
        return titleHeight + 250;

    } else {
        return 230;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - Event Handler

- (void)preservationBtnClickDelegateWithAdultprice:(NSString*)adultprice Childpriced:(NSString*)childprice Roomdifference:(NSString*)roomdifference modificationModel:(LineModificationList *)modificationModel{
    NSDictionary *param = @{@"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            @"tour_id" : self.routeModel.routeId,
                            @"sku_id" : modificationModel.tourDateId,
                            @"adult" : adultprice,
                            @"child" : childprice,
                            @"hotel" : roomdifference,
                            };
    [[DLHUDManager sharedInstance] showProgressWithText:@"正在加载"];
    [DLHomeViewTask getAgencyChangePriceHandle:param completion:^(id result, NSError *error) {
        [[DLHUDManager sharedInstance] hiddenHUD];
        if ([[result objectForKey:@"status"] isEqualToString:@"00000"]) {
            [[DLHUDManager sharedInstance] showTextOnly:[result objectForKey:@"msg"]];
            [self.navigationController popViewControllerAnimated:YES];
        }else {
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];

    
}

@end
