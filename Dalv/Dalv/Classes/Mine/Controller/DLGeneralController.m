//
//  DLGeneralController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//


#import "DLGeneralController.h"
#import "DLMineModel.h"
#import "DLMineCell.h"

static NSString *cellID  = @"cellID";

@interface DLGeneralController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray * mineArrayData;

@property (nonatomic,strong) UITableView *tableview;
@end


@implementation DLGeneralController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.mineArrayData = [self loadingPlist];  //赋值加载数据
    
    [self.tableView registerClass:[DLMineCell class] forCellReuseIdentifier:cellID];
    
    self.tableView.tableFooterView = [UIView new];

  
}

//通过传进来的Plist文件。加载内容
- (NSArray *)loadingPlist

{
    
    NSArray * array  = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"MineGeneral.plist" withExtension:nil]];
    NSMutableArray * arrM = [[NSMutableArray alloc]init];
    for (NSArray* arr in array) {
        
        NSMutableArray * groupArr = [[NSMutableArray alloc]init];
        
        for (NSDictionary* dict in arr) {
            
            DLMineModel * model = [DLMineModel MineModelWithDict:dict];
            
            [groupArr addObject:model];
        }
        
        [arrM addObject:groupArr];
    }
    
    return arrM.copy;
}

- (void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - Tableview data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.mineArrayData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.mineArrayData[section] count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //拿到每一组每一行的模型
    DLMineModel * mineModel = self.mineArrayData[indexPath.section][indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:mineModel.pic];
    cell.textLabel.text = mineModel.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}


@end
