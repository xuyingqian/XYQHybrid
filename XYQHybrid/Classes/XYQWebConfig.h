//
//  XYQWebConfig.h
//  Pods-XYQHybrid_Example
//
//  Created by xuyq on 2018/4/25.
//

#import <Foundation/Foundation.h>

@interface XYQWebConfig : NSObject

/**
 模块名与类名的映射表
 如果这个字典有值则优先使用这个字典
 
 模块名 : 类名
 e.g.
 {
    @"Common" : @"XYQCommonHandler";
 }
 
 */
@property (nonatomic, copy) NSDictionary *moduleClassMap;

/**
 模块名与类名的映射plist文件名
 如果直接使用默认的则可为nil，默认的plist文件名为HybridModuleInfo
 */
@property (nonatomic, copy) NSString *mouduleClassMapPlistName;


@end
