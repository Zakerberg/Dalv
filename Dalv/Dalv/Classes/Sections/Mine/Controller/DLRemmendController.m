
//
//  DLRemmendController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRemmendController.h"
#import <YYModel.h>
@interface DLRemmendController ()

@end

@implementation DLRemmendController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
    self.title = @"我的推荐";
}
- (BOOL)dl_blueNavbar {
    return YES;
}

+ (void)getAgencyFinanceMyRecommend:(NSDictionary *)param
                         completion:(void (^)(id result, NSError *error))completionHandler{
    [DLRequestSerVice POST:DL_AgencyFinanceMyRecommend param:param success:^(id responseData) {
        completionHandler ? completionHandler (responseData, nil) : nil;
        NSArray *dic = responseData;
        NSDictionary *dict = dic.firstObject;
        
        [dic yy_modelSetWithDictionary:dict];
        
    } failure:^(NSError *error) {
        completionHandler ? completionHandler (nil, error) : nil;
    }];
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
