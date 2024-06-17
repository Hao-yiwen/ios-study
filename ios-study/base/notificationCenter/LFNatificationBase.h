//
//  LFNatificationBase.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/17.
//

#ifndef LFNatificationBase_h
#define LFNatificationBase_h
#import <Foundation/Foundation.h>
#define URLHANDLE @"URLHANDLE"

@protocol LFNatificationBase <NSObject>

@required
- (void)registerUrlHandler;

- (void)unregisterUrlHandler;

@end


#endif /* LFNatificationBase_h */
