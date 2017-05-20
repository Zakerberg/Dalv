//
//  DLRecommendRouteCollectionViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRecommendRouteCollectionViewCell.h"

@interface DLRecommendRouteCollectionViewCell ()

@property (nonatomic, weak) UIImageView *topicCoverImageView;
@property (nonatomic, weak) UILabel *topicTitleLabel;
@property (nonatomic, weak) UIView *containerView;
@property (nonatomic, weak) UIButton *pageviewsButton;
@property (nonatomic, weak) UIButton *commentButton;

@end

@implementation DLRecommendRouteCollectionViewCell

#pragma mark - Class Methods

+ (DLRecommendRouteCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    NSString *ID = [self cellIdentifier];
    DLRecommendRouteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[DLRecommendRouteCollectionViewCell alloc] initWithFrame:CGRectZero];
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

#pragma mark - setup Subviews

- (void)setupSubviews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 3.0f;
    self.contentView.layer.masksToBounds = YES;
    self.layer.shadowOffset = CGSizeMake(2, 2);
    self.layer.shadowOpacity = 0.1f;
    
    UIImageView *topicCoverImageView = [[UIImageView alloc] init];
    topicCoverImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.topicCoverImageView = topicCoverImageView;
    
    UILabel *topicTitleLabel = [[UILabel alloc] init];
    topicTitleLabel.textColor = [UIColor ms_blackColor];
    topicTitleLabel.font = [UIFont systemFontOfSize:14];
    topicTitleLabel.numberOfLines = 2;
    topicTitleLabel.contentMode = UIViewContentModeTop;
    self.topicTitleLabel = topicTitleLabel;
    
    UIView *containerView = [[UIView alloc] init];
    containerView.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
    self.containerView = containerView;
    
    UIButton *pageviewsButton = [[UIButton alloc] init];
    pageviewsButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [pageviewsButton setTitle:@"0" forState:UIControlStateNormal];
    [pageviewsButton setTitleColor:[UIColor colorWithHexString:@"#535353"] forState:UIControlStateNormal];
    [pageviewsButton setImage:[UIImage imageNamed:@"topic_pageviews"] forState:UIControlStateNormal];
    pageviewsButton.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    self.pageviewsButton = pageviewsButton;
    
    UIButton *commentButton = [[UIButton alloc] init];
    commentButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [commentButton setTitle:@"0" forState:UIControlStateNormal];
    [commentButton setTitleColor:[UIColor colorWithHexString:@"#535353"] forState:UIControlStateNormal];
    [commentButton setImage:[UIImage imageNamed:@"topic_comment"] forState:UIControlStateNormal];
    commentButton.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    self.commentButton = commentButton;
    
    [containerView addSubview:pageviewsButton];
    [containerView addSubview:commentButton];
    NSArray *operationButtons = @[pageviewsButton, commentButton];
    [operationButtons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                  withFixedSpacing:0.0f leadSpacing:0.0f tailSpacing:0.0f];
    [operationButtons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView);
        make.height.equalTo(self.containerView);
    }];
    [self.contentView addSubview:topicCoverImageView];
    [self.contentView addSubview:topicTitleLabel];
    [self.contentView addSubview:containerView];
}

#pragma mark - Layout

- (void)setupConstraints {
    [self.topicCoverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.and.right.equalTo(self.contentView);
        make.height.equalTo(@135);
    }];
    
    [self.topicTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topicCoverImageView.mas_bottom).with.offset(10);
        make.left.equalTo(@5);
        make.right.equalTo(@(-5));
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.and.right.equalTo(self.contentView);
        make.height.equalTo(@35);
    }];
}

#pragma mark - configure

- (void)configureCell:(DLRecommendRouteModel *)model {
    
    // 先造假数据 接口联调后用模型赋值
    NSArray *list = @[@"http://u1.img.mobile.sina.cn/public/files/image/640x172_img5900ada55a074.png",
                      @"http://u1.img.mobile.sina.cn/public/files/image/640x172_img59018d4a6d8f9.png",
                      @"http://u1.img.mobile.sina.cn/public/files/image/640x172_img5901926890af4.png",
                      @"http://7xje8b.com1.z0.glb.clouddn.com/huodong1@3x.png"];
    
    NSURL *URL = [NSURL URLWithString:[list objectAtIndex:random() % 4]];
    NSString *pageViews = [NSString stringWithFormat:@"%ld", random() % 50];
    NSString *comment = [NSString stringWithFormat:@"%ld", random() % 100];
    [self.topicCoverImageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"dalvu_tabar_myorder_pre"]];
    self.topicTitleLabel.text = [NSString stringWithFormat:@"#%@#", [NSString randomChineseWords:random() % 30]];
    [self.pageviewsButton setTitle:pageViews forState:UIControlStateNormal];
    [self.commentButton setTitle:comment forState:UIControlStateNormal];
}

@end
