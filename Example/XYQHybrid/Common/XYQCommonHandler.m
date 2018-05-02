//
//  XYQCommonHandler.m
//  XYQHybrid_Example
//
//  Created by xuyq on 2018/4/20.
//  Copyright © 2018年 xuyq. All rights reserved.
//

#import "XYQCommonHandler.h"

@implementation XYQCommonHandler

- (void)showAlert:(NSDictionary *)params
{
    //JS测试语句:
    //window.webkit.messageHandlers.Common.postMessage({"method":"showAlert","params":{"title":"试一试", "message":"真的可以"}})
    [self transferEventWithName:@"showAlert:" userInfo:params];
}

@end
