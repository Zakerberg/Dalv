//
//  DLHomeMenuCollectionViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLHomePageMenuModel.h"
#import "DLFinanceMenuItem.h"
@interface DLHomeMenuCollectionViewCell : UICollectionViewCell

/** 是否显示分隔线，默认为NO */
@property (nonatomic, assign, getter=isShowsSeparator) BOOL showsSeparator;

/** 类方法，快捷创建一个Cell */
+ (DLHomeMenuCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView IndexPath:(NSIndexPath *)indexPath;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

/** 配置Cell 数据 */
- (void)configureCell:(DLHomeMenuItem *)data;

/** 配置Cell 数据 */
- (void)configureFinanceCell:(DLFinanceMenuItem *)data;

@property (nonatomic, strong) DLHomeMenuItem *homeMenuItem;
@end
