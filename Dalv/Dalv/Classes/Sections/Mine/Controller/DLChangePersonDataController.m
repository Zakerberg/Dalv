//
//  DLChangePersonDataController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLChangePersonDataController.h"

@interface DLChangePersonDataController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tableView;
    NSArray *minArrayData;
}
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong)NSArray * mineArrayData;
@end

@implementation DLChangePersonDataController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}


-(void)setupUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:self.tableView];
        
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
