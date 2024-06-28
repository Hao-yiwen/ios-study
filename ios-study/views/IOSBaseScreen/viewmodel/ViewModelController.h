//
//  ViewModelController.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/28.
//

#ifndef ViewModelController_h
#define ViewModelController_h
#import <UIKit/UIKit.h>
#import "userViewModel.h"
#import "UserViewModelDelegate.h"

@interface ViewModelController : UIViewController<UserViewModelDelegate>

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *email;
@property (nonatomic, strong) UILabel *age;
@property (nonatomic,strong) UserViewModel *useViewModel;

-(void) initUI;

-(void) bindingUI;

@end


#endif /* ViewModelController_h */
