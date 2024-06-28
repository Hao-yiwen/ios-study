//
//  User.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/28.
//

#import <Foundation/Foundation.h>
#import "User.h"

@implementation User

- (instancetype)initWithName:(NSString *)name email:(NSString *)email age:(NSNumber *)age {
    self = [super init];
    if (self) {
        _name = name;
        _email = email;
        _age = age;
    }
    return self;
}

@end
