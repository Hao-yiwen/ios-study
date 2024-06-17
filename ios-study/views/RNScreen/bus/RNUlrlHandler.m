//
//  RNUlrlHandler.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/17.
//

#import "RNUrlHandler.h"

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
}

@end
