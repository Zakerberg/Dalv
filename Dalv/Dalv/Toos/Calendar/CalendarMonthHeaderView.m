//
//  ETIMonthHeaderView.m
//  CalendarIOS7
//


#import "CalendarMonthHeaderView.h"
#import "Color.h"
#import "CalendarLogic.h"
#import "CalendarDayModel.h"


@interface CalendarMonthHeaderView ()

@property (nonatomic, assign) NSUInteger num;

@end


#define CATDayLabelWidth  40.0f
#define CATDayLabelHeight 20.0f

@implementation CalendarMonthHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (void)setup
{
    
    self.clipsToBounds = YES;
    CGFloat widthl = [UIScreen mainScreen].bounds.size.width;

    UILabel *masterLabel = [[UILabel alloc] init ];
    [masterLabel setBackgroundColor:RGBA(234, 225, 207, 1)];
    [masterLabel setTextAlignment:NSTextAlignmentCenter];
    [masterLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
    if ([UIScreen mainScreen].bounds.size.height == 736) {
        masterLabel.frame = CGRectMake(0, 28, widthl, 18);
    }else if ([UIScreen mainScreen].bounds.size.height == 568){
        masterLabel.frame = CGRectMake(0, 16, widthl, 18);
    }else{
        masterLabel.frame = CGRectMake(0, 24, widthl, 18);
    }
    self.masterLabel = masterLabel;
    [self addSubview:self.masterLabel];
    
}


@end
