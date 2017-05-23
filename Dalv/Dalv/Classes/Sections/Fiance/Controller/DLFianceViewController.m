//
//  DLFianceViewController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFianceViewController.h"
#import "DLFianceFlowLayout.h"
#import "NSArray+Adition.h"
#import "DLFianceOptionCell.h"
#import "DLFianceBalanceCell.h"
@interface DLFianceViewController ()<UICollectionViewDelegateFlowLayout>
// 保存所有模型数据
@property (nonatomic, strong) NSArray *mineOptionsData;
@end

#define FristSectionCount  5 // 第1组的格子个数
#define SecondSectionCount  4// 第2组的格子个数
#define ThirdSectionCount   6//


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
 
    // 设置collectionView的背景
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    // 2.注册BalanceCell
    UINib *balanceCellNib = [UINib nibWithNibName:@"DLFianceBalanceCell" bundle:nil];
    [self.collectionView registerNib:balanceCellNib forCellWithReuseIdentifier:FianceBalanceCellID];
    
    // 3.注册OptionCell
    UINib *optionCellNib = [UINib nibWithNibName:@"DLFianceOptionCell" bundle:nil];
    [self.collectionView registerNib:optionCellNib forCellWithReuseIdentifier:FianceOptionCellID];
    
    
    // 5.加载数据
    self.mineOptionsData = [self loadMineOptionsData];

}


#pragma mark - 数据源方法
// 返回有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}


// 返回每一组有多少个格子
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    // 第0组返回1个
    if (section == 0) { // 第一组返回5个格子
        return FristSectionCount;
    } else if (section == 1) { // 第二组返回4个格子
        return SecondSectionCount;
    }
    
    return ThirdSectionCount; // 返回最后一组为6个格子
    
}

// 返回每一组的每一个格子
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
        
        
     if (indexPath.section == 1 && indexPath.item == 0) {
        // 返回balanceCell
        DLFianceBalanceCell *balanceCell = [collectionView dequeueReusableCellWithReuseIdentifier:FianceBalanceCellID forIndexPath:indexPath];
        return balanceCell;
        
    }

    // 返回optionCell
    DLFianceOptionCell *optionCell = [collectionView dequeueReusableCellWithReuseIdentifier:FianceOptionCellID forIndexPath:indexPath];
    
      if (indexPath.section == 2) { // 如果是第2组item从0开始 + 前面已经用过的数据 + 4
        optionCell.option = self.mineOptionsData[indexPath.item];
        
    } else if (indexPath.section == 3) { // 如果是第3组item0 + 前面用过的8个,从第8个下标去取数据
        optionCell.option = self.mineOptionsData[indexPath.item];
    }
    
    
    
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
        
        
        
    } else if (indexPath.section == 1 && indexPath.item == 0) {
        // 返回balanceCell的尺寸
        
        return CGSizeMake(collectionViewW, 68);
        
    }
    
    
    // 返回optionCell的尺寸
    return CGSizeMake((collectionViewW - 1 / [UIScreen mainScreen].scale) * 0.5, 68);
    
}





#pragma mark - 加载数据
- (NSArray *)loadMineOptionsData {
    return [NSArray objectListWithPlistName:@"MineOption.plist" clsName:@"DLOptionModel"];
}


@end
