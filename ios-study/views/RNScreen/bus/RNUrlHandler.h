//
//  RNUlrlHandler.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/17.
//

#ifndef RNUlrlHandler_h
#define RNUlrlHandler_h
#import "LFNatificationBase.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RNUrlHandler : NSObject <LFNatificationBase>
- (void) handleNotificationURL:(NSNotification*)notification;

// 解析url 返回developurl和modulename
- (NSDictionary*)parseUrl:(NSString*)url;
@end


#endif /* RNUlrlHandler_h */
