//
//  NotificationCenter.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/17.
//

#ifndef NotificationCenter_h
#define NotificationCenter_h

#import <Foundation/Foundation.h>

#import "RNUrlHandler.h"
#import "H5UrlHandler.h"

@interface LFNotificationCenter : NSObject

+ (void)registerNotificationObservers;

+ (void)unregisterNotificationObservers;

@end


#endif /* NotificationCenter_h */
