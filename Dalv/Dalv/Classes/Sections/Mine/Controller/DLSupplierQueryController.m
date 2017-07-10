//
//  DLSupplierQueryController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/7/10.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLSupplierQueryController.h"

@interface DLSupplierQueryController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTF;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UILabel *supplierName;
@property (weak, nonatomic) IBOutlet UILabel *supplierFullName;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@end

@implementation DLSupplierQueryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self fetchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)searchBtnClick:(id)sender {
    
}


-(void)setUI{
    
}

-(void)fetchData{
    
    NSDictionary *param = @{
                            @"uid":[DLUtils getUid],
                            @"sign_token" : [DLUtils getSign_token]
                            };
    
    [DLHomeViewTask getAgencyPersonalProviderQuery:param completion:^(id result, NSError *error) {
        
        NSLog(@"%@",result);
        
    }];
}


@end
