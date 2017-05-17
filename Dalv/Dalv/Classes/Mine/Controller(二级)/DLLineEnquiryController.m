//
//  DLLineEnquiryController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineEnquiryController.h"
#import "DLCityPickerView.h"

@interface DLLineEnquiryController ()<UITableViewDelegate,UITableViewDataSource,DLCityPickerViewDelegate>{
        UIButton *SelectCityButton;
    
}

@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) UILabel *cityLabel;

@end
static NSString *lineEnquiryCellID = @"lineEnquiry_Cell_ID";
@implementation DLLineEnquiryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    [self setupUI];
}


-(void)setupUI{
    self.title = @"线路询价";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"v2_goback"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UITableView *tableview = [[UITableView alloc]init];
    tableview.frame = self.view.bounds;
    [self.view addSubview:tableview];
    self.tableview = tableview;
    
    tableview.delegate = self;
    tableview.dataSource = self;
    
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:lineEnquiryCellID];
    
    tableview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    tableview.tableFooterView = [[UIView alloc]init];
    
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    /********   出发地   *******/
    if (indexPath.row == 0) {
        
        NSMutableArray *arrayData = [NSMutableArray arrayWithObjects:@"北京市",@"唐山市",@"天津市",@"石家庄市", nil];
        
        DLCityPickerView *pickerSingle = [[DLCityPickerView alloc]init];
        
        [pickerSingle setDataArray:arrayData];
        [pickerSingle setDefalutSelectRowStr:arrayData[0]];
        [pickerSingle setDelegate:self];
        
        [pickerSingle show];
        [self.view endEditing:YES];

        
    }
    
    
    /*****   目的地    ****/
    if (indexPath.row == 1) {
        
    }
    
    /****   旅游人数    *****/
    if (indexPath.row == 2) {
        
    }
    /****  出发时间   *****/
    if (indexPath.row == 3) {
        
    }
    
    /*****   备注   *****/
    if (indexPath.row == 4) {
        
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}


- (void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:lineEnquiryCellID forIndexPath:indexPath];
    
//    SelectCityButton=[UIButton buttonWithType:UIButtonTypeCustom];
//    
//    [SelectCityButton setTitle:@"XXXXXX" forState:UIControlStateNormal];
//    
//    [SelectCityButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [SelectCityButton addTarget:self action:@selector(pickViewSelect:) forControlEvents:UIControlEventTouchUpInside];
//    
//
//    [cell.contentView addSubview:SelectCityButton];
//    
    if (indexPath.row == 0) {

      cell.textLabel.text = @"出发城市";
    }
    
    if (indexPath.row == 1) {
        cell.textLabel.text = @"目的地";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"旅游人数";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"出发时间";
    }
    if (indexPath.row == 4) {
        cell.textLabel.text = @"备注";
    }

    
    cell.textLabel.font = [UIFont systemFontOfSize:14.0];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}


-(void)pickViewSelect:(UIButton *)button{
    
    NSMutableArray *arrayData = [NSMutableArray arrayWithObjects:@"北京市",@"唐山市",@"天津市",@"石家庄市", nil];
    
    DLCityPickerView *pickerSingle = [[DLCityPickerView alloc]init];
    
    [pickerSingle setDataArray:arrayData];
    [pickerSingle setDefalutSelectRowStr:arrayData[0]];
    [pickerSingle setDelegate:self];
    
    [pickerSingle show];
    [self.view endEditing:YES];
    

    
    
}

-(void)customPickView:(DLCityPickerView *)customPickView selectedTitle:(NSString *)selectedTitle{
    NSLog(@"选择%@",selectedTitle);
    [SelectCityButton setTitle:selectedTitle forState:UIControlStateNormal];
}



@end
