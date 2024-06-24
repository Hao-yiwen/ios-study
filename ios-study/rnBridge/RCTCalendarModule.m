//
//  RCTBridgeModule.m
//  ios-study
//
//  Created by yw.hao on 2024/6/24.
//
#import <React/RCTLog.h>
#import "RCTCalendarModule.h"

@implementation RCTCalendarModule

RCT_EXPORT_MODULE(CalendarModule);

RCT_EXPORT_METHOD(createCalendarEvent:(NSString *)name location:(NSString *)location)
{
 RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}

@end
