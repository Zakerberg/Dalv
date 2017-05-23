//
//  DLFuncListCell.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFuncListCell.h"
#import "DLFuncList.h"
#import "UIColor+Addition.h"
#import "NSAttributedString+Additon.h"
#import "Masonry.h"

@interface  DLFuncListCell()
@property (nonatomic, weak) UIButton *funcButton;
@end

@implementation DLFuncListCell
-(void)awakeFromNib {
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}




#pragma mark - 设置数据
- (void)setFunctionList:(DLFuncList *)functionList {
    _functionList = functionList;
    
    // 设置按钮内容
    UIImage *image = [UIImage imageNamed:functionList.icon];
    NSAttributedString *attrText = [NSAttributedString imageTextWithImage:image imageWH:25 title:functionList.name fontSize:14 titleColor:[UIColor colorWithHex:0x2E2E2E] spacing:10];
    
    [_funcButton setAttributedTitle:attrText forState:UIControlStateNormal];
}

#pragma mark - 设置界面
/**
 * 因为 prepareLayout 方法已经结束，意味着每一个 cell 的大小已经计算完毕
 * cell 的 frame 就是准确的 frame
 */
- (void)setupUI {
    
    // 0. 设置背景颜色
    self.backgroundColor = [UIColor whiteColor];
    
    // 1. 添加和 bounds 一样大的按钮
    UIButton *button = [[UIButton alloc] initWithFrame:self.bounds];
    
    // 2. 设置 button 内容
    // 设置多行文本
    button.titleLabel.numberOfLines = 0;
    // 设置文本对齐方式
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [button addTarget:self action:@selector(xx:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 3. 添加按钮
    [self.contentView addSubview:button];
    
    // 4. 记录成员变量
    _funcButton = button;
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.offset(0);
    }];
}
- (void)layoutSubviews {
    [super layoutSubviews];
}
- (void)xx:(UIButton *)btn {
    
    
    
}

- (void)setHighlighted:(BOOL)highlighted {
    self.backgroundColor = highlighted ? [UIColor groupTableViewBackgroundColor] : [UIColor whiteColor];
}

@end
