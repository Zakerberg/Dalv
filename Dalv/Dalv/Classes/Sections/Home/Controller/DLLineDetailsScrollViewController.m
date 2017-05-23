//
//  DLLineDetailsScrollViewController.m
//  Dalv
//
//  Created by Nie on 2017/5/22.
//  Copyright © 2017年 Michael 柏. All rights reserved.
//

#import "DLLineDetailsScrollViewController.h"

@interface DLLineDetailsScrollViewController ()<UIWebViewDelegate>


@end

@implementation DLLineDetailsScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar];
    [self setupSubviews];
    [self fetchData];}

#pragma mark - Setup navbar

- (void)setupNavbar {
    self.title = @"目的地图册";
}

#pragma mark - Setup subViews

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor ms_backgroundColor];
    
    UIWebView * webview = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [webview setScalesPageToFit:YES];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.dalvu.com"]]];
    [self.view addSubview:webview];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [[DLHUDManager sharedInstance]showProgressWithText:@"正在加载网页"];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [[DLHUDManager sharedInstance]hiddenHUD];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [[DLHUDManager sharedInstance]hiddenHUD];
    [[DLHUDManager sharedInstance]showTextOnly:error.localizedDescription];
}

#pragma mark - Layout

- (void)updateViewConstraints {
    
    [super updateViewConstraints];
}

#pragma mark - Fetch data

- (void)fetchData {
    
}

#pragma mark - Event Handler

#pragma mark - Getter
@end
