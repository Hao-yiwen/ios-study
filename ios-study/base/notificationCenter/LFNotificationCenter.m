//
//  LFNotificationCenter.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/17.
//

#import "LFNotificationCenter.h"

@implementation LFNotificationCenter

static RNUrlHandler *urlHandler = nil;

static H5UrlHandler *h5UrlHandler = nil;

static AppUrlHandler *appUrlHandler = nil;

+ (void)registerNotificationObservers {
    if (!urlHandler) {
        urlHandler = [[RNUrlHandler alloc] init];
    }
    if (!h5UrlHandler) {
        h5UrlHandler = [[H5UrlHandler alloc] init];
    }
    if(!appUrlHandler){
        appUrlHandler = [[AppUrlHandler alloc] init];
    }
    [urlHandler registerUrlHandler];
    [h5UrlHandler registerUrlHandler];
    [appUrlHandler registerUrlHandler];
}

+ (void)unregisterNotificationObservers {
    if (urlHandler) {
        [urlHandler unregisterUrlHandler];
    }
    if (h5UrlHandler) {
        [h5UrlHandler unregisterUrlHandler];
    }
    if(appUrlHandler){
        [appUrlHandler unregisterUrlHandler];
    }
}

@end
