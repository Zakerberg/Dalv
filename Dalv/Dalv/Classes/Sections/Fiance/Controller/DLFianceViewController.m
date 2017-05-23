//
//  DLFianceViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/9.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFianceViewController.h"
#import "DLFianceFlowLayout.h"
#import "UIColor+MSExtension.h"

static NSString *FianceBalanceCell = @"Fiance_balance_cell";
@interface DLFianceViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *mineOptionData;

@end

@implementation DLFianceViewController

#pragma mark - Life cycle
- (instancetype)init {
    DLFianceFlowLayout *flowLayout = [[DLFianceFlowLayout alloc] init];
    return [super initWithCollectionViewLayout:flowLayout];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavbar];
    
    [self fetchData];
}

#pragma mark - Setup navbar
- (void)setupNavbar {
    self.navigationItem.title = @"财务";
    self.collectionView.backgroundColor = [UIColor colorWithHexString:@"0xf5f5f9"];
    
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    
    
    
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    
    
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
    }
    return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {


    if (indexPath.section == 0 && indexPath.item == 0) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:FianceBalanceCell forIndexPath:indexPath];
    }







}






- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {






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
