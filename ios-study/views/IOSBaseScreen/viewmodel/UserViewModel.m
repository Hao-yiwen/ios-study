//
//  UserViewModel.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/29.
//

#import <Foundation/Foundation.h>
#import "UserViewModel.h"
#import <AFNetworking/AFNetworking.h>
#import "UIView+Toast.h"
#import "Config.h"

@implementation UserViewModel
- (instancetype)initWithUser:(User *)user {
    self = [super init];
    if (self) {
        _nameSignal = [RACSubject subject];
        _ageSignal = [RACSubject subject];
        _emailSignal = [RACSubject subject];
    }
    [self updaterUser:user];
    return self;
}

- (void)updaterUser:(User *)user {
    [self.nameSignal sendNext:user.name];
    [self.ageSignal sendNext:user.age];
    [self.emailSignal sendNext:user.email];
}


- (void)fetchData {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSString *baseUrl = [Config baseURL];
        [manager GET:baseUrl parameters:nil headers:nil progress:nil success:^(NSURLSessionTask *task, id responseObject){
            NSLog(@"JSON: %@", responseObject);
            if([responseObject isKindOfClass:[NSArray class]]){
                NSArray *jsonArray = (NSArray *)responseObject;
                NSMutableArray *users = [NSMutableArray array];
                for (NSDictionary *dict in jsonArray) {
                    User *user = [[User alloc] initWithName:dict[@"name"] email:dict[@"email"] age:dict[@"age"]];
                    [users addObject:user];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self updaterUser:users[1]];
                });
            }
        } failure:^(NSURLSessionTask *operation, NSError *error){
            NSLog(@"Error: %@", error);
            [self.delegate showToastMessage:@"网络异常，请求失败"];
        }];
    });
}

@end
