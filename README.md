# XYQHybrid

[![CI Status](http://img.shields.io/travis/xuyingqian/XYQHybrid.svg?style=flat)](https://travis-ci.org/xuyingqian/XYQHybrid)
[![Version](https://img.shields.io/cocoapods/v/XYQHybrid.svg?style=flat)](http://cocoapods.org/pods/XYQHybrid)
[![License](https://img.shields.io/cocoapods/l/XYQHybrid.svg?style=flat)](http://cocoapods.org/pods/XYQHybrid)
[![Platform](https://img.shields.io/cocoapods/p/XYQHybrid.svg?style=flat)](http://cocoapods.org/pods/XYQHybrid)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

XYQHybrid is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XYQHybrid'
```

## Description
XYQHybrid 是基于WKWebview的一个深度解耦Hybird框架。  
调用者只需要写好自己所负责的与JS交互的模块的Handler和WebViewController的Category就可以了。  
每一个Handler对应JS的一个模块，用于处理与JS交互后的数据处理和业务逻辑。考虑到如果交互后需要用到WebViewController，如果模块多，都回调到VC中处理，VC的代码量就会爆炸。后来从Casa大神的blog中得到灵感，使用NSInvocation调用具体的策略，策略放在对应的WebViewController的Category中。

与JS的交互协议如下：  
```window.webkit.messageHandlers.模块名.postMessage({"method":方法名,"params":参数})``` 
例：```window.webkit.messageHandlers.Common.postMessage({"method":"showAlert","params":{"title":"弹个框试试", "message":"真的弹框了"}}) ```

使用方法（详细请看DEMO）：  
1. 创建继承自XYQBaseHandler的Handler，用于处理与JS的交互事件。Handler内部的方法名与对应协议中的method，如果带有参数，可以在方法名后加上一个存放参数的dictionary  
2. 创建模块名与Handler类名的映射  
3. 创建XYQWebViewController的Category，并在Category中实现对UI的展示

## Author

xuyq, xuying1000@gmail.com

## License

XYQHybrid is available under the MIT license. See the LICENSE file for more info.
