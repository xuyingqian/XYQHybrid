//
//  XYQViewController.m
//  XYQHybrid
//
//  Created by xuyq on 12/19/2017.
//  Copyright (c) 2017 xuyq. All rights reserved.
//

#import "XYQViewController.h"
#import "XYQWebViewController.h"

@interface XYQViewController ()

@end

@implementation XYQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *jumpBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 175, 50)];
    [jumpBtn setTitle:@"WebViewController" forState:UIControlStateNormal];
    [jumpBtn addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
    [jumpBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:jumpBtn];
}

- (void)jump:(id)sender
{
    XYQWebConfig *webConfig = [[XYQWebConfig alloc] init];
    webConfig.moduleClassMap = @{@"Common" : @"XYQCommonHandler"};
//    webConfig.mouduleClassMapPlistName = @"CommonModuleInfo";
    XYQWebViewController *webViewController = [[XYQWebViewController alloc] initWithUrl:[NSURL URLWithString:@"https://www.baidu.com/"] webConfig:webConfig handlers:@[@"XYQCommonHandler"]];
    [self.navigationController pushViewController:webViewController animated:YES];
}

@end
