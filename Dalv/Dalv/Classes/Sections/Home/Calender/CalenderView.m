//
//  CalenderView.h
//  testCoco
//
//  Created by Nie on 16/8/27.
//  Copyright (c) 2016年 Nie. All rights reserved.
//

#import "CalenderView.h"
#import "CalenderCollectionViewCell.h"
#import "CalenderDateHeaderView.h"
#import "CalenderModel.h"
#import "CalenderObject.h"
#import "NSDate+Calender.h"

#define SectionHeaderReuseIdentifier @"SectionHeaderView"
#define CELLReuseIdentifier @"cell"

@interface CalenderView () <UICollectionViewDataSource, UICollectionViewDelegate, CalenderCollectionViewDelegate> {
    NSMutableArray *_allDate;      ///存放所有的数据
    NSIndexPath *_tempIndex;       ///一个临时的index
    UIImageView *_imageViewSelect; ///弹出视图
    UILabel *_numLable;
    
    BOOL isFirst;
}

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation CalenderView

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _allDate = [@[] mutableCopy];
        [self setupSubviews];
        [self getCalenderData];
        isFirst = YES;
    }
    return self;
}

#pragma mark - setup Subviews

/**
 *  创建collectionView
 */
- (void)setupSubviews {
    float insetY = 2;
    if ([UIScreen mainScreen].bounds.size.width > 320) {
        insetY = 6;
    }
    
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _layout.sectionInset = UIEdgeInsetsMake(0, insetY, 0, 0);
    _layout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.frame), 60);
    _layout.itemSize = CGSizeMake(CGRectGetWidth(self.frame) / 7.0 - insetY, 70);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 64) collectionViewLayout:_layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[CalenderCollectionViewCell class]
        forCellWithReuseIdentifier:CELLReuseIdentifier];
    [_collectionView registerClass:[CalenderDateHeaderView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:SectionHeaderReuseIdentifier];
    [self addSubview:_collectionView];
}

#pragma mark - Fetch data

/**
 *  创建数据源
 */
- (void)getCalenderData {
    [_allDate removeAllObjects];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CalenderModel *calModel = [[CalenderModel alloc] init];
        NSInteger year = [[calModel getCurrentYear] integerValue];
        NSInteger month = [[calModel getCurrentMonth] integerValue];
        if (month < 1) {
            year--;
            month = 12 - month;
        }
        for (int i = 0; i < 3; i++) {
            CalenderObject *object = [[CalenderObject alloc] init];
            object.year = year;
            object.month = month + i;
            if (object.month > 12) {
                object.year = year + 1;
                object.month = month + i - 12;
            }
            object.totalDaysInMonth = [calModel getAllDaysInMonthForYear:object.year month:object.month day:1];
            object.weekDay = [calModel weeklyOrdinalityForYear:object.year month:object.month day:1];
            object.allDate = [@[] mutableCopy];
            for (int i = 0; i < object.totalDaysInMonth + object.weekDay - 1; i++) {
                NSInteger interger = i + 1 - object.weekDay + 1;
                NSString *day = [NSString stringWithFormat:@"%ld", (long) interger];
                CalendarDateSource *source = [[CalendarDateSource alloc] init];
                source.day = day;
                source.Select = NO;
                source.subTitle = @"0";
                source.adultTitle = @"0";
                [object.allDate addObject:source];
            }
            [_allDate addObject:object];
        }
        
        [self getCalendarRemindsInfo];
        [_collectionView reloadData];
//        if (isFirst) {
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                [self performSelector:@selector(performScrollToIndexPath)
//                           withObject:nil
//                           afterDelay:.5];
//            });
//            isFirst = NO;
//        }
        
    });
}

- (void)getCalendarRemindsInfo {
    CalenderObject *object = _allDate[0];
    NSString *str = [NSString stringWithFormat:@"%lu", (unsigned long) object.month];
    if (str.length == 1) {
        str = [NSString stringWithFormat:@"0%@", str];
    }
    [self getList:[NSString stringWithFormat:@"%lu-%@", (unsigned long) object.year, str]];
}

