//
//  MapViewController.m
//  ios-study
//
//  Created by 郝宜文 on 2024/6/27.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"
#import "MapModalViewController.h"

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Map";
    
    self.mapview = [[MKMapView alloc] init];
    self.mapview.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.mapview];
    [NSLayoutConstraint activateConstraints:@[
        [self.mapview.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.mapview.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
        [self.mapview.rightAnchor constraintEqualToAnchor:self.view.rightAnchor],
        [self.mapview.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
    
    CLLocation* initLocation = [[CLLocation alloc] initWithLatitude:39.908692 longitude:116.397477];
    [self setLocation:initLocation distance: 10000.0];
    
    UIButton* modalBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [modalBtn setTitle:@"Show Modal" forState:UIControlStateNormal];
    modalBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [modalBtn addTarget:self action:@selector(showModal) forControlEvents:UIControlEventTouchUpInside];
    [modalBtn setBackgroundColor:UIColor.whiteColor];
    [self.view addSubview:modalBtn];
    [NSLayoutConstraint activateConstraints:@[
        [modalBtn.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [modalBtn.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [modalBtn.widthAnchor constraintEqualToConstant:200],
        [modalBtn.heightAnchor constraintEqualToConstant:50]
    ]];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self showModal];
}

- (void)setLocation:(CLLocation *)location  distance:(CLLocationDistance)distance {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, distance, distance);
    [self.mapview setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager*) manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation* location = locations.lastObject;
    [self setLocation:location distance: 1000.0];
}

- (void)showModal{
    MapModalViewController *modal = [[MapModalViewController alloc] init];
    modal.modalPresentationStyle = UIModalPresentationPageSheet; // 或者 UIModalPresentationFormSheet

    // 这是关键：在iOS 15及以上版本中，使用 UISheetPresentationController
    if (@available(iOS 15.0, *)) {
        UISheetPresentationController *sheetController = modal.sheetPresentationController;
        sheetController.detents = @[[UISheetPresentationControllerDetent customDetentWithIdentifier:@"customDetent" resolver:^CGFloat(id<UISheetPresentationControllerDetentResolutionContext> _Nonnull context) {
                    return 300; // 指定自定义高度
                }]];
        sheetController.prefersGrabberVisible = YES; // 可选，显示一个 grabber
    } else {
        modal.preferredContentSize = CGSizeMake(self.view.frame.size.width, 300);
    }

    [self presentViewController:modal animated:YES completion:nil];
}

@end
