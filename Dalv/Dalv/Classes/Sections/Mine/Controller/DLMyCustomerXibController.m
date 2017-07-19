//
//  DLMyCustomerXibController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/15.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ------------------ 我的直客 --------------------

#import "DLMyCustomerXibController.h"
#import "DLCustomerListController.h"
#import "DLMyTicketListController.h"
#import "DLHomeViewTask.h"

@interface DLMyCustomerXibController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * myCustomerTableView;
@property (weak, nonatomic) IBOutlet UIView *myCustomerView;
@property (weak, nonatomic) IBOutlet UILabel *myMoneyLabel;
@end

static NSString *cellID = @"cellID";
@implementation DLMyCustomerXibController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self fetchData];
    self.view.backgroundColor =  [UIColor groupTableViewBackgroundColor];
    self.title = @"我的直客";
}

- (BOOL)dl_blueNavbar {
    return YES;
}


#pragma mark --------setTableView ----------
-(void)setTableView{
    
    //  [self.myMoneyLabel sizeToFit];
    
    UITableView *myCustomerTableView = [[UITableView alloc] init];
    self.myCustomerTableView = myCustomerTableView;
    myCustomerTableView.tableFooterView = [UIView new];
    myCustomerTableView.delegate = self ;
    myCustomerTableView.dataSource = self ;
    
    myCustomerTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [myCustomerTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:myCustomerTableView];
    
    [myCustomerTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.myCustomerView.mas_bottom).offset(9);
        make.left.right.offset(0);
        make.height.offset(100);
    }];
}

#pragma mark --------fetchData

-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token],
                            };
    
    [DLHomeViewTask getAgencyFlightFlightProfit:param completion:^(id result, NSError *error) {
        self.myMoneyLabel.text = result[@"total"];
    }];
}

#pragma mark -------- UITable View Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"我的直客列表";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"直客机票订单";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        DLCustomerListController *listVC =[[DLCustomerListController alloc] init];
        [self.navigationController pushViewController:listVC animated:YES];
    } else {
        
        //[[DLHUDManager sharedInstance] showTextOnly:@"正在拼命开发中...."];
        DLMyTicketListController *VC = [[DLMyTicketListController alloc]init];
        
        [self.navigationController pushViewController:VC animated:YES];
    }
}


@end
