//
//  RCTIntentModule.m
//  ios-study
//
//  Created by yw.hao on 2024/6/24.
//

#import <Foundation/Foundation.h>
#import "RCTURL.h"

@implementation RCTURL

RCT_EXPORT_MODULE(URL)

RCT_EXPORT_METHOD(openURL:(NSString *)url)
{
    NSLog(@"openURL url: %@", url);
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"URLHANDLE" object:nil userInfo:@{@"url": url}];
    });
}

@end
