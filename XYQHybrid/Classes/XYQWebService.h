//
//  XYQWebService.h
//  Pods
//
//  Created by xuyq on 2017/12/19.
//

#import <Foundation/Foundation.h>


@protocol XYQWebService <NSObject>

- (void)handleEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
