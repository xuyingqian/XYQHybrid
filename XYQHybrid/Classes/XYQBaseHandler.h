//
//  XYQBaseHandler.h
//  Pods
//
//  Created by xuyq on 2017/12/19.
//

#import <Foundation/Foundation.h>
#import "XYQWebService.h"

@interface XYQBaseHandler : NSObject

@property (nonatomic, weak) id<XYQWebService> webService;

- (void)transferEventWithName:(NSString *)name userInfo:(NSDictionary *)userInfo;

@end
