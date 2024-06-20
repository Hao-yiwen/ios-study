//
//  AppUrlHandler.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/20.
//

#ifndef AppUrlHandler_h
#define AppUrlHandler_h

#import <UIKit/UIKit.h>
#import "LFNatificationBase.h"

@interface AppUrlHandler: NSObject <LFNatificationBase>

- (void)handleAppUrl:(NSNotification *)notification;

- (void)navigateToViewController:(NSString*)viewControllerName rootNavigationController:(UINavigationController*)rootNavigationController;

@end

#endif /* AppUrlHandler_h */
