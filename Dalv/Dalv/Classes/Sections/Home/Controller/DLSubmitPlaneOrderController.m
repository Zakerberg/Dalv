//
//  DLSubmitPlaneOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//  ---------------- 提交机票订单界面 ------------------

#import "DLSubmitPlaneOrderController.h"

@interface DLSubmitPlaneOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *submitPlaneTableView;
@end



static NSString * submitPlaneSection0Cell = @"submitPlaneSection0Cell";

@implementation DLSubmitPlaneOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -------- setTableView

-(void)setTableView{
    
    self.submitPlaneTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.submitPlaneTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.submitPlaneTableView.dataSource = self;
    self.submitPlaneTableView.delegate = self;

    [self.submitPlaneTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:self.submitPlaneTableView];
   
    
    
    
    
    
    
    
    
    
    
    
    [self.submitPlaneTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom).offset(-48);
    }];

    
    
}





#pragma mark ------ UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }else if (section == 3){
        return 4;
    }
    
    
    
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return nil;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    
    return 1;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}










@end
