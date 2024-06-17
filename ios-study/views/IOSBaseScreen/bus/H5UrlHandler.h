//
//  H5UrlHandler.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/18.
//

#ifndef H5UrlHandler_h
#define H5UrlHandler_h

#import <UIKit/UIKit.h>
#import "LFNatificationBase.h"

@interface H5UrlHandler: NSObject <LFNatificationBase>

- (void)handleH5Url:(NSNotification *)notification;

@end

#endif /* H5UrlHandler_h */
