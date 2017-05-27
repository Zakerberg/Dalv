//
//  DLFianceController.m
//  Dalv
//
//  Created by Michael 柏 on 2017/5/24.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLFianceController.h"

@interface DLFianceController ()

@end

@implementation DLFianceController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    NSString *strHTML = @"<p>你好</p ><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是一个例子，请显示</p ><p>外加一个table</p ><table><tbody><tr class=\"firstRow\"><td valign=\"top\" width=\"261\">aaaa</td><td valign=\"top\" width=\"261\">bbbb</td><td valign=\"top\" width=\"261\">cccc</td></tr></tbody></table><p><br/></p >";
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    
    [webView loadHTMLString:strHTML baseURL:nil];
}

- (BOOL)dl_blueNavbar {
    return YES;
}



@end
