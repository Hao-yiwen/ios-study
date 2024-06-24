//
//  RCTIntentModule.m
//  ios-study
//
//  Created by yw.hao on 2024/6/24.
//

#import <Foundation/Foundation.h>
#import "RCTIntentModule.h"

@implementation RCTIntentModule

RCT_EXPORT_MODULE(IntentModule)

RCT_EXPORT_METHOD(startActivityFromJS:(NSString *)url)
{
    NSLog(@"startActivityFromJS url: %@", url);
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"URLHANDLE" object:nil userInfo:@{@"url": url}];
    });
}

@end