- (void)getList:(NSString *)date {
    CalenderRemindParam *param = [[CalenderRemindParam alloc] init];
    param.date = date;
    param.monthScope = @"3";
    
        NSMutableArray *array = [NSMutableArray arrayWithArray:self.tourSkuDate];
        for (int i = 0; i<array.count; i++) {
            NSInteger temindex = 0;
            DLLineTourSkuDate *tourSkuDate = array[i];
            NSString *string = [NSString stringWithFormat:@"%@",tourSkuDate.start_time];
            NSArray *temp = [string componentsSeparatedByString:@"-"];
            NSLog(@"%lu",(unsigned long)temp.count);
            if (temp.count == 3) {
                NSUInteger Mmonth = [temp[1] integerValue];
                for (int j = 0; j<_allDate.count; j++) {
                    CalenderObject *object = _allDate[j];
                    if (object.month == Mmonth) {
                        temindex = j;
                        CalenderObject *object = _allDate[temindex];
    
                        NSMutableArray *array1 = [NSMutableArray arrayWithArray:object.allDate];
                        NSString *str = [NSString stringWithFormat:@"%@",tourSkuDate.start_time];
                        if ([str.class isSubclassOfClass:[NSString class]]) {
                            if (str.length == 10) {
                                str  = [str substringFromIndex:8];
                            }
                            NSUInteger integer = [str integerValue] +object.weekDay-2;
                            CalendarDateSource *source = array1[integer];
                            source.subTitle = [NSString stringWithFormat:@"%@",tourSkuDate.price_adult_agency];
                            source.adultTitle = [NSString stringWithFormat:@"%@",tourSkuDate.price_adult_list];
                            [array1 replaceObjectAtIndex:integer withObject:source];
                        }
                        object.allDate = array1;
                        [_allDate replaceObjectAtIndex:temindex withObject:object];
                    }
                }
            }
        }
        [self.collectionView reloadData];
}

- (void)performScrollToIndexPath {
    NSInteger index = 1;
    CalenderObject *obj = _allDate[index];
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:obj.allDate.count - 1 inSection:index]
                            atScrollPosition:UICollectionViewScrollPositionBottom
                                    animated:YES];
}

#pragma mark - UICollectionViewLayout

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

#pragma mark - UICollectionViewdataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _allDate.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    CalenderObject *obj = _allDate[section];
    return obj.allDate.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        CalenderDateHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:SectionHeaderReuseIdentifier forIndexPath:indexPath];
        CalenderObject *obj = _allDate[indexPath.section];
        header.dataLabel.text = [NSString stringWithFormat:@"%lu年%lu月", (unsigned long) obj.year, (unsigned long) obj.month];
        reusableview = header;
    }
    return reusableview;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalenderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELLReuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[CalenderCollectionViewCell alloc] init];
    }
    cell.delegate = self;
    [cell configCellForArray:_allDate index:indexPath];
    if (_tempIndex && indexPath.row == _tempIndex.row && indexPath.section == _tempIndex.section) {
        [cell.calenderBtn setSelected:NO];
    } else {
        [cell.calenderBtn setSelected:NO];
    }
    //    cell.calenderBtn.backgroundColor = [UIColor redColor];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - UICollectionViewdelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_tempIndex) {
        CalenderCollectionViewCell *cell = (CalenderCollectionViewCell *) [collectionView cellForItemAtIndexPath:_tempIndex];
        cell.calenderBtn.selected = NO;
    }
    [_imageViewSelect removeFromSuperview];
}

#pragma mark - CalenderCollectionViewCellDelegate

- (void)clickDayIndex:(NSIndexPath *)indexPath {
    [self changeSelectStatueForIndex:indexPath];
}

