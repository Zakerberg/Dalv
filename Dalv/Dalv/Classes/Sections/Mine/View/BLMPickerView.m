//
//  BLMPickerView.m
//  Dalv
//
//  Created by Michael 柏 on 2017/6/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "BLMPickerView.h"

@interface BLMPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong)UIView *bgV;
@property (nonatomic,strong)UIButton *cancelBtn;
@property (nonatomic,strong)UIButton *conpleteBtn;
@property (nonatomic,strong)UIPickerView *pickerV;
@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,strong) UIView* line ;
@end

@implementation BLMPickerView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.array = [NSMutableArray array];
        self.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);
        self.backgroundColor = RGBA(51, 51, 51, 0.8);
        self.bgV = [[UIView alloc]initWithFrame:CGRectMake(0, MAIN_SCREEN_HEIGHT, MAIN_SCREEN_WIDTH, 260*hScale)];
        self.bgV.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.bgV];
        
        [self showAnimation];
        //取消
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgV addSubview:self.cancelBtn];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(15);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(44);
        }];
        
        self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:kfont];
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.cancelBtn setTitleColor:[UIColor colorWithRed:1.00f green:0.59f blue:0.00f alpha:1.00f] forState:UIControlStateNormal];
        //完成
        self.conpleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgV addSubview:self.conpleteBtn];
        [self.conpleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cancelBtn);
            make.right.mas_equalTo(-15);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(44);
        }];
        self.conpleteBtn.titleLabel.font = [UIFont systemFontOfSize:kfont];
        [self.conpleteBtn setTitle:@"完成" forState:UIControlStateNormal];
        [self.conpleteBtn addTarget:self action:@selector(completeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.conpleteBtn setTitleColor:[UIColor colorWithRed:1.00f green:0.59f blue:0.00f alpha:1.00f] forState:UIControlStateNormal];
        
        //选择
        self.selectLb = [UILabel new];
        [self.bgV addSubview:self.selectLb];
        [self.selectLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.bgV.mas_centerX).offset(0);
            make.centerY.mas_equalTo(self.conpleteBtn.mas_centerY).offset(0);
        }];
        self.selectLb.font = [UIFont systemFontOfSize:kfont];
        self.selectLb.textAlignment = NSTextAlignmentCenter;
        
        //线
        UIView *line = [UIView new];
        [self.bgV addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(MAIN_SCREEN_WIDTH);
            make.height.mas_equalTo(0.5);
            make.top.mas_equalTo(self.cancelBtn.mas_bottom);
        }];
        
        line.backgroundColor = RGBA(224, 224, 224, 1);
        self.line = line ;
    }
    return self;
}

- (void)setArrayType:(ARRAYTYPE)arrayType
{
    _arrayType = arrayType;
    
    //选择器
    self.pickerV = [UIPickerView new];
    [self.bgV addSubview:self.pickerV];
    [self.pickerV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.line);
        make.bottom.offset(-100);
    }];
    
    self.pickerV.delegate = self;
    self.pickerV.dataSource = self;
    
    switch (arrayType) {
        case GenderArray:
        {
            self.selectLb.text = @"选择性别";
            [self.array addObject:@[@"男",@"女",@"保密"]];
        }
            break;
        case WorkTimeArray:
        {
            self.selectLb.text = @"选择从业时间";
            NSMutableArray *arr = [NSMutableArray array];
            for (int i = 1; i <= 10; i++) {
                
                NSString *str = [NSString stringWithFormat:@"%d 年",i];
                [arr addObject:str];
            }
            [self.array addObject:(NSArray *)arr];
            
            break;
        }
        case customerType:
        {
            
            self.selectLb.text = @"选择乘客类型";
            [self.array addObject:@[@"成人",@"儿童"]];

        }
            break;
        case certificateType:
            
        {
           
            self.selectLb.text = @"选择证件类型";
            [self.array addObject:@[@"身份证",@"护照",@"军官证",@"士兵证",@"军官证",@"台胞证",@"其它(包括港澳通行证)"]];

        }
            
        break;
    }
}

#pragma mark-----UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.array.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    NSArray * arr = (NSArray *)[self.array objectAtIndex:component];
    return arr.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *label=[[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    
    return label;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSArray *arr = (NSArray *)[self.array objectAtIndex:component];
    return [arr objectAtIndex:row % arr.count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return (MAIN_SCREEN_WIDTH - 30);
}

#pragma mark----- 点击方法
- (void)cancelBtnClick{
    [self hideAnimation];
}

- (void)completeBtnClick{
    
    NSString *fullStr = [NSString string];
    for (int i = 0; i < self.array.count; i++) {
        NSArray *arr = [self.array objectAtIndex:i];
        NSString *str = [arr objectAtIndex:[self.pickerV selectedRowInComponent:i]];
        fullStr = [fullStr stringByAppendingString:str];
    }
    if (_delegate && [_delegate respondsToSelector:@selector(PickerSelectorIndixString:)]) {
        
        [self.delegate PickerSelectorIndixString:fullStr];
    }
    
    [self hideAnimation];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self hideAnimation];
}

//隐藏动画
- (void)hideAnimation{
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.bgV.frame;
        frame.origin.y = MAIN_SCREEN_HEIGHT;
        self.bgV.frame = frame;
    } completion:^(BOOL finished) {
        
        [self.bgV removeFromSuperview];
        [self removeFromSuperview];
    }];
}
//显示动画
- (void)showAnimation{
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.bgV.frame;
        frame.origin.y = MAIN_SCREEN_HEIGHT-260*hScale;
        self.bgV.frame = frame;
    }];
}

@end
