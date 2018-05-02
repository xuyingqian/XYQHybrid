//
//  XYQAppDelegate.m
//  XYQHybrid
//
//  Created by xuyq on 12/19/2017.
//  Copyright (c) 2017 xuyq. All rights reserved.
//

#import "XYQAppDelegate.h"
#import "XYQViewController.h"

@implementation XYQAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[XYQViewController alloc] init]];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
