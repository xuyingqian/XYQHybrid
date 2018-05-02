//
//  XYQJavascriptBridge.h
//  Pods-XYQHybrid_Example
//
//  Created by xuyq on 2017/12/19.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@class XYQWebConfig;

@protocol XYQJavaScriptBridgeDelegate <NSObject>

@required
- (NSMutableDictionary *)moduleHandlers;

@end

@interface XYQJavascriptBridge : NSObject<WKUIDelegate>

@property (nonatomic, strong) WKWebViewConfiguration *configuration;

@property (nonatomic, weak) UIViewController<XYQJavaScriptBridgeDelegate> *viewController;

- (instancetype)initWithWebConfig:(XYQWebConfig *)webConfig;

/**
 移除所有的ScriptMessageHandlers
 要在XYQJavaScriptBridge释放前调用本方法，不然XYQJavaScriptBridge会无法释放
 */
- (void)removeScriptMessageHandlers;

@end
