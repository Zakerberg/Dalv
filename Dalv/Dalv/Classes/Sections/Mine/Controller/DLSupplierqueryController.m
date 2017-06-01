//
//  DLSupplierqueryController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/1.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//DL_providerQuery

#import "DLSupplierqueryController.h"

@interface DLSupplierqueryController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTF;
@property (weak, nonatomic) IBOutlet UIButton *SearchBtn;
/***  供应商详情  ***/
@property (weak, nonatomic) IBOutlet UIImageView *detailImageV;
@property (weak, nonatomic) IBOutlet UILabel *supplierNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
@property (weak, nonatomic) IBOutlet UILabel *SaleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactNumLabel;

@end

@implementation DLSupplierqueryController


- (BOOL)dl_blueNavbar {
    return YES;
}

/***  搜索按钮   ***/
- (IBAction)SearchBtnClick:(id)sender {
    self.detailImageV.hidden = NO;
    
    
    
    
    
    
    
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"F1F1F1"];
    self.title = @"供应商查询";
    self.detailImageV.hidden = YES;
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
