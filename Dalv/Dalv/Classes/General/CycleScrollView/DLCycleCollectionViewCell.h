//
//  DLCycleCollectionViewCell.h
//  Dalv
//
//  Created by Nie on 2017/5/22.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLCycleCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) UIImageView *imageView;
@property (copy, nonatomic) NSString *title;

@property (nonatomic, strong) UIColor *titleLabelTextColor;
@property (nonatomic, strong) UIFont *titleLabelTextFont;
@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;
@property (nonatomic, assign) CGFloat titleLabelHeight;
@property (nonatomic, assign) NSTextAlignment titleLabelTextAlignment;

@property (nonatomic, assign) BOOL hasConfigured;

/** 只展示文字轮播 */
@property (nonatomic, assign) BOOL onlyDisplayText;

/** Cell 重用ID */
+ (NSString *)cellIdentifier;

@end
