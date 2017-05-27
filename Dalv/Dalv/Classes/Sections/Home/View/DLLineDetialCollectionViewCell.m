//
//  DLLineDetialCollectionViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/26.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineDetialCollectionViewCell.h"
@interface DLLineDetialCollectionViewCell ()

@property (nonatomic, weak) UIButton *funcButton;
@property (nonatomic, weak) UIView *verticalSeparator;
@property (nonatomic, weak) UIView *horizontalSeparator;
@property (nonatomic, weak) UILabel *valueLab;//具体值

@end

@implementation DLLineDetialCollectionViewCell

#pragma mark - Class Methods

+ (DLLineDetialCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView
                                    indexPath:(NSIndexPath *)indexPath {
    NSString *ID = [self cellIdentifier];
    DLLineDetialCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID
                                                                        forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[DLLineDetialCollectionViewCell alloc] initWithFrame:CGRectZero];
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
        [self setupConstraints];
    }
    return self;
}

#pragma mark - Setup Subviews

- (void)setupSubviews {
    UIButton *funcButton = [[UIButton alloc] init];
    funcButton.userInteractionEnabled = NO;
    funcButton.titleLabel.font = [UIFont systemFontOfSize:11];
    [funcButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    funcButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    self.funcButton = funcButton;
    
    UIView *verticalSeparator = [[UIView alloc] init];
    verticalSeparator.backgroundColor = [UIColor ms_separatorColor];
    self.verticalSeparator = verticalSeparator;
    
    UIView *horizontalSeparator = [[UIView alloc] init];
    horizontalSeparator.backgroundColor = [UIColor ms_separatorColor];
    self.horizontalSeparator = horizontalSeparator;
    
    UILabel *valueLab = [[UILabel alloc]init];
    valueLab.font = [UIFont systemFontOfSize:12];
    valueLab.textColor = [UIColor blackColor];
    self.valueLab = valueLab;
    
    [self.contentView addSubview:funcButton];
    [self.contentView addSubview:valueLab];
    [self.contentView addSubview:verticalSeparator];
    [self.contentView addSubview:horizontalSeparator];
    
    
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.funcButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.width.equalTo(@80);
    }];
    
    [self.valueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.funcButton.mas_right).offset(5);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.verticalSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView);
        make.width.equalTo(@(0.5f));
        make.height.equalTo(self.contentView);
    }];
    
    [self.horizontalSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@(0.5f));
    }];
}

#pragma mark - Configure

- (void)configureCell:(DLLineTourDetailInforModel *)model indexPath:(NSIndexPath *)indexPath {
    self.verticalSeparator.hidden = YES;
    self.horizontalSeparator.hidden = YES;

    switch (indexPath.item) {
        case 0:
            [self.funcButton setImage:[UIImage imageNamed:@"departure_city"] forState:UIControlStateNormal];
            [self.funcButton setTitle:@"出发城市:" forState:UIControlStateNormal];
            self.valueLab.text = model.list.departure;
            break;
        case 1:
            [self.funcButton setImage:[UIImage imageNamed:@"destination"] forState:UIControlStateNormal];
            [self.funcButton setTitle:@"目的城市:" forState:UIControlStateNormal];
            self.valueLab.text = model.list.destinations;
        break;
        case 2:
            [self.funcButton setImage:[UIImage imageNamed:@"departure_traffic"] forState:UIControlStateNormal];
            [self.funcButton setTitle:@"出发交通:" forState:UIControlStateNormal];
            self.valueLab.text = model.list.traffic_go;
            break;
        case 3:
            [self.funcButton setImage:[UIImage imageNamed:@"return_traffic"] forState:UIControlStateNormal];
            [self.funcButton setTitle:@"返回交通:" forState:UIControlStateNormal];
            self.valueLab.text = model.list.traffic_back;
            break;
        case 4:
            [self.funcButton setImage:[UIImage imageNamed:@"travel_days"] forState:UIControlStateNormal];
            [self.funcButton setTitle:@"行程天数:" forState:UIControlStateNormal];
            self.valueLab.text = model.list.totalDay;
            break;
     
        default:
            break;
    }
    
}
@end