- (void)clickTouchCancelIndex:(NSIndexPath *)indexPath {
    CalenderCollectionViewCell *cell = (CalenderCollectionViewCell *) [_collectionView cellForItemAtIndexPath:_tempIndex];
    cell.calenderBtn.selected = NO;
    [_imageViewSelect removeFromSuperview];
    CalenderObject *obj = _allDate[indexPath.section];
    CalendarDateSource *source = obj.allDate[indexPath.row];
    NSString *year = [NSString stringWithFormat:@"%lu", (unsigned long) obj.year];
    NSString *month = [NSString stringWithFormat:@"%lu", (unsigned long) obj.month];
    NSString *day = [NSString stringWithFormat:@"%@", source.day];
    if (month.length == 1) {
        month = [NSString stringWithFormat:@"0%@", month];
    }
    
    if (day.length == 1) {
        day = [NSString stringWithFormat:@"0%@", day];
    }
    if ([source.subTitle integerValue] == 0) {
        [[DLHUDManager sharedInstance] showTextOnly:@"暂无团期"];
    } else {
        if ([self.delegate respondsToSelector:@selector(calendarDidSelectObj:)]) {
            [self.delegate calendarDidSelectObj:[NSString stringWithFormat:@"%@-%@-%@", year, month, day]];
        }
    }
}

- (void)clickTouchCancelDragExit:(NSIndexPath *)indexPath {
    CalenderCollectionViewCell *cell = (CalenderCollectionViewCell *) [_collectionView cellForItemAtIndexPath:_tempIndex];
    cell.calenderBtn.selected = NO;
    [_imageViewSelect removeFromSuperview];
    [_collectionView reloadData];
}

/**
 *  改变当前选中cell的Index
 *
 *  @param indexPath 当前选择cell的index
 */
- (void)changeSelectStatueForIndex:(NSIndexPath *)indexPath {
    if (_tempIndex) {
        CalenderCollectionViewCell *cell = (CalenderCollectionViewCell *) [_collectionView cellForItemAtIndexPath:_tempIndex];
        cell.calenderBtn.selected = NO;
    }
    CalenderCollectionViewCell *cell = (CalenderCollectionViewCell *) [_collectionView cellForItemAtIndexPath:indexPath];
    _tempIndex = indexPath;
    if (![_collectionView.subviews containsObject:_imageViewSelect]) {
        [self buildSelectCalendarView];
    }
    
    CalenderObject *obj = _allDate[indexPath.section];
    CalendarDateSource *source = obj.allDate[indexPath.row];
    if ([source.subTitle integerValue] > 0) {
        CGRect rect = _imageViewSelect.frame;
        rect.origin.x = cell.frame.origin.x - 2;
        rect.origin.y = cell.frame.origin.y - 40;
        _imageViewSelect.frame = rect;
        _numLable.text = [NSString stringWithFormat:@"¥%.2f",[source.subTitle integerValue]/100.00];   ;
    } else {
        [_imageViewSelect removeFromSuperview];
    }
}

/**
 *  创建选择点击事件的视图（弹出框）
 */
- (void)buildSelectCalendarView {
//    _imageViewSelect = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dl_calender_selected_bubble"]];
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(_imageViewSelect.frame), 13)];
//    lable.text = @"条消息";
//    lable.textAlignment = NSTextAlignmentCenter;
//    lable.font = [UIFont systemFontOfSize:12];
//    lable.textColor = [UIColor whiteColor];
//    [_imageViewSelect addSubview:lable];
//    
//    _numLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, CGRectGetWidth(_imageViewSelect.frame), 17)];
//    _numLable.text = @"22";
//    _numLable.textAlignment = NSTextAlignmentCenter;
//    _numLable.font = [UIFont systemFontOfSize:16];
//    _numLable.textColor = [UIColor whiteColor];
//    
//    [_imageViewSelect addSubview:_numLable];
//    [_collectionView addSubview:_imageViewSelect];
}

@end
