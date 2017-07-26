//
//  DLRemmendController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/4.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------  我的推荐 ----------------------

#import "DLRemmendController.h"
#import "DLMyRemmendModel.h"
#import "DLMyRemmendCell.h"

@interface DLRemmendController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myRemmendTableView;
@property (nonatomic, strong) NSMutableArray *myRemmendList;
@property (nonatomic, assign) NSInteger pageIndex;
@property(nonatomic,strong) UIButton * deleBtn;
@property(nonatomic,strong) NSString * remmendId;
@end

static NSString *nibCellID = @"cellID";

@implementation DLRemmendController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setTableView];
    [self fetchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)dl_blueNavbar {
    return YES;
}

-(void)setUI{
 
    self.title = @"我的推荐";
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    [self.myRemmendTableView ms_beginRefreshing:self
                                   headerAction:@selector(fetchNewData)
                                   footerAction:@selector(fetchMoreData)];
}

/**
 * 更新视图.
 */
- (void) updateView
{
    [self.myRemmendTableView reloadData];
}

-(void)setTableView{
    
    self.myRemmendTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.myRemmendTableView.dataSource = self;
    self.myRemmendTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.myRemmendTableView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.myRemmendTableView.showsVerticalScrollIndicator = NO;
    [self.myRemmendTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.myRemmendTableView registerNib:[UINib nibWithNibName:@"DLMyRemmendCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibCellID];
    [self.view addSubview:self.myRemmendTableView];
    
    [self.myRemmendTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
}

#pragma mark ----- fetchData

- (void)fetchNewData {
    self.myRemmendList = [NSMutableArray array];
    self.pageIndex=1;
    [self fetchData];
}

- (void)fetchMoreData {
    self.pageIndex++;
    [self fetchData];
}

-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"page": @(self.pageIndex),
                            @"sign_token" : [DLUtils getSign_token],
                            };
    @weakify(self);
    [DLHomeViewTask getAgencyFinanceMyRecommend:param completion:^(id result, NSError *error) {
        @strongify(self);
        if (result) {
            
            NSDictionary *dict = result[@"list"];
            self.remmendId = dict[@"id"];
            
            NSArray *myRemmendArray = [DLMyRemmendModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            
            [self.myRemmendList addObjectsFromArray:myRemmendArray];
            [self.myRemmendTableView ms_endRefreshing:myRemmendArray.count pageSize:10 error:error];
            [self.myRemmendTableView reloadData];
            [self updateView];
        }
    }];
}

-(void)deleBtnClick

{
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"id":self.remmendId,
                            @"sign_token" : [DLUtils getSign_token],
                            };

    [DLHomeViewTask getAgencyFinanceMyRecommendDel:param completion:^(id result, NSError *error) {
        [self updateView];
        
    }];

}


#pragma mark ------ UITable View Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.myRemmendList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLMyRemmendCell *cell = [tableView dequeueReusableCellWithIdentifier:nibCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.deleBtn = cell.deleBtn;
    [cell.deleBtn addTarget:self action:@selector(deleBtnClick) forControlEvents:UIControlEventTouchUpInside];

    DLMyRemmendModel *loModel = [self.myRemmendList objectAtIndex:indexPath.section];
    [cell configureCell:loModel];

    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 136;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
