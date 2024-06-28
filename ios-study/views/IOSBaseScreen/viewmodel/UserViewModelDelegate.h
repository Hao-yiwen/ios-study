//
//  UserViewModelDelegate.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/29.
//

#ifndef UserViewModelDelegate_h
#define UserViewModelDelegate_h

@protocol UserViewModelDelegate <NSObject>
- (void)showToastMessage:(NSString *)message;
@end

#endif /* UserViewModelDelegate_h */
