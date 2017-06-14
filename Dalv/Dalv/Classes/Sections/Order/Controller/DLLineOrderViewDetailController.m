//
//  DLLineOrderViewDetailController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/13.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineOrderViewDetailController.h"

@interface DLLineOrderViewDetailController ()

/* 线路名称 */
@property(nonatomic,strong) UILabel *nameLabel;

/* 订单状态 */
@property(nonatomic,strong) UILabel *stateLabel;

/* 订单图片 */
@property(nonatomic,strong) UIImageView *pictureView;

@end

@interface DLLineOrderViewDetailController ()

@end

@implementation DLLineOrderViewDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ------------ setUI --------


-(void)setUI {
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLabel = nameLabel;
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor colorWithHexString:@"#ffffff"];
    [nameLabel sizeToFit];
    
    [self.view addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@16);
        make.height.equalTo(@15);
    }];
    
    
    UILabel *stateLabel = [[UILabel alloc] init];
    self.stateLabel = stateLabel;
    stateLabel.font = [UIFont systemFontOfSize:12];
    stateLabel.textColor = [UIColor colorWithHexString:@"#ff6e28"];
    [stateLabel sizeToFit];
    
    [self.view addSubview:stateLabel];
    
    [stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel.mas_centerY);
        make.right.equalTo(@16);
    }];
    
    
    UIImageView *pictureView = [[UIImageView alloc] init];
    self.pictureView = pictureView;
    
    [pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(16);
        make.left.right.equalTo(@16);
        make.width.mas_equalTo(pictureView.height).multipliedBy(1.5);
    }];
    
    

    
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
