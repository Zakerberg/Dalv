//
//  DLCityPopMenuView.m
//  Dalv
//
//  Created by Nie on 2017/5/11.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCityPopMenuView.h"

@interface DLCityPopMenuView ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, strong) UIView *shapeView;

@end

@implementation DLCityPopMenuView

- (instancetype)initWithPositionOfDirection:(CGPoint)point titleArray:(NSArray *)titleArray {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        _point = point;
        _shapeView = [[UIView alloc] init];
        _shapeView.center = CGPointMake(point.x, point.y + 5);
        _shapeView.bounds = CGRectMake(0, 0, 12, 8);
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        
        shapeLayer.position = CGPointMake(6, 4);
        shapeLayer.bounds = CGRectMake(0, 0, 12, 8);
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        [_shapeView.layer addSublayer:shapeLayer];
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint:CGPointMake(6, 0)];
        [bezierPath addLineToPoint:CGPointMake(0, 8)];
        [bezierPath addLineToPoint:CGPointMake(12, 8)];
        [bezierPath addLineToPoint:CGPointMake(6, 0)];
        shapeLayer.path = bezierPath.CGPath;
        
        _titleArray = titleArray;
        
        NSInteger maxLenght = 0;
        for (NSString *title in _titleArray) {
            if (title.length > maxLenght) {
                maxLenght = title.length;
            }
        }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10,0, maxLenght * 16.5 + 40, _titleArray.count * 44) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.layer.cornerRadius = 4;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.scrollEnabled = NO;
        [self addSubview:_tableView];
        
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
    }
    
    cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    
    [self hiddenPopMenu];
    
    if (_clickedBlock) {
        _clickedBlock(indexPath.row);
    }
    if (_delegate && [_delegate respondsToSelector:@selector(navigationMenuView:clickedAtIndex:)]) {
        [_delegate navigationMenuView:self clickedAtIndex:indexPath.row];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [UIView animateWithDuration:.2f animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        _tableView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        _tableView.alpha = 0.0f;
        _shapeView.alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        [_shapeView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    if (newSuperview) {
        CGRect tableViewFrame = _tableView.frame;
        UIViewController *nextResponder = (UIViewController *)[newSuperview nextResponder];
        if (!_shapeView.superview && [nextResponder isKindOfClass:[UIViewController class]]) {
            if (nextResponder.navigationController && _shapeView.frame.origin.y < 64) {
                [nextResponder.navigationController.view addSubview:_shapeView];
                tableViewFrame.origin.y = 64;
                _tableView.frame = tableViewFrame;
            } else {
                [self addSubview:_shapeView];
            }
        }
        
        _tableView.layer.anchorPoint = CGPointMake((_point.x - tableViewFrame.origin.x)/tableViewFrame.size.width, 0);
        _tableView.center = CGPointMake(_point.x,0 + 8);
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        _tableView.alpha = 0.0f;
        _shapeView.alpha = 0.0f;
        _tableView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        [UIView animateWithDuration:.2f animations:^{
            self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3f];
            _tableView.transform = CGAffineTransformMakeScale(1, 1);
            _tableView.alpha = 1.0f;
            _shapeView.alpha = 1.0f;
            
        }];
    }
}

- (void)hiddenPopMenu {
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    _tableView.transform = CGAffineTransformMakeScale(0.001, 0.001);
    _tableView.alpha = 0.0f;
    _shapeView.alpha = 0.0f;
    
    self.isShow = NO;
}

- (void)showPopMenu {
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3f];
    _tableView.transform = CGAffineTransformMakeScale(1, 1);
    _tableView.alpha = 1.0f;
    _shapeView.alpha = 1.0f;
    
    self.isShow = YES;

}
@end
