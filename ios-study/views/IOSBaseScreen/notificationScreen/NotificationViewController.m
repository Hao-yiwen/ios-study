//
//  NotificationViewController.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/18.
//

#import "NotificationViewController.h"

@implementation NotificationViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* notificationTestButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [notificationTestButton setTitle:@"触发urlhandler" forState:UIControlStateNormal];
    [notificationTestButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [notificationTestButton addTarget:self action:@selector(doesNotRecognizeSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:notificationTestButton];
    [NSLayoutConstraint activateConstraints:@[
        [notificationTestButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [notificationTestButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
    ]];
}

- (void)doesNotRecognizeSelector:(UIButton*)sender {
    NSString *url = @"http://www.baidu.com";
    NSDictionary *userInfo = @{@"url": url};
    NSLog(@"Here is notificationTestButton click event. url is %@", url);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"URLHANDLE"  object:nil userInfo:userInfo];
}

@end
