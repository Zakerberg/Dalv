//
//  DLMyAgencyUnBindingController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.

#import "DLMyAgencyUnBindingController.h"
#import "DLMyAgencyUnBindingModel.h"
#import "DLMyAgencyUnBindingCell.h"
#import "DLMyAgencyController.h"

@interface DLMyAgencyUnBindingController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * agencyListTableView;
@property (nonatomic, strong) NSMutableArray *agencyList;
@property (weak, nonatomic) UIImageView *AgencyImageV;
@property (weak, nonatomic) UILabel *agencyNameLabel;
@property (weak, nonatomic) UILabel *agencyIntegralLabel;
@property (weak, nonatomic) UILabel *agencyWorkTimeLabel;
@property (nonatomic,weak) NSDictionary * myListDict;
@end


@implementation DLMyAgencyUnBindingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
}

- (BOOL)dl_blueNavbar {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI{
    
    self.title = @"查找顾问";
    self.view.backgroundColor = [UIColor whiteColor];
    self.agencyListTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.agencyListTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.agencyListTableView.delegate = self;
    self.agencyListTableView.dataSource = self;
    [self.agencyListTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.agencyListTableView.showsVerticalScrollIndicator = NO;
    [self.agencyListTableView registerClass:[DLMyAgencyUnBindingCell class] forCellReuseIdentifier:[DLMyAgencyUnBindingCell cellIdentifier]];
    
    [self.view addSubview:self.agencyListTableView];
    
    [self.agencyListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}
#pragma mark ------ fetchData

- (void)fetchData {
    
    NSDictionary *param = @{
                            @"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    [DLHomeViewTask getTouristPersonalMyAgenctUnBinding:param completion:^(id result, NSError *error) {
        
        NSArray *contractRecordArray = [DLMyAgencyUnBindingModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"agencyList"]];
        [self.agencyList addObjectsFromArray:contractRecordArray];
        
        NSDictionary *dict = result;
        NSArray *arr = dict[@"agencyList"];
        
        self.dataArrM = [NSMutableArray array];
        
        for (NSDictionary *dic in arr) {
            
            [self.dataArrM addObject:dic[@"id"]];
        }
        
        [self.agencyListTableView reloadData];
        
    }];
}
#pragma mark ------  TableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.agencyList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DLMyAgencyUnBindingCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLMyAgencyUnBindingCell cellIdentifier]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLMyAgencyUnBindingModel *myModel = [self.agencyList objectAtIndex:indexPath.section];
    [cell configureCell:myModel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5.0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DLMyAgencyController *VC = [[DLMyAgencyController alloc] init];
    VC.dataArrM = self.dataArrM;
    
    NSInteger inte = indexPath.section;
    
    VC.agencyID = self.dataArrM[inte];
    
    [self.navigationController pushViewController:VC animated:YES];
}

-(NSMutableArray *)agencyList {
    
    if (_agencyList == nil) {
        
        _agencyList = [[NSMutableArray alloc] init];
    }
    return _agencyList;
}

@end
