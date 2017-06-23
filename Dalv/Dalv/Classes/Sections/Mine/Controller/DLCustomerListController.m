//
//  DLCustomerListController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/8.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------ 我的直客列表 --------------------

#import "DLCustomerListController.h"
#import "DLCustomerListModel.h"
#import "DLCustomerListCell.h"
#import "DLHomeViewTask.h"

@interface DLCustomerListController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView * customerListTableView;

@property (nonatomic, strong) NSMutableArray *myCustomerList;
/* 直客头像 */
@property (weak, nonatomic)  UIImageView *customerAvatarImageV;
/* 直客名称 */
@property (weak, nonatomic)  UILabel *customerNameLabel;
/* 直客电话 */
@property (weak, nonatomic)  UILabel *customerNumLabel;
/* 直客时间 */
@property (weak, nonatomic)  UILabel *customerTimeLabel;

@property(nonatomic,weak) NSDictionary * myListDict;


@end

static NSString *cellID = @"cellID";


@implementation DLCustomerListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
    self.view.backgroundColor =  [UIColor groupTableViewBackgroundColor];
    self.title = @"直客列表";
    [self setTableView];
    
}
- (BOOL)dl_blueNavbar {
    return YES;
}


-(void)setTableView {
    
    [self.customerTimeLabel sizeToFit];
    self.customerListTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.customerListTableView.dataSource = self;
    self.customerListTableView.backgroundColor = [UIColor ms_backgroundColor];
    
    self.customerListTableView.delegate = self;
    
    
    [self.customerListTableView registerNib:[UINib nibWithNibName:@"DLCustomerListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:self.customerListTableView];
    
    [self.customerListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];

}

#pragma mark ------------  fetchData --------------

- (void)fetchData {
    
    NSDictionary *param = @{
                            @"uid" : [DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    [DLHomeViewTask getAgencyMyCustomerList:param completion:^(id result, NSError *error) {
        
        @weakify(self);
        if (result) {
         @strongify(self);
            NSArray *customerListArray = [DLCustomerListModel mj_objectArrayWithKeyValuesArray:[result objectForKey:@"list"]];
            [self.myCustomerList addObjectsFromArray:customerListArray];
            [self.customerListTableView reloadData];
      
        }else {
        
            [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
        }
    }];
}

#pragma mark ------------  Table view Delegate --------------

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.myCustomerList.count;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DLCustomerListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DLCustomerListModel *clModel = [self.myCustomerList objectAtIndex:indexPath.section];
    [cell configureCell:clModel];
    
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

-(NSMutableArray *)myCustomerList {
    
    if (_myCustomerList == nil) {
        
        _myCustomerList = [[NSMutableArray alloc] init];
    }
    return _myCustomerList;
}

@end
