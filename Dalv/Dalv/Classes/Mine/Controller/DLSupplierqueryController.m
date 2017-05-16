//
//  DLSupplierqueryController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLSupplierqueryController.h"

@interface DLSupplierqueryController ()
@property (nonatomic, strong) UITextField *searchTF;
@end

@implementation DLSupplierqueryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}



-(void)setupUI{
    
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    UITextField *searchTF = [[UITextField alloc] initWithFrame:CGRectMake(46, 101, 213, 30)];
    
    searchTF.borderStyle = UITextBorderStyleRoundedRect;
    searchTF.font = [UIFont systemFontOfSize:13.0];
    searchTF.placeholder = @"请输入供应商名称";
    self.searchTF = searchTF;
    
    [self.view addSubview:searchTF];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(264, 101, 77, 30)];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];
    
    [button setTitle:@"搜索" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
}


-(void)buttonClick{
    
    
    
    
}















@end
