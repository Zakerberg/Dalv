//
//  DLFianceViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFianceViewController.h"
#import "DLFianceFlowLayout.h"
#import "DLFianceOptionCell.h"
#import "DLFianceBalanceCell.h"

@interface DLFianceViewController ()<UICollectionViewDelegateFlowLayout>
// 保存所有模型数据
@property (nonatomic, strong) NSMutableArray *mineOptionsData;
@end

#define FristSectionCount  5 // 第1组的格子个数
#define SecondSectionCount  4// 第2组的格子个数
#define ThirdSectionCount   6//
#import "DLHomeViewTask.h"
@interface DLFianceViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
// 保存所有模型数据
//@property (nonatomic, strong) NSArray *mineOptionsData;
@property (nonatomic,strong) NSDictionary *dic;
@property(nonatomic,strong) DLOptionModel *model;

@end

// balacneCell重用标识
static NSString *FianceBalanceCellID = @"Fiance_Balance_Cell_ID";
// optionCell重用标识
static NSString *FianceOptionCellID = @"Fiance_Option_Cell_ID";

@implementation DLFianceViewController

- (instancetype)init {
    // 创建自定义布局
    DLFianceFlowLayout *flowLayout = [[DLFianceFlowLayout alloc] init];
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    
    self.collectionView.delegate = self;
 
    // 设置collectionView的背景
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    // 2.注册BalanceCell
    UINib *balanceCellNib = [UINib nibWithNibName:@"DLFianceBalanceCell" bundle:nil];
    [self.collectionView registerNib:balanceCellNib forCellWithReuseIdentifier:FianceBalanceCellID];
    

    // 3.注册OptionCell
    UINib *optionCellNib = [UINib nibWithNibName:@"DLFianceOptionCell" bundle:nil];
    [self.collectionView registerNib:optionCellNib forCellWithReuseIdentifier:FianceOptionCellID];
    
//    // 3.注册OptionCell
//    UINib *optionCellNib = [UINib nibWithNibName:@"DLFianceOptionCell" bundle:nil];
//    [self.collectionView registerNib:optionCellNib forCellWithReuseIdentifier:FianceOptionCellID];
//    
    
    // 5.加载数据
//    self.mineOptionsData = [self loadMineOptionsData];

}


#pragma mark - 数据源方法
// 返回有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


// 返回每一组有多少个格子
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    // 第0组返回1个
//    if (section == 0)
//    {
        return 1;
    
//    }
//        return self.mineOptionsData.count;
}

// 返回每一组的每一个格子
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    DLOptionModel *model = [DLOptionModel dLOptionModelWithDict:self.dic];
    
        
     if (indexPath.section == 1 && indexPath.item == 0) {
        // 返回balanceCell
         
        DLFianceBalanceCell *balanceCell = [collectionView dequeueReusableCellWithReuseIdentifier:FianceBalanceCellID forIndexPath:indexPath];
         if(_model){
            balanceCell.model = _model;
         }
        return balanceCell;
        
    }

    // 返回optionCell
    DLFianceOptionCell *optionCell = [collectionView dequeueReusableCellWithReuseIdentifier:FianceOptionCellID forIndexPath:indexPath];
    
    
    
    return optionCell;
}


// 设置每一个格子的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 九宫格视图的宽
    CGFloat collectionViewW = collectionView.bounds.size.width;
    // 第0组的cell
    if (indexPath.section == 0) {
        // 返回infoCell的尺寸
        
        return CGSizeMake(collectionViewW, 100);
    }
    
    // 返回optionCell的尺寸
    return CGSizeMake((collectionViewW - 1 / [UIScreen mainScreen].scale) * 0.5, 68);
}

-(void)setData{
    
    NSDictionary *dict = @{@"uid": @"1132",
                           @"sign_token":@"d7eabff2586161efbf0845b0eba46337"
                  };
    
    [DLHomeViewTask getAgencyFinance:dict completion:^(id result, NSError *error) {
//        NSLog(@"-------------%@",result);
        if(!error){
            NSDictionary *dic = result[@"agencyInfo"];
            DLOptionModel *oModel = [DLOptionModel dLOptionModelWithDict:dic];
            NSLog(@"总额, %@", oModel.account_balance);
            self.model = oModel;
            [self.collectionView reloadData];
        }
    }];
    
    [self.collectionView reloadData];
    
}




#pragma mark - 加载数据
- (NSMutableArray *)mineOptionsData {
    if (_mineOptionsData == nil) {
        _mineOptionsData = [[NSMutableArray alloc]init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"MineOption" ofType:@"plist"];
        NSArray *temArray = [NSArray arrayWithContentsOfFile:path];
        _mineOptionsData = [DLOptionModel mj_objectArrayWithKeyValuesArray:temArray];
    }
    return _mineOptionsData;
}


@end
