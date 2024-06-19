//
//  MyCppWrapper.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/20.
//

#import "MyCppWrapper.h"
#include "MyCppClass.hpp"

@implementation MyCppWrapper

- (void)printMessage {
    MyCppClass mycpp;
    mycpp.printMessage();
}

@end
