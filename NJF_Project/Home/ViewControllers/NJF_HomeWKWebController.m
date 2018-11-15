//
//  NJF_HomeWKWebController.m
//  NJF_Project
//
//  Created by niujf on 2018/11/15.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_HomeWKWebController.h"
#import <WebKit/WebKit.h>
#import "UIColor+NJF_Color.h"
#import "UIBarButtonItem+NJF_Extension.h"
#import "UIView+NJF_Extension.h"

@interface NJF_HomeWKWebController () <WKUIDelegate>

@property (nonatomic, strong) WKWebView *webview;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UIButton *backBtn;

@end

@implementation NJF_HomeWKWebController

- (void)dealloc{
    [self.webview removeObserver:self forKeyPath:@"title"];
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webview addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
}

- (instancetype)init{
    if (self = [super init]) {
        [self.view addSubview:self.webview];
        [self.view addSubview:self.progressView];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
    }
    return self;
}

- (void)setLoadUrl:(NSString *)loadUrl{
    if (loadUrl) {
         [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:loadUrl]]];
    }
}

- (void)back{
    if ([self.webview canGoBack]) {
        [self.webview goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - 监听

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.webview.estimatedProgress;
        if (self.progressView.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        }
    }else if ([keyPath isEqualToString:@"title"]){
        if (object == self.webview) {
            self.title = self.webview.title;
        } else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
    else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

//开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载网页");
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    [self.view bringSubviewToFront:self.progressView];
}

//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    self.progressView.hidden = YES;
}

//页面跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - lazy loading

- (WKWebView *)webview{
    if (!_webview) {
        _webview = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webview.UIDelegate = self;
    }
    return _webview;
}

- (UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, 2)];
        _progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
        _progressView.progressTintColor = [UIColor colorWithHexString:@"13227a"];
    }
    return _progressView;
}

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"nav_btn_back_white"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.size = _backBtn.currentImage.size;
    }
    return _backBtn;
}
@end
