//
//  XYQJavascriptBridge.m
//  Pods-XYQHybrid_Example
//
//  Created by xuyq on 2017/12/19.
//

#import <objc/runtime.h>
#import "XYQJavascriptBridge.h"
#import "XYQWebConfig.h"

@interface XYQJavascriptBridge ()<WKScriptMessageHandler>

@property (nonatomic, strong) WKUserContentController *userContentController;
@property (nonatomic, copy) NSDictionary *moduleMap;

@end

@implementation XYQJavascriptBridge

#pragma mark - Init
- (instancetype)initWithWebConfig:(XYQWebConfig *)webConfig;
{
    self = [super init];
    if (self) {
        //获取模块名类名映射表
        
        if (webConfig.moduleClassMap) {
            self.moduleMap = webConfig.moduleClassMap;
        } else {
            //默认模块名类名映射表为HybridModuleInfo
            [self useModulePlist:webConfig.mouduleClassMapPlistName?:@"HybridModuleInfo"];
        }
        
        
    }
    return self;
}

#pragma mark - ModuleMap
- (void)useModulePlist:(NSString *)plistName
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    if (plistPath) {
        self.moduleMap = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
        NSLog(@"moduleMap => %@", self.moduleMap);
    }
}

#pragma mark - WKUserContentController
- (void)addScriptMessageHandlers
{
    NSArray *moduleNames = self.moduleMap.allKeys;
    for (NSString *moduleName in moduleNames) {
        [self.userContentController addScriptMessageHandler:self name:moduleName];
    }
}

- (void)removeScriptMessageHandlers
{
    NSArray *moduleNames = self.moduleMap.allKeys;
    for (NSString *moduleName in moduleNames) {
        [self.userContentController removeScriptMessageHandlerForName:moduleName];
    }
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSLog(@"name => %@", message.name);
    NSLog(@"body => %@", message.body);
    NSDictionary *body = (NSDictionary *)message.body;
    
    NSString *className = self.moduleMap[message.name];
    NSDictionary *params = [body[@"params"] isKindOfClass:[NSDictionary class]] ? body[@"params"] : nil;
    NSString *selName = params ? [NSString stringWithFormat:@"%@:", body[@"method"]] : body[@"method"];
    
    __weak id obj = [self.viewController moduleHandlers][className];
    if (obj == nil) {
        NSLog(@"Unknown class...");
        return;
    }
    
    SEL sel = NSSelectorFromString(selName);
    if ([obj respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [obj performSelector:sel withObject:params];
#pragma clang diagnostic pop
    } else {
        NSLog(@"No method...");
    }
}

#pragma mark - Getter
- (WKWebViewConfiguration *)configuration
{
    if (!_configuration) {
        _configuration = [[WKWebViewConfiguration alloc] init];
        _configuration.userContentController = self.userContentController;
    }
    return _configuration;
}

- (WKUserContentController *)userContentController
{
    if (!_userContentController) {
        _userContentController = [[WKUserContentController alloc] init];
        [self addScriptMessageHandlers];
    }
    return _userContentController;
}

@end
