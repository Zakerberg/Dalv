//
//  DLCalendarViewController.m
//  Dalv
//
//  Created by Nie on 2017/6/20.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLCalendarViewController.h"
#import "CalenderView.h"

@interface DLCalendarViewController ()<CalenderViewDelegate>

@property (nonatomic, strong) CalenderView *calentView;

@end

@implementation DLCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"团期";
    _calentView = [[CalenderView alloc] initWithFrame:self.view.bounds];
    CGRect rect = _calentView.frame;
    rect.size.height -= 64;
    _calentView.frame = rect;
    _calentView.delegate = self;
    _calentView.clipsToBounds = YES;
    _calentView.tourSkuDate = self.tourSkuDate;
    [self.view addSubview:_calentView];
        
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(refreshCalendarRemindTime)
//                                                 name:CSCUPDATETCALENDAR_REMIND_MESSAGE object:nil];
}
- (BOOL)dl_blueNavbar {
    return YES;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)refreshCalendarRemindTime {
    [_calentView getCalenderData];
}

- (void)calendarDidSelectObj:(NSString *)time {
   
    [self.navigationController popViewControllerAnimated:YES];
}

@end
