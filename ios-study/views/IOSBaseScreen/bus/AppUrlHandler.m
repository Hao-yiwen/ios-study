//
//  H5UrlHandler.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/20.
//

#import "AppUrlHandler.h"
#import "ios_study-Swift.h"

@implementation AppUrlHandler


- (void)registerUrlHandler {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleAppUrl:) name:@"URLHANDLE" object:nil];
    
}

- (void)unregisterUrlHandler {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"URLHANDLE" object:nil];
}

- (void)handleAppUrl:(NSNotification *)notification {
    NSDictionary* userInfo = notification.userInfo;
    NSString* url = userInfo[@"url"];
    NSLog(@"url is %@", url);
    // 如果url以http开头，说明是一个网页链接，则传递给WKWebViewScreenController 让其打开
    if([url hasPrefix:@"yiwen://app"]){
        // 获取rootNavigationController
        // 获取根导航控制器
        UIWindow *window = nil;
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                window = windowScene.windows.firstObject;
                break;
            }
        }
        
        NSDictionary *params = [self parseUrl:url];
        NSString *viewControllerName = nil;
        
        if(params[@"pageName"]) {
            viewControllerName = [[ConfigManager shared] getViewControllerNameFor:params[@"pageName"]];
        }
        
        if(viewControllerName == nil) {
            NSLog(@"viewControllerName is nil");
            return;
        }

        UIViewController *rootViewController = window.rootViewController;

        if ([rootViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *rootNavigationController = (UINavigationController *)rootViewController;
            [self navigateToViewController:viewControllerName rootNavigationController:rootNavigationController];
        } else if (rootViewController.navigationController) {
            // 如果 rootViewController 不是 UINavigationController，但有 navigationController
            UINavigationController *navigationController = rootViewController.navigationController;
            [self navigateToViewController:viewControllerName rootNavigationController:navigationController];
        } else {
            NSLog(@"Root view controller is not a navigation controller and has no navigation controller");
        }
    }
}

- (void)navigateToViewController:(NSString*)viewControllerName rootNavigationController:(UINavigationController *)rootNavigationController {
    if (viewControllerName) {
        Class viewControllerClass = NSClassFromString(viewControllerName);
        if (viewControllerClass && [viewControllerClass isSubclassOfClass:[UIViewController class]]) {
            UIViewController *viewController = [[viewControllerClass alloc] init];
            [rootNavigationController pushViewController:viewController animated:YES];
        } else {
            NSLog(@"Invalid view controller class: %@", viewControllerName);
        }
    } else {
        NSLog(@"Invalid alias: %@", viewControllerName);
    }
}

- (NSDictionary *)parseUrl:(NSString *)url {
    // rn示例url: http://127.0.0.1:8081/index.bundle?platform=ios&isRN=1&moduleName=rnDemo
    // 解析url中的参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:url];
    NSArray<NSURLQueryItem *> *queryItems = urlComponents.queryItems;
    for (NSURLQueryItem *item in queryItems) {
        [params setObject:item.value forKey:item.name];
    }
    [params setObject:url forKey:@"developUrl"];
    return params;
}

@end
