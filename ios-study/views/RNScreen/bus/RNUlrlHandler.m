//
//  RNUlrlHandler.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/17.
//

#import "RNUrlHandler.h"
#import "ios_study-Swift.h"

@implementation RNUrlHandler

- (void)registerUrlHandler{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotificationURL:) name:@"URLHANDLE" object:nil];
}

- (void)unregisterUrlHandler { 
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"URLHANDLE" object:nil];
}

- (void) handleNotificationURL:(NSNotification*)notification {
    NSDictionary *urlInfo = notification.userInfo;
    NSString *url = urlInfo[@"url"];
    NSLog(@"url is %@", url);
    // 解析url 如果url中存在isRN=1 则需要跳转到rn页面
    if ([url containsString:@"isRN=1"]) {
        // 解析url中的参数
        NSDictionary *params = [self parseUrl:url];
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
            // 创建并设置 RNScreenController
            RNScreenController *rnViewController = [[RNScreenController alloc] init];
            rnViewController.developUrl = params[@"developUrl"];
            rnViewController.moduleName = params[@"moduleName"];
            // 使用 navigationController 进行页面跳转
            [rootNavigationController pushViewController:rnViewController animated:YES];
        } else if (rootViewController.navigationController) {
            // 如果 rootViewController 不是 UINavigationController，但有 navigationController
            UINavigationController *navigationController = rootViewController.navigationController;
            // 创建并设置 RNScreenController
            RNScreenController *rnViewController = [[RNScreenController alloc] init];
            rnViewController.developUrl = params[@"developUrl"];
            rnViewController.moduleName = params[@"moduleName"];
            // 使用 navigationController 进行页面跳转
            [navigationController pushViewController:rnViewController animated:YES];
        } else {
            NSLog(@"Root view controller is not a navigation controller and has no navigation controller");
        }
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
