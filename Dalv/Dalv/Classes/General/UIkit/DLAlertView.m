//
//  DLAlertView.m
//  Dalv
//
//  Created by Nie on 2017/5/23.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLAlertView.h"
#import "AppDelegate.h"

@interface DLAlertView ()

@property (nonatomic, strong) UIView *alertViewBackgroundView;
@property (nonatomic, strong) UIImageView *customAlertView;

@property (nonatomic, strong) NSString *otherButtonTitle;
@property (nonatomic, strong) NSString *cancelButtonTitle;

@end

static NSInteger const DLAlertViewHeight = 125;
static NSInteger const DLAlertViewWidth = 267;
static NSInteger const DLAlertViewButtonHeight = 40;
static CGFloat const DLAlertViewLineHeight = 0.5;
static CGFloat const DLAlertViewLineWidth = 0.5;
static NSString * const DLAlertViewDefaultText = @"默认文字";
static NSString * const DLAlertViewBackgroundImageName = @"crm_tanchukuang";

static NSString * const DLAlertViewDefaultTitle = @"温馨提示";
static NSString * const DLAlertViewDefaultButtonTitle = @"确定";

@implementation DLAlertView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id <DLAlertViewDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle
{
    self = [super init];
    if (self) {
        self.frame = [UIApplication sharedApplication].keyWindow.frame;
        self.backgroundColor = [UIColor clearColor];
        self.hidden = YES;
        self.tag = 8001;
        self.title = title;
        self.message = message;
        self.delegate = delegate;
        self.cancelButtonTitle = cancelButtonTitle;
        self.otherButtonTitle = otherButtonTitle;
        
        self.alertViewBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.alertViewBackgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [self addSubview:self.alertViewBackgroundView];
        
        [self configSubviews];
        
        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        [appdelegate.window addSubview:self];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle {
    self = [super init];
    if (self) {
        self.frame = [UIApplication sharedApplication].keyWindow.frame;
        self.backgroundColor = [UIColor clearColor];
        self.hidden = YES;
        self.tag = 8001;
        self.title = title;
        self.message = message;
        self.cancelButtonTitle = cancelButtonTitle;
        self.otherButtonTitle = otherButtonTitle;
        
        self.alertViewBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.alertViewBackgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [self addSubview:self.alertViewBackgroundView];
        
        [self configSubviews];
        
        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        [appdelegate.window addSubview:self];
    }
    return self;
}

- (void)configSubviews
{
    CGFloat yoffset = (self.frame.size.height - DLAlertViewHeight)/2;
    CGFloat xoffset = (self.frame.size.width - DLAlertViewWidth)/2;
    
    //title color & line color
    UIColor *lineColor = [UIColor colorWithRed:165/255.0 green:165/255.0 blue:165/255.0 alpha:1.0];
    UIColor *buttonTitleColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1.0];
    UIColor *otherButtonTitleColor = [UIColor colorWithRed:250/255.0 green:133/255.0 blue:55/255.0 alpha:1.0];
    UIColor *textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    
    self.customAlertView = [[UIImageView alloc] initWithFrame:CGRectMake(xoffset, yoffset, DLAlertViewWidth, DLAlertViewHeight)];
    self.customAlertView.image = [[UIImage imageNamed:DLAlertViewBackgroundImageName] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    self.customAlertView.userInteractionEnabled = YES;
    
    UIScrollView *textScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DLAlertViewWidth, DLAlertViewHeight-DLAlertViewButtonHeight)];
    textScrollView.scrollEnabled = NO;
    textScrollView.contentSize = CGSizeMake(DLAlertViewWidth, DLAlertViewHeight-DLAlertViewButtonHeight);
    [self.customAlertView addSubview:textScrollView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, DLAlertViewWidth, 20)];
    titleLabel.text = self.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    titleLabel.textColor = textColor;
    [textScrollView addSubview:titleLabel];
    
    UIFont *font = [UIFont systemFontOfSize:14.0f];
    
    NSInteger textViewWidth = DLAlertViewWidth - 40;
    
    CGSize defaultSize = [DLAlertViewDefaultText boundingRectWithSize:CGSizeMake(textViewWidth, DLAlertViewHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    CGSize size = [self.message boundingRectWithSize:CGSizeMake(textViewWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    CGFloat offset = 0;
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 45, textViewWidth, size.height)];
    contentLabel.text = self.message;
    contentLabel.font = font;
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = textColor;
    [textScrollView addSubview:contentLabel];
    
    offset = size.height - defaultSize.height;
    if (offset < 0) {
        offset = 0;
    }
    
    UIFont *buttonTitleFont = [UIFont systemFontOfSize:18.0f];
    //status bar height
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    
    CGFloat totalHeight = DLAlertViewHeight + offset;
    if (totalHeight > self.frame.size.height - statusBarHeight * 2) {
        totalHeight = self.frame.size.height - statusBarHeight * 2;
    }
    CGFloat buttonYoffset = totalHeight - DLAlertViewButtonHeight;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, buttonYoffset-DLAlertViewLineHeight, DLAlertViewWidth, DLAlertViewLineHeight)];
    label.backgroundColor = lineColor;
    [self.customAlertView addSubview:label];
    
    if (!self.cancelButtonTitle || !self.otherButtonTitle) {
        
        NSString *titleString = (!self.cancelButtonTitle)?self.otherButtonTitle:self.cancelButtonTitle;
        
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake(0, buttonYoffset, DLAlertViewWidth, DLAlertViewButtonHeight);
        [cancelButton setTitle:titleString forState:UIControlStateNormal];
        [cancelButton setTitleColor:otherButtonTitleColor forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        cancelButton.titleLabel.font = buttonTitleFont;
        [self.customAlertView addSubview:cancelButton];
    }else{
        
        CGFloat x = DLAlertViewWidth / 2;
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake(0, buttonYoffset, x, DLAlertViewButtonHeight);
        [cancelButton setTitle:self.cancelButtonTitle forState:UIControlStateNormal];
        [cancelButton setTitleColor:buttonTitleColor forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        cancelButton.titleLabel.font = buttonTitleFont;
        [self.customAlertView addSubview:cancelButton];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(x-DLAlertViewLineWidth, buttonYoffset-DLAlertViewLineWidth, DLAlertViewLineWidth, DLAlertViewButtonHeight)];
        label.backgroundColor = lineColor;
        [self.customAlertView addSubview:label];
        
        UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeCustom];
        otherButton.frame = CGRectMake(x, buttonYoffset, x, DLAlertViewButtonHeight);
        [otherButton setTitle:self.otherButtonTitle forState:UIControlStateNormal];
        [otherButton setTitleColor:otherButtonTitleColor forState:UIControlStateNormal];
        [otherButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        otherButton.titleLabel.font = buttonTitleFont;
        [otherButton addTarget:self action:@selector(otherButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.customAlertView addSubview:otherButton];
    }
    
    if (offset > 0) {
        
        CGFloat newHeight = DLAlertViewHeight + offset;
        CGFloat yoffset = (self.frame.size.height - newHeight)/2;
        textScrollView.contentSize = CGSizeMake(DLAlertViewWidth, newHeight - DLAlertViewButtonHeight);
        
        if (yoffset <= statusBarHeight) {
            yoffset = statusBarHeight;
            newHeight = self.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height * 2;
            
            textScrollView.scrollEnabled = YES;
        }
        
        textScrollView.frame = CGRectMake(0, 0, DLAlertViewWidth, newHeight - DLAlertViewButtonHeight);
        
        self.customAlertView.frame = CGRectMake(xoffset, yoffset, DLAlertViewWidth, newHeight);
    }
    
    [self.alertViewBackgroundView addSubview:self.customAlertView];
}

- (void)show
{
    self.hidden = NO;
}

- (void)dismiss
{
    self.hidden = YES;
    [self removeFromSuperview];
}

- (void)cancelButtonClicked:(UIButton *)button
{
    [self dismissWithClickedButtonIndex:0];
}

- (void)otherButtonClicked:(UIButton *)button
{
    [self dismissWithClickedButtonIndex:1];
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex
{
    if ([_delegate respondsToSelector:@selector(DLAlertView:clickedButtonAtIndex:)]) {
        [_delegate DLAlertView:self clickedButtonAtIndex:buttonIndex];
    }
    
    if (self.didSelectAlertViewCompled) {
        self.didSelectAlertViewCompled(buttonIndex);
    }
    
    [self dismiss];
}

+ (instancetype)alertViewWithMessage:(NSString *)message
{
    return [[[self class] alloc] initWithTitle:DLAlertViewDefaultTitle message:message delegate:nil cancelButtonTitle:nil otherButtonTitle:DLAlertViewDefaultButtonTitle];;
}

+ (instancetype)alertViewWithMessage:(NSString *)message customButtonTitle:(NSString *)title
{
    return [[[self class] alloc] initWithTitle:DLAlertViewDefaultTitle message:message delegate:nil cancelButtonTitle:nil otherButtonTitle:title];
}


@end
