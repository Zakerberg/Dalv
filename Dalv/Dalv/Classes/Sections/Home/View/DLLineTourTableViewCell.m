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
    NSMutableString *placeholder = [NSMutableString stringWithString:@"搜索出发城市和目的地"];
    
    _searchBar.placeholder = placeholder.copy;
    _searchBar.backgroundImage = [[UIImage alloc] init];
    _searchBar.barTintColor = [UIColor ms_blackColor];
    _searchBar.tintColor = [UIColor ms_orangeColor];
    _searchBar.showsCancelButton = NO;
    
    _serchTextField = [_searchBar valueForKey:@"_serchTextField"];
    _serchTextField.layer.cornerRadius = 14.0f;
    _serchTextField.layer.masksToBounds = YES;
    _serchTextField.layer.borderColor = [UIColor colorWithHexString:@"#e8e8e8"].CGColor;
    _serchTextField.layer.borderWidth = 0.5f;
    _serchTextField.textColor = [UIColor ms_blackColor];

    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(self.contentView);
        make.height.lessThanOrEqualTo(@100);
    }];
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage.mas_bottom).offset(5);
        make.left.equalTo(@20);
        make.width.equalTo(self.contentView).offset(-20);
        make.height.equalTo(@40);
    }];

}

- (void)layoutCellSubviews {
    
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

@end
