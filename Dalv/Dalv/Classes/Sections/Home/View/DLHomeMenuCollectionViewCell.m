//
//  DLHomeMenuCollectionViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHomeMenuCollectionViewCell.h"

@interface DLHomeMenuCollectionViewCell ()

@property (nonatomic, weak) UIImageView *libImageView;
@property (nonatomic, weak) UILabel *libNameLabel;
@property (nonatomic, weak) UIView *bottomSeparator;
@property (nonatomic, weak) UIView *rightSeparator;

@end

@implementation DLHomeMenuCollectionViewCell

#pragma mark - Class Methods

+ (DLHomeMenuCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView IndexPath:(NSIndexPath *)indexPath {
    NSString *ID = [self cellIdentifier];
    DLHomeMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[DLHomeMenuCollectionViewCell alloc] initWithFrame:CGRectZero];
    }
    return cell;
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

#pragma mark - setup Subviews

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *libImageView = [[UIImageView alloc] init];
    self.libImageView = libImageView;
    
    UILabel *libNameLabel = [[UILabel alloc] init];
    libNameLabel.textColor = [UIColor ms_blackColor];
    libNameLabel.font = [UIFont systemFontOfSize:12];
    libNameLabel.textAlignment = NSTextAlignmentCenter;
    self.libNameLabel = libNameLabel;
    
    UIView *bottomSeparator = [[UIView alloc] init];
    bottomSeparator.backgroundColor = [UIColor ms_separatorColor];
    self.bottomSeparator = bottomSeparator;
    
    UIView *rightSeparator = [[UIView alloc] init];
    rightSeparator.backgroundColor = [UIColor ms_separatorColor];
    self.rightSeparator = rightSeparator;
    
    [self.contentView addSubview:libImageView];
    [self.contentView addSubview:libNameLabel];
    [self.contentView addSubview:bottomSeparator];
    [self.contentView addSubview:rightSeparator];
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.libImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.contentView.mas_centerY).with.offset(5);
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.size.mas_lessThanOrEqualTo(CGSizeMake(45, 45));
    }];
    
    [self.libNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.libImageView.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.libImageView);
    }];
    
    [self.bottomSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.and.right.equalTo(self.contentView);
        make.height.equalTo(@0.5f);
    }];
    
    [self.rightSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-0.5);
        make.bottom.equalTo(self.contentView);
        make.width.equalTo(@0.5f);
    }];
}

#pragma mark - configure

- (void)configureCell:(DLHomeMenuItem *)data {
   
    [self.libImageView sd_setImageWithURL:[NSURL URLWithString:data.pic_icon] placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
     self.libNameLabel.text = data.name;
}

- (void)configureFinanceCell:(DLFinanceMenuItem *)data {
    self.libImageView.image = data.image;
    self.libNameLabel.text = data.name;

}
#pragma mark - Setter

- (void)setShowsSeparator:(BOOL)showsSeparator {
    _showsSeparator = showsSeparator;
    self.bottomSeparator.hidden = !_showsSeparator;
    self.rightSeparator.hidden = !_showsSeparator;
}

@end
