//
//  CalendarDayCell.m
//  tttttt
//



#import "CalendarDayCell.h"

@implementation CalendarDayCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    
    //选中时显示的图片
    imgview = [[UIImageView alloc]init];
    if (SCREEN_HEIGHT == 736) {
        imgview.frame = CGRectMake(SCREEN_WIDTH * 0.022, SCREEN_HEIGHT * 0.0225, 40.0f,40.0f);
    }else if (SCREEN_HEIGHT == 667){
        imgview.frame = CGRectMake(SCREEN_WIDTH * 0.0173, SCREEN_HEIGHT * 0.0225, 40.0f,40.0f);
    }else{
        imgview.frame = CGRectMake(SCREEN_WIDTH * 0.01 , SCREEN_HEIGHT * 0.0225, 40.0f, 40.0f);
    }
    imgview.image = [UIImage imageNamed:@"riqixuanze"];
    [self addSubview:imgview];
    
    //日期
    int datH = 8;
    day_lab = [[UILabel alloc]initWithFrame:CGRectMake(0, datH, self.bounds.size.width, self.bounds.size.width-10)];
    day_lab.textAlignment = NSTextAlignmentCenter;
    day_lab.font = [UIFont systemFontOfSize:20];
    
    [self addSubview:day_lab];

#pragma mark 可以在此处接收服务器数据   加载价格
    //农历
    day_title = [[UILabel alloc]initWithFrame:CGRectMake(0, datH + 31 , self.bounds.size.width, 13)];
    day_title.font = [UIFont boldSystemFontOfSize:10];
    day_title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:day_title];
    
    //画在cell上的线
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, self.bounds.size.width, 1)];
    lineView.backgroundColor = [COLOR_THEME2 colorWithAlphaComponent:0.2f];
    
    [self addSubview:lineView];

}


- (void)setModel:(CalendarDayModel *)model
{
    
    if(model.style==CellDayTypeEmpty)
    {
        [self hidden_YES];

        return;
    }
    else if(model.style==CellDayTypeWeek)
    {
        [self hidden_NO];
        
                if (model.holiday) {
                    day_lab.text = model.holiday;
                    day_lab.textColor = [UIColor orangeColor];
                    day_lab.font = [UIFont systemFontOfSize:15];
                }else{
        day_lab.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
        day_lab.textColor = COLOR_THEME2;
        day_lab.font = [UIFont systemFontOfSize:20];

                }
        
        day_title.text = model.Chinese_calendar;
        day_title.textColor = COLOR_THEME2;
        imgview.hidden = YES;
        return;
    }

    else if (model.style==CellDayTypeNormal)
    {
        [self hidden_NO];
        if (model.holiday) {
            day_lab.text = model.holiday;
            day_lab.textColor = [UIColor orangeColor];
            day_lab.font = [UIFont systemFontOfSize:15];
            
        }else{
        
            day_lab.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
            day_lab.textColor = [UIColor blackColor];
            day_lab.font = [UIFont systemFontOfSize:20];

        }
        day_title.text = model.Chinese_calendar;
        day_title.textColor = COLOR_THEME5;
        imgview.hidden = YES;


        return;
    }

    else if(model.style==CellDayTypeClick)
    {
        [self hidden_NO];
        
        day_lab.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
        day_lab.textColor = [UIColor whiteColor];
        day_title.text = model.Chinese_calendar;
        day_title.textColor = [UIColor whiteColor];
        imgview.hidden = NO;
        
        return;
    }

}



- (void)hidden_YES{
    
    day_lab.hidden = YES;
    day_title.hidden = YES;
    imgview.hidden = YES;
    lineView.hidden = YES;
    
}


- (void)hidden_NO{
    
    day_lab.hidden = NO;
    day_title.hidden = NO;
    lineView.hidden = NO;

    
}


@end
