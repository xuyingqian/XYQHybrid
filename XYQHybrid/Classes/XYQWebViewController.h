//
//  XYQWebViewController.h
//  Pods
//
//  Created by xuyq on 2017/12/19.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "XYQWebConfig.h"

@interface XYQWebViewController : UIViewController

/// WebView
@property (nonatomic, strong) WKWebView *webView;

/// WebView要加载的URL
@property (nonatomic, copy) NSURL *url;

/**
 初始化方法

 @param url 要加载的URL
 @param handlers 处理与JS交互事件的相应handler类名集合
 @return XYQWebViewController
 */
- (instancetype)initWithUrl:(NSURL *)url handlers:(NSArray <NSString *> *)handlers;

/**
 初始化方法

 @param url 要加载的URL
 @param webConfig 设置
 @param handlers 处理与JS交互事件的相应handler类名集合
 @return XYQWebViewController
 */
- (instancetype)initWithUrl:(NSURL *)url webConfig:(XYQWebConfig *)webConfig handlers:(NSArray <NSString *> *)handlers;

/**
 添加处理与JS交互事件的相应handler

 @param handlers 处理与JS交互事件的相应handler类名集合，e.g. @[@"XYQCommonHandler"]
 */
- (void)addModuleHandlers:(NSArray <NSString *> *)handlers;


@end
