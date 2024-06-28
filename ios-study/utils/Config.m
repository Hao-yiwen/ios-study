//
//  Config.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/29.
//

#import <Foundation/Foundation.h>
#import "Config.h"

@implementation Config

+ (NSDictionary *)configDictionary {
    NSString *configFileName = @"Config";

    #ifdef DEBUG
        configFileName = @"Config";
    #elif
        configFileName = @"Config-Release";
    #endif

    NSString *path = [[NSBundle mainBundle] pathForResource:configFileName ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:path];
}

+ (NSString *)baseURL {
    return [self configDictionary][@"BaseURL"];
}

@end
