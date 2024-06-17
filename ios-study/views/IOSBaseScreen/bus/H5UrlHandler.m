//
//  H5UrlHandler.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/18.
//

#import "H5UrlHandler.h"
#import "ios_study-Swift.h"

@implementation H5UrlHandler


- (void)registerUrlHandler {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleH5Url:) name:@"URLHANDLE" object:nil];
    
}

- (void)unregisterUrlHandler { 
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"URLHANDLE" object:nil];
}

- (void)handleH5Url:(NSNotification *)notification {
    NSDictionary* userInfo = notification.userInfo;
    NSString* url = userInfo[@"url"];
    NSLog(@"url is %@", url);
    // 如果url以http开头，说明是一个网页链接，则传递给WKWebViewScreenController 让其打开
    if([url hasPrefix:@"http"]){
        // 获取rootNavigationController
        // 获取根导航控制器
        UIWindow *window = nil;
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                window = windowScene.windows.firstObject;
                break;
            }
        }

        UIViewController *rootViewController = window.rootViewController;

        if ([rootViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *rootNavigationController = (UINavigationController *)rootViewController;
            // 创建并设置 WKWebViewScreenController
            WKWebViewScreenController *webViewController = [[WKWebViewScreenController alloc] init];
            webViewController.urlString = url;
            
            // 使用 navigationController 进行页面跳转
            [rootNavigationController pushViewController:webViewController animated:YES];
        } else if (rootViewController.navigationController) {
            // 如果 rootViewController 不是 UINavigationController，但有 navigationController
            UINavigationController *navigationController = rootViewController.navigationController;
            WKWebViewScreenController *webViewController = [[WKWebViewScreenController alloc] init];
            webViewController.urlString = url;
            
            [navigationController pushViewController:webViewController animated:YES];
        } else {
            NSLog(@"Root view controller is not a navigation controller and has no navigation controller");
        }
    }
}

@end
