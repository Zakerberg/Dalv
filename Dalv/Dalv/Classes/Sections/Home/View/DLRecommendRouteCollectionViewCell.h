//
//  DLRecommendRouteCollectionViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLRecommendRouteModel.h"

@interface DLRecommendRouteCollectionViewCell : UICollectionViewCell

/**
 *  Cell构造方法
 */
+ (DLRecommendRouteCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

/**
 *  Cell 重用ID
 */
+ (NSString *)cellIdentifier;

/**
 *  配置Cell 数据  传一个推荐线路模型 进来
 */
- (void)configureCell:(DLRecommendRouteModel *)model;


@end
