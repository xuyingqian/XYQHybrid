//
//  XYQWebViewController.m
//  Pods
//
//  Created by xuyq on 2017/12/19.
//

#import "XYQWebViewController.h"
#import "XYQBaseHandler.h"
#import "XYQJavascriptBridge.h"

@interface XYQWebViewController ()<XYQWebService, XYQJavaScriptBridgeDelegate>

@property (nonatomic, strong) NSMutableDictionary *moduleHandlers;

@property (nonatomic, strong) XYQJavascriptBridge *jsBridge;

@property (nonatomic, strong) NSMutableDictionary *eventStrategyMap;

@property (nonatomic, strong) XYQWebConfig *webConfig;

@end

@implementation XYQWebViewController


#pragma mark - Init & Dealloc
- (instancetype)initWithUrl:(NSURL *)url handlers:(NSArray <NSString *> *)handlers
{
    return [self initWithUrl:url webConfig:_webConfig handlers:handlers];
}

- (instancetype)initWithUrl:(NSURL *)url webConfig:(XYQWebConfig *)webConfig handlers:(NSArray <NSString *> *)handlers
{
    self = [super init];
    if (self) {
        _url = url;
        _webConfig = webConfig;
        
        [self addModuleHandlers:handlers];
    }
    return self;
}

- (void)dealloc
{
    if (_jsBridge) {
        [_jsBridge removeScriptMessageHandlers];
    }
}

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self loadPage];
}

#pragma mark - Load page
- (void)loadPage
{
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
}

#pragma mark - Handlers
- (void)addModuleHandlers:(NSArray <NSString *> *)handlers
{
    for (NSString *handlerName in handlers) {
        [self addOneModuleHandler:handlerName];
    }
}

- (void)addOneModuleHandler:(NSString *)handlerName
{
    Class handlerCls = NSClassFromString(handlerName);
    id handler = [[handlerCls alloc] init];
    if (![handler isKindOfClass:[XYQBaseHandler class]]) {
        NSLog(@"Not XYQBaseHandler");
        return;
    }
    
    if (!handler) {
        return;
    }
    
    XYQBaseHandler *oneHandler = (XYQBaseHandler *)handler;
    oneHandler.webService = self;
    
    [self.moduleHandlers setObject:handler forKey:handlerName];
}

#pragma mark - Strategy
- (void)handleEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    NSInvocation *invocation = self.eventStrategyMap[eventName];
    if (!invocation) {
        SEL sel = NSSelectorFromString(eventName);
        invocation = [self invocationWithSelector:sel];
        [self.eventStrategyMap setObject:invocation forKey:eventName];
    }
    
    if (userInfo && userInfo.count > 0) {
        [invocation setArgument:&userInfo atIndex:2];
    }
    [invocation invoke];
}

- (NSInvocation *)invocationWithSelector:(SEL)sel
{
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:sel];
    if (!signature) {
        return [[NSInvocation alloc] init];
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = sel;
    
    return invocation;
}

#pragma mark - Getter
- (WKWebView *)webView
{
    if (!_webView)
    {
        //WKWebView配置
        WKWebViewConfiguration *configuration = self.jsBridge.configuration;
        
        CGRect frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        
        _webView = [[WKWebView alloc] initWithFrame:frame configuration:configuration];
        _webView.UIDelegate = self.jsBridge;
    }
    return _webView;
}

- (XYQJavascriptBridge *)jsBridge
{
    if (!_jsBridge)
    {
        _jsBridge = [[XYQJavascriptBridge alloc] initWithWebConfig:self.webConfig];
        _jsBridge.viewController = self;
    }
    return _jsBridge;
}

- (NSMutableDictionary *)moduleHandlers
{
    if (!_moduleHandlers)
    {
        _moduleHandlers = [NSMutableDictionary dictionary];
    }
    return _moduleHandlers;
}

- (NSMutableDictionary *)eventStrategyMap
{
    if (!_eventStrategyMap) {
        _eventStrategyMap = [NSMutableDictionary dictionary];
    }
    return _eventStrategyMap;
}

@end
