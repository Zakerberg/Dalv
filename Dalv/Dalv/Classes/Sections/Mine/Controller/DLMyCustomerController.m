//
//  DLMyCustomerController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLMyCustomerController.h"
#import "DLCommissionController.h"

@interface DLMyCustomerController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableview;

@end

static NSString *MyCustomerCellID = @"MyCustomer_Cell_ID";
@implementation DLMyCustomerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self setupUI];

}


-(void)setupUI{
    self.title = @"我的直客";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"v2_goback"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UITableView *tableview = [[UITableView alloc]init];
    tableview.frame = self.view.bounds;
    [self.view addSubview:tableview];
    self.tableview = tableview;
    
    tableview.delegate = self;
    tableview.dataSource = self;
    
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:MyCustomerCellID];
    
    tableview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tableview.tableFooterView = [[UIView alloc]init];

}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCustomerCellID forIndexPath:indexPath];
    
    if(indexPath.row == 0){
        cell.textLabel.text = @"我的佣金";
    }else {
        cell.textLabel.text = @"直客机票订单";
    }
    cell.textLabel.font = [UIFont systemFontOfSize:14.0];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - 监听cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0){
        
        DLCommissionController *commisonVC = [[DLCommissionController alloc] init];
        [self.navigationController pushViewController:commisonVC animated:YES];
        
    }
    if(indexPath.row ==1){
        
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (BOOL)dl_blueNavbar {
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
