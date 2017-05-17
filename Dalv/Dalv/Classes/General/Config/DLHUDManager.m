//
//  DLHUDManager.m
//  Dalv
//
//  Created by Nie on 2017/5/16.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLHUDManager.h"
#import "DLAlertView.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "SynthesizeSingleton.h"

static DLHUDManager* hudInstance = nil;

static MBProgressHUD *globalHUD = nil;

@interface DLHUDManager ()

@end

@implementation DLHUDManager

SYNTHESIZE_SINGLETON_FOR_CLASS_ARC(DLHUDManager)

- (void)showTipAlertViewWithText:(NSString *)message
{
    if (!message) {
        return;
    }else if (message.length <= 0){
        return;
    }
    [[DLAlertView alertViewWithMessage:message] show];
}

- (void)showTextOnly:(NSString *)text {
    UIApplication *application = [UIApplication sharedApplication];
    
    UIView *rootView = application.keyWindow;
    
    [self showTextOnly:text onView:rootView];
}

- (void)showTextOnly:(NSString *)text
              onView:(UIView *)view
{
    [self showTextOnly:text onView:view withDelayTime:2.0f];
}

- (void)showTextOnlyWithNoEnabled:(NSString *)text
                           onView:(UIView *)view
{
    
    [self showTextOnly:text onView:view withDelayTime:2.0f];
}

- (void)showTextOnly:(NSString *)text
              onView:(UIView *)view
       withDelayTime:(NSTimeInterval)delay
{
    [self showTextTips:text onView:view withOffset:.0f withDelayTime:delay];
    
}

- (void)showTextTips:(NSString *)text
              onView:(UIView *)view
          withOffset:(CGFloat)offSet
       withDelayTime:(CGFloat)time
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (globalHUD) {
            [globalHUD hide:YES];
            globalHUD = nil;
        }
        if (text.length <= 0) {
            return;
        }
        if (view) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
            hud.userInteractionEnabled = NO;
            hud.mode = MBProgressHUDModeText;
            hud.detailsLabelText = text;
            hud.margin = 10.f;
            hud.yOffset = offSet;
            hud.removeFromSuperViewOnHide = YES;
            
            [hud hide:YES afterDelay:time];
        }
    });
}

- (void)showTipsWithMutText:(NSString *)text
                     onView:(UIView *)view
                 withOffset:(CGFloat)offSet
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (text.length <= 0) {
            return;
        }
        
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
        HUD.margin = 10.0f;
        [view addSubview:HUD];
        HUD.userInteractionEnabled = NO;
        
        CGSize size = [text boundingRectWithSize:CGSizeMake(240, 200)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f]}
                                         context:nil].size;
        NSInteger textWidth = size.width + 1;
        NSInteger textHeight = size.height + 1;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textWidth, textHeight)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.numberOfLines = 0;
        //        label.font = [UIFont boldSystemFontOfSize:14.0f];
        label.text = text;
        HUD.customView = label;
        HUD.yOffset = offSet;
        HUD.mode = MBProgressHUDModeCustomView;
        
        [HUD show:YES];
        [HUD hide:YES afterDelay:2];
    });
    
}

- (void)showWithCustomView:(NSString *)text
                    onView:(UIView *)view
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (text.length <= 0) {
            return;
        }
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
        [view addSubview:HUD];
        
        // The sample image is based on the work by http://www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
        // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
        HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"crm_success_icon"]];
        
        // Set custom view mode
        HUD.mode = MBProgressHUDModeCustomView;
        HUD.detailsLabelText = text;
        
        [HUD show:YES];
        [HUD hide:YES afterDelay:2];
        
    });
}

- (void)showProgressWithText:(NSString *)text {
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self showProgressOnView:appdelegate.window text:text close:NO];
}

- (void)showProgressWithText:(NSString *)text
                      OnView:(UIView *)view
{
    [self showProgressOnView:view text:text close:NO];
}

- (void)showProgressOnView:(UIView *)superView
                      text:(NSString *)text
                     close:(BOOL)isCanClose
{
    [self hiddenHUD];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        CGFloat activityViewWidth = 50.0f;
        
        globalHUD = [[MBProgressHUD alloc] initWithView:superView];
        [superView addSubview:globalHUD];
        
        globalHUD.removeFromSuperViewOnHide = YES;
        globalHUD.mode = MBProgressHUDModeCustomView;
        globalHUD.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        globalHUD.opacity = 0;
        
        NSInteger width = 378/2;
        NSInteger height = 125/2;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        imageView.image = [UIImage imageNamed:@"mis_progress_bg.png"];
        imageView.userInteractionEnabled = YES;
        globalHUD.customView = imageView;
        
        UIFont *font = [UIFont systemFontOfSize:16.0f];
        CGSize labelSize = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
        
        CGFloat space = (width - activityViewWidth - labelSize.width - 15.0f)/2.0f;
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(activityViewWidth + space, 0, labelSize.width, height)];
        textLabel.text = text;
        textLabel.font = font;
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = UIColorFromHex(0x2c2c2c);
        [imageView addSubview:textLabel];
        
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(space, 0, activityViewWidth, height)];
        activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [activityView startAnimating];
        activityView.hidesWhenStopped = YES;
        [imageView addSubview:activityView];
        
        if (isCanClose) {
            NSInteger lineHeight = 58/2;
            NSInteger line_y_offset = (height - lineHeight)/2;
            UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(width - 45, line_y_offset, 1, lineHeight)];
            line.image = [UIImage imageNamed:@"mis_progress_line_bg.png"];
            [imageView addSubview:line];
            
            CGFloat button_y_offset = (height - 50 ) / 2;
            
            UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
            closeButton.frame = CGRectMake(width - 50, button_y_offset, 50, 50);
            [closeButton setImage:[UIImage imageNamed:@"mis_progress_button_bg.png"] forState:UIControlStateNormal];
            [closeButton setImageEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
            [closeButton addTarget:self action:@selector(hiddenHUD) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:closeButton];
        }
        [globalHUD show:YES];
    });
}

- (void)hiddenHUD
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (globalHUD) {
            [globalHUD hide:YES];
            globalHUD = nil;
        }
    });
}

@end
