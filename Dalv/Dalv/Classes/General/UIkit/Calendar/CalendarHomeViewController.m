//
//  CalendarHomeViewController.m
//  Calendar
//


#import "CalendarHomeViewController.h"
#import "Color.h"

@interface CalendarHomeViewController ()
{

    
    int daynumber;//天数
    int optiondaynumber;//选择日期数量
}

@end

@implementation CalendarHomeViewController

- (instancetype)init{
    
    self = [super init];
    if (!self) {
        self = [[CalendarHomeViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [self.view addSubview:[self getTitleView]];
    
//    [self setNav];
}

- (void)setNav{
    //设置nav
    UIBarButtonItem *btnL = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(backToPersonal)];
    
    self.navigationItem.leftBarButtonItem = btnL;
}

- (void)backToPersonal{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 设置方法

//飞机初始化方法
- (void)setAirPlaneToDay:(int)day ToDateforString:(NSString *)todate
{
    daynumber = day;
    optiondaynumber = 1;//选择一个后返回数据对象
    super.calendarMonth = [self getMonthArrayOfDayNumber:daynumber ToDateforString:todate];
    [super.collectionView reloadData];//刷新
}

#pragma mark - 逻辑代码初始化

//获取时间段内的天数数组
- (NSMutableArray *)getMonthArrayOfDayNumber:(int)day ToDateforString:(NSString *)todate
{
    
    NSDate *date = [NSDate date];
    
    NSDate *selectdate  = [NSDate date];
    
    if (todate) {
        
        selectdate = [selectdate dateFromString:todate];
        
    }
    
    super.Logic = [[CalendarLogic alloc]init];
    
    return [super.Logic reloadCalendarView:date selectDate:selectdate  needDays:day];
}



#pragma mark - 设置标题

- (void)setCalendartitle:(NSString *)calendartitle;
{


    UIView *textView = [[UIView alloc] init];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(-50, -50, 100, 100)];
    [btn setTitle:@"选择日期" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [textView addSubview:btn];
        self.navigationItem.titleView =textView;

    [self.navigationItem setTitle:calendartitle];

}


@end
