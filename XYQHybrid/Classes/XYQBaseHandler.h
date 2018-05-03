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


/**
 调用WebViewController的方法
 
 @param name Category中的方法名
 @param userInfo 参数字典
 */
- (void)transferEventWithName:(NSString *)name userInfo:(NSDictionary *)userInfo;

@end
