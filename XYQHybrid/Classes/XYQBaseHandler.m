//
//  XYQBaseHandler.m
//  Pods
//
//  Created by xuyq on 2017/12/19.
//

#import "XYQBaseHandler.h"

@implementation XYQBaseHandler

- (void)transferEventWithName:(NSString *)name userInfo:(NSDictionary *)userInfo
{
    if (self.webService && [self.webService respondsToSelector:@selector(handleEventWithName:userInfo:)]) {
        [self.webService handleEventWithName:name userInfo:userInfo];
    }
}

@end
