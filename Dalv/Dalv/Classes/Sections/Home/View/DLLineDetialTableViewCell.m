//
//  DLLineDetialTableViewCell.m
//  Dalv
//
//  Created by Nie on 2017/5/31.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineDetialTableViewCell.h"

@interface DLLineDetialTableViewCell ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UILabel *htmlLab;

@property (nonatomic, strong) UITableView *schedulingTableView;

@end

@implementation DLLineDetialTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCellSubviews];
        [self layoutCellSubviews];
    }
    return self;
}

- (void)setupCellSubviews {
    
    self.schedulingTableView = [[UITableView alloc] init];
    self.schedulingTableView.delegate = self;
    self.schedulingTableView.dataSource = self;
    self.schedulingTableView.scrollEnabled = NO;
    [self.schedulingTableView registerClass:[DLLineSchedulingTableViewCell class] forCellReuseIdentifier:[DLLineSchedulingTableViewCell cellIdentifier]];
    self.schedulingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.schedulingTableView];

    _htmlLab = [[UILabel alloc]init];
    _htmlLab.numberOfLines = 0;
    _htmlLab.hidden = YES;
    [self.contentView addSubview:_htmlLab];

}

- (void)layoutCellSubviews {
    
    [self.schedulingTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.equalTo(self.contentView);
    }];
    
    
    [_htmlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@15);
        make.right.equalTo(self.contentView).offset(-15);
    }];
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

- (void)configureCell:(NSString *)htmlSting {

    if ([NSString isNotBlank:htmlSting]) {
        //1.将字符串转化为标准HTML字符串
        htmlSting = [NSString htmlEntityDecode:htmlSting];
        //2.将HTML字符串转换为attributeString
        NSAttributedString * attributeStr = [NSString attributedStringWithHTMLString:htmlSting];
        
        //3.使用label加载html字符串
        _htmlLab.attributedText = attributeStr;
        
        self.schedulingTableView.hidden = YES;
        _htmlLab.hidden = NO;
    } else {
        _htmlLab.hidden = YES;
        self.schedulingTableView.hidden = NO;
        [self.schedulingTableView reloadData];
    }
   
   
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.schedulingArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DLLineTourDetailDaysModel *schedulModel = self.schedulingArray[indexPath.row];
    return [schedulModel.daysDescription autolableHeightWithFont:[UIFont systemFontOfSize:11] Width:(self.contentView.width - 30)] + 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DLLineSchedulingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLLineSchedulingTableViewCell cellIdentifier]];
    if (self.schedulingArray.count > 0) {
        DLLineTourDetailDaysModel *schedulModel = self.schedulingArray[indexPath.row];
        [cell configureCell:schedulModel indexPath:indexPath];
    }
    return cell;
}


@end
