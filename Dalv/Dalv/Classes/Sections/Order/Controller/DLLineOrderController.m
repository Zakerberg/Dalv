//
//  DLLineOrderController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/6.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderController.h"
#import "DLHomeViewTask.h"

@interface DLLineOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *lineOrderTableView;
@property (nonatomic, strong) NSMutableArray * lineOrderList;
@end

@implementation DLLineOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
    [self setTableView];
    
    
}





- (void)setupSubviews {




}


#pragma mark  --------  setUI  ------------

-(void)setUI{
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    

}

#pragma mark  ------  fetchData  ------------

-(void)fetchData{
    
    NSDictionary * param = @{
                             
                             
                             
                             
                             
                             
                             
                             };
    
    
    
    
    
    @weakify(self);
    [DLHomeViewTask getAgencyLineOrder: param completion:^(id result, NSError *error) {
        @strongify(self);
        
    }];
    
    
    
    
    
    

    
    
    
}

#pragma mark ----------------- Set TableView -----------------

-(void)setTableView {
    
    self.lineOrderTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.lineOrderTableView.dataSource = self;
    self.lineOrderTableView.backgroundColor = [UIColor ms_backgroundColor];
    self.lineOrderTableView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.lineOrderTableView.showsVerticalScrollIndicator = NO;



}

#pragma mark  ----------UITable View Delegate------------

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 2;
    
}










#pragma mark ------------------ Getter -----------------------


-(NSMutableArray *)lineOrderList {
    
    if (_lineOrderList == nil) {
        
        _lineOrderList = [[NSMutableArray alloc] init];
    }
    
    return _lineOrderList;
    
}








































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
