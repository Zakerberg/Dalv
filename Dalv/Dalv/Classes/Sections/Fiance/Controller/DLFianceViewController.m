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
static NSString *ID = @"businessType";
static NSString *funcListCell = @"Func_List_cell";
static NSString *DlBalanceCell = @"balance_cell";
@interface DLFianceViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *mineOptionData;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation DLFianceViewController

#pragma mark - Life cycle
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)viewDidLoad {
    [self setupUI];
    [self fetchData];
}

#pragma mark - Setup navbar
-(void)setupUI{
//    DLFianceFlowLayout *flowLayout = [[DLFianceFlowLayout alloc]init];
//    
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 266) collectionViewLayout:flowLayout];
//    [self addSubview:collectionView];
//    collectionView.dataSource = self;
//    collectionView.delegate = self;
//    [collectionView registerClass:[businessTypeCell class] forCellWithReuseIdentifier:ID];
//    collectionView.backgroundColor = [UIColor whiteColor];
//    
//    self.collectionView = collectionView;

    
}


































#pragma mark - Setup subViews
//- (void)setupSubviews {
//    self.view.backgroundColor = [UIColor ms_backgroundColor];
//    
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"这是财务界面";
//    label.textColor = [UIColor ms_blackColor];
//    label.font = [UIFont systemFontOfSize:25];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.backgroundColor = [UIColor randomColor];
//    
//    [self.view addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.left.and.right.equalTo(self.view);
//        make.height.equalTo(@100);
//    }];
//}




















#pragma mark - Layout
- (void)updateViewConstraints {
    
    
}

#pragma mark - Fetch data

- (void)fetchData {
    
}

#pragma mark - Event Handler

#pragma mark - Getter


@end
