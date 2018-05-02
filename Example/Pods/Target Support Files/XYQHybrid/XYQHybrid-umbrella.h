#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "XYQBaseHandler.h"
#import "XYQJavascriptBridge.h"
#import "XYQWebConfig.h"
#import "XYQWebService.h"
#import "XYQWebViewController.h"

FOUNDATION_EXPORT double XYQHybridVersionNumber;
FOUNDATION_EXPORT const unsigned char XYQHybridVersionString[];

