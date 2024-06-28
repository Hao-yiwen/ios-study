//
//  UserViewModel.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/29.
//

#ifndef UserViewModel_h
#define UserViewModel_h
#import <ReactiveObjC/ReactiveObjC.h>
#import "User.h"
#import "UserViewModelDelegate.h"

@interface UserViewModel : NSObject

@property (nonatomic, strong) RACSubject *nameSignal;
@property (nonatomic, strong) RACSubject *emailSignal;
@property (nonatomic, strong) RACSubject *ageSignal;
@property (nonatomic,strong) id<UserViewModelDelegate> delegate;

- (instancetype)initWithUser:(User *)user;
- (void)updaterUser:(User *)user;
- (void) fetchData;

@end


#endif /* UserViewModel_h */
