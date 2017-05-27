//
//  DLRemindSegmentView.m
//  Dalv
//
//  Created by Nie on 2017/5/27.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLRemindSegmentView.h"

@interface DLRemindSegmentView ()

@property (nonatomic, strong) UIButton *selctButton;

@property (nonatomic, strong) UIView *slideImageView;

@end

@implementation DLRemindSegmentView

- (instancetype)initWithFrame:(CGRect)frame titletextArr:(NSArray *)titleArr selectIndex:(NSInteger)selectIndex {
    return [self initWithFrame:frame titletextArr:titleArr widthArr:nil selectIndex:selectIndex];
}

- (instancetype)initWithFrame:(CGRect)frame titletextArr:(NSArray *)titleArr widthArr:(NSArray *)widthArr selectIndex:(NSInteger)selectIndex {
    return [self initWithFrame:frame titletextArr:titleArr widthArr:widthArr selectIndex:selectIndex titleFont:16];
}

- (instancetype)initWithFrame:(CGRect)frame titletextArr:(NSArray *)titleArr widthArr:(NSArray *)widthArr selectIndex:(NSInteger)selectIndex titleFont:(CGFloat)font {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        float totleWidth = 0;
        for (int i = 0; i < titleArr.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            float width = 0;
            if (widthArr) {
                width = [[widthArr objectAtIndex:i] floatValue];
                button.frame = CGRectMake(totleWidth, 0, width, frame.size.height - 2);
                totleWidth += width;
            } else {
                width = frame.size.width / (float) titleArr.count;
                button.frame = CGRectMake(width * i, 0, width, frame.size.height - 2);
            }
            [button.titleLabel setFont:[UIFont systemFontOfSize:font]];
            button.backgroundColor = [UIColor whiteColor];
            [button setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
            button.tag = 1000 + i;
            [button setTitleColor:[UIColor ms_blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
            if (i == selectIndex) {
                self.selctButton = button;
                [button setTitleColor:[UIColor ms_orangeColor] forState:UIControlStateNormal];
            } else {
                [button setTitleColor:[UIColor ms_blackColor] forState:UIControlStateNormal];
            }
            [self addSubview:button];
        }
        self.slideImageView = [[UIView alloc] init];
        self.slideImageView.backgroundColor = [UIColor ms_orangeColor];
        [self addSubview:self.slideImageView];
        [self.slideImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.selctButton.mas_bottom);
            make.left.equalTo(self.selctButton.mas_left);
            make.width.equalTo(self.selctButton.mas_width);
            make.height.equalTo(@2);
        }];
    }
    
    return self;
}

- (void)handleBtn:(UIButton *)button {
    [self.selctButton setTitleColor:[UIColor ms_blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor ms_orangeColor] forState:UIControlStateNormal];
    self.selctButton = button;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         [self.slideImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                             make.top.equalTo(button.mas_bottom);
                             make.left.equalTo(button.mas_left);
                             make.width.equalTo(button.mas_width);
                             make.height.equalTo(@2);
                         }];
                     }];
    
    if (self.selectBlock) {
        self.selectBlock(button.tag - 1000);
    }
}


@end
