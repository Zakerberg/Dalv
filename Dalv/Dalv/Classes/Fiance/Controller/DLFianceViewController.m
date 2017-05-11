//
//  DLFianceViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFianceViewController.h"

@interface DLFianceViewController ()

@end

@implementation DLFianceViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    [self setupSubviews];
    [self fetchData];
}

#pragma mark - Setup navbar

- (void)setupNavbar {
    self.title = @"财务";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"这是财务界面";
    label.textColor = [UIColor ms_blackColor];
    label.font = [UIFont systemFontOfSize:25];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor randomColor];
    
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.and.right.equalTo(self.view);
        make.height.equalTo(@100);
    }];
}

#pragma mark - Layout

- (void)updateViewConstraints {
    
    [super updateViewConstraints];
}

#pragma mark - Fetch data

- (void)fetchData {
    
}

#pragma mark - Event Handler

#pragma mark - Getter


@end
