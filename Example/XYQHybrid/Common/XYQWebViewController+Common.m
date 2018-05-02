//
//  XYQWebViewController+Common.m
//  XYQHybrid_Example
//
//  Created by xuyq on 2018/4/20.
//  Copyright © 2018年 xuyq. All rights reserved.
//

#import "XYQWebViewController+Common.h"

@implementation XYQWebViewController (Common)

- (void)showAlert:(NSDictionary *)userInfo
{
    NSString *title = userInfo[@"title"] ?: @"";
    NSString *message = userInfo[@"message"] ?: @"";
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
