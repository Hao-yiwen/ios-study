//
//  ViewModelController.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/28.
//
#import "ViewModelController.h"
#import "UIView+Toast.h"

@implementation ViewModelController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"view model controller";
    // 初始化view model
    User *user = [[User alloc]init];
    user.name = @"yiwen";
    user.age = @30;
    user.email = @"yiwenlemo@gmail.com";
    self.useViewModel = [[UserViewModel alloc] initWithUser:user];
    self.useViewModel.delegate = self;
    [self initUI];
    [self bindingUI];
    [self.useViewModel updaterUser:user];
    [self.useViewModel fetchData];
}

-(void) initUI{
    self.name = [[UILabel alloc] init];
    self.name.translatesAutoresizingMaskIntoConstraints = NO;
    self.name.text = @"name";
    [self.view addSubview:self.name];
    self.age = [[UILabel alloc] init];
    self.age.translatesAutoresizingMaskIntoConstraints = NO;
    self.age.text = @"age";
    [self.view addSubview:self.age];
    self.email = [[UILabel alloc] init];
    self.email.translatesAutoresizingMaskIntoConstraints = NO;
    self.email.text = @"email";
    [self.view addSubview:self.email];
    [NSLayoutConstraint activateConstraints:@[
        [self.name.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [self.name.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.age.topAnchor constraintEqualToAnchor:self.name.bottomAnchor constant:20],
        [self.age.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.email.topAnchor constraintEqualToAnchor:self.age.bottomAnchor constant:20],
        [self.email.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
    ]];
}

-(void) bindingUI{
    RAC(self.name, text) = self.useViewModel.nameSignal;
    RAC(self.age, text) = [self.useViewModel.ageSignal map:^id _Nullable(NSNumber *value) {
        return [NSString stringWithFormat:@"age: %@", value];
    }];
    RAC(self.email, text) = self.useViewModel.emailSignal;
}

- (void)showToastMessage:(NSString *)message {
    [self.view makeToast:message];
}

@end
