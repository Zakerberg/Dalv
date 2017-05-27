//
//  DLLineDetialCollectionViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLineTourDetailInforModel.h"

@interface DLLineDetialCollectionViewCell : UICollectionViewCell

/**
 *  Cell构造方法
 */
+ (DLLineDetialCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

/**
 *  Cell 重用ID
 */
+ (NSString *)cellIdentifier;

/**
 *  配置Cell 数据
 */
- (void)configureCell:(DLLineTourDetailInforModel *)model indexPath:(NSIndexPath *)indexPath;


@end
