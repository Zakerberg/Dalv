//
//  DLMyAgencyUnBindingController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------- 顾问列表页(未绑定) ---------------

#import "DLMyAgencyUnBindingController.h"
#import "DLMyAgencyUnBindingModel.h"
#import "DLMyAgencyUnBindingCell.h"
#import "DLHomeViewTask.h"

@interface DLMyAgencyUnBindingController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView * agencyListTableView;

@property (nonatomic, strong) NSMutableArray *agencyList;
/* 顾问头像 */
@property (weak, nonatomic)  UIImageView *AgencyImageV;
/* 顾问名字 */
@property (weak, nonatomic)  UILabel *agencyNameLabel;
/* 顾问积分 */
@property (weak, nonatomic)  UILabel *agencyIntegralLabel;
/* 顾问从业时间 */
@property (weak, nonatomic)  UILabel *agencyWorkTimeLabel;

@property(nonatomic,weak) NSDictionary * myListDict;

@end
static NSString *CellID = @"CellID";
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
  
    self.title = @"我的顾问";
    self.view.backgroundColor = [UIColor whiteColor];

    self.agencyListTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.agencyListTableView.backgroundColor = [UIColor ms_backgroundColor];
    
    self.agencyListTableView.delegate = self;
    self.agencyListTableView.dataSource = self;
    
    
    [self.agencyListTableView registerClass:[DLMyAgencyUnBindingCell class] forCellReuseIdentifier:CellID];
    
    [self.view addSubview:self.agencyListTableView];
    
    [self.agencyListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];

    
    
    
}
#pragma mark ------------  fetchData --------------

//getTouristPersonalMyAgenctUnBinding
- (void)fetchData {
    
    NSDictionary *param = @{
                            @"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    [DLHomeViewTask getAgencyMyCustomerList:param completion:^(id result, NSError *error) {
        
        @weakify(self);
        if (result) {
            @strongify(self);
            NSArray *customerListArray = [DLMyAgencyUnBindingModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"agencyList"]];
            [self.agencyList addObjectsFromArray:customerListArray];
            [self.agencyListTableView reloadData];
            
        }else {
            
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
}
#pragma mark ------------  Table view Delegate --------------

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.agencyList.count;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DLMyAgencyUnBindingCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLMyAgencyUnBindingModel *myModel = [self.agencyList objectAtIndex:indexPath.section];
//    [cell configureCell:myModel];
    
    return cell;
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 89;
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

#pragma mark ------------------ Getter -----------------------

-(NSMutableArray *)agencyList {
    
    if (_agencyList == nil) {
        
        _agencyList = [[NSMutableArray alloc] init];
    }
    return _agencyList;
}

@end
