//
//  GTWebviewController.m
//  test
//
//  Created by wuwei on 2019/8/10.
//  Copyright © 2019 wuwei. All rights reserved.
//

#import "GTWebviewController.h"
#import <WebKit/WebKit.h>

@interface GTWebviewController ()<WKNavigationDelegate>

@property(nonatomic, strong, readwrite) WKWebView *webview;
@property(nonatomic, strong, readwrite) UIProgressView *progressview;

@end

@implementation GTWebviewController

//- （void)dealloc {
//    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
        self.webview.navigationDelegate = self;
        [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        self.webview;
    })];
    
    [self.view addSubview:({
        self.progressview = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 10)];
        self.progressview;
    })];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    self.progressview.progress = self.webview.estimatedProgress;
//    NSLog(@"process %@", @"");
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"decide navigate");
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"did finish");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"did failed");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
