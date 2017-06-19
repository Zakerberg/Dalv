//
//  DLLineTourTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/6/14.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineTourTableViewCell.h"

@implementation DLLineTourTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    self.headImage = [[UIImageView alloc]init];
    self.headImage.image = [UIImage imageNamed:@"mine_theme"];
    [self.contentView addSubview:self.headImage];

    
    _searchBar = [[UISearchBar alloc] init];
    [self.contentView addSubview:_searchBar];
    _searchBar.placeholder = @"支持模糊搜索：路线,景点,代码";
    self.searchBar.tintColor = [UIColor ms_orangeColor];
    self.searchBar.backgroundColor = [UIColor whiteColor];
    [self.searchBar setBackgroundImage: [UIImage imageWithColor:[UIColor whiteColor] ] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    for (UIView *view in self.searchBar.subviews.firstObject.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            view.backgroundColor = [UIColor ms_backgroundColor];
        }
    }
    _searchBar.showsCancelButton = NO;

    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@100);
    }];
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage.mas_bottom).offset(10);
        make.left.equalTo(@20);
        make.width.equalTo(self.contentView).offset(-40);
        make.height.equalTo(@40);
    }];
    

}

- (void)layoutCellSubviews {
    
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

@end
