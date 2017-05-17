//
//  CalendarViewController.m
//  Calendar
//

#import "CalendarViewController.h"
//UI
#import "CalendarMonthCollectionViewLayout.h"
#import "CalendarMonthHeaderView.h"
#import "CalendarDayCell.h"
//MODEL
#import "CalendarDayModel.h"


@interface CalendarViewController ()
<UICollectionViewDataSource,UICollectionViewDelegate>
{

     NSTimer* timer;//定时器

}

@property (nonatomic, assign) NSUInteger num;

@end

@implementation CalendarViewController

static NSString *MonthHeader = @"MonthHeaderView";

static NSString *DayCell = @"DayCell";


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initData];
        [self initView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [self.view addSubview:[self getTitleView]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    
        NSArray *titleArry = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
        CGFloat width = ([UIScreen mainScreen].bounds.size.width ) / 7;
        CGFloat height = [UIScreen mainScreen].bounds.size.height * 0.133;
    UIView *weekView = [[UIView alloc] init ];
    weekView.backgroundColor = COLOR_THEME3;
    if ([UIScreen mainScreen].bounds.size.height == 736) {
        weekView.frame =  CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 0.215 - 44);
    }else if ([UIScreen mainScreen].bounds.size.height == 568){
        weekView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width ,[UIScreen mainScreen].bounds.size.height * 0.151 - 49);
    }else{
        weekView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,height - 44);
    }
    
    
    for (int i = 0; i < titleArry.count; i++) {
            UILabel *lab = [[UILabel alloc] init ];
            lab.text = titleArry[i];
            lab.font = [UIFont systemFontOfSize:18.0];
            lab.textAlignment = NSTextAlignmentCenter;
            lab.textColor = [UIColor blackColor];
            if (i == 0 || i == 6) {
            lab.textColor = COLOR_THEME2;
            }
        CGFloat labH =  [UIScreen mainScreen].bounds.size.height * 0.215 - 44;
        if ([UIScreen mainScreen].bounds.size.height == 736) {
            lab.frame = CGRectMake(i * width, 32, width, labH);
        }else if ([UIScreen mainScreen].bounds.size.height == 568){
            lab.frame = CGRectMake(i * width, 12, width, 18);
        }else{
            lab.frame = CGRectMake(i * width, 15, width, 20);
        }
    
            [weekView addSubview:lab];
        }
    CalendarMonthCollectionViewLayout *layout = [CalendarMonthCollectionViewLayout new];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout]; //初始化网格视图大小
    
    [self.collectionView registerClass:[CalendarDayCell class] forCellWithReuseIdentifier:DayCell];//cell重用设置ID
    
    [self.collectionView registerClass:[CalendarMonthHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MonthHeader];
    
    self.collectionView.bounces = NO;//将网格视图的下拉效果关闭
    
    self.collectionView.delegate = self;//实现网格视图的delegate
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    self.collectionView.dataSource = self;//实现网格视图的dataSource
    
    self.collectionView.backgroundColor = COLOR_THEME4;
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:weekView];
    
}



-(void)initData{
    
    self.calendarMonth = [[NSMutableArray alloc]init];//每个月份的数组
    
}



#pragma mark - CollectionView代理方法

//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.calendarMonth.count;
}


//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray *monthArray = [self.calendarMonth objectAtIndex:section];
    
    return monthArray.count;
}


//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarDayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DayCell forIndexPath:indexPath];
    
    NSMutableArray *monthArray = [self.calendarMonth objectAtIndex:indexPath.section];
    
    
    CalendarDayModel *model = [monthArray objectAtIndex:indexPath.row];
    
    cell.model = model;
    
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSDate *currentDate = [NSDate date];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSUInteger unitFlage = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    
    NSDateComponents *conponent = [cal components:unitFlage fromDate:currentDate];
    NSInteger year = [conponent year];
    
    NSInteger month = [conponent month];
    
    NSLog(@"%ld",month);
    
    UICollectionReusableView *reusableview = nil;

    if (kind == UICollectionElementKindSectionHeader){
        
        NSMutableArray *month_Array = [self.calendarMonth objectAtIndex:indexPath.section];
        CalendarDayModel *model = [month_Array objectAtIndex:15];

        CalendarMonthHeaderView *monthHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MonthHeader forIndexPath:indexPath];
        monthHeader.masterLabel.text = [NSString stringWithFormat:@"%ld年 %ld月",model.year,model.month];//@"日期";
        if (model.month == month && model.year == year) {
            
            monthHeader.masterLabel.textColor = COLOR_THEME1;
            
        }else{
            
            monthHeader.masterLabel.textColor = COLOR_THEME;

        }
        
       
        monthHeader.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.0f];
        reusableview = monthHeader;
    }
    return reusableview;
    
}


//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSMutableArray *month_Array = [self.calendarMonth objectAtIndex:indexPath.section];
 
    
    CalendarDayModel *model = [month_Array objectAtIndex:indexPath.row];

    if (model.style == CellDayTypeNormal || model.style == CellDayTypeWeek ||model.style == CellDayTypeClick) {
       
        [self.Logic selectLogic:model];
        
        if (self.calendarblock) {
            
             self.calendarblock(model);//传递数组给上级
            
              timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
            
        }
        [self.collectionView reloadData];
    }
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}



//定时器方法
- (void)onTimer{
    
    [timer invalidate];//定时器无效
    
    timer = nil;
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
