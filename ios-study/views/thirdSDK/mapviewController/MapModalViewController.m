//
//  MapModalViewController.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/27.
//

#import <UIKit/UIKit.h>
#import "MapModalViewController.h"

@implementation MapModalViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.view.layer.cornerRadius = 10;
    self.view.layer.masksToBounds = true;
    
    // 添加关闭按钮
    UIButton *closeBtn;
    closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [closeBtn setImage:[UIImage systemImageNamed:@"xmark.circle" withConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:25 weight:UIImageSymbolWeightRegular]] forState:UIControlStateNormal];
    closeBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [closeBtn addTarget:self action:@selector(closeModal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    [NSLayoutConstraint activateConstraints:@[
        [closeBtn.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 10],
        [closeBtn.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant: -10],
        [closeBtn.widthAnchor constraintEqualToConstant: 60],
        [closeBtn.heightAnchor constraintEqualToConstant: 60]
    ]];
    
    UIButton* infoBtn = [[UIButton alloc] init];
    [infoBtn setImage:[UIImage systemImageNamed:@"info.circle" withConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:25 weight:UIImageSymbolWeightRegular]] forState:UIControlStateNormal];
    infoBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [infoBtn addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoBtn];
    [NSLayoutConstraint activateConstraints:@[
        [infoBtn.topAnchor constraintEqualToAnchor:self.view.topAnchor constant: 10],
        [infoBtn.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant: 10],
        [infoBtn.widthAnchor constraintEqualToConstant: 60],
        [infoBtn.heightAnchor constraintEqualToConstant: 60]
    ]];
}

-(void)closeModal{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)showInfo{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Location" message:@"Please allow location access" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
