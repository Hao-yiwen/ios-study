//
//  MapView.h
//  ios-study
//
//  Created by 郝宜文 on 2024/6/27.
//

#ifndef MapView_h
#define MapView_h

#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
@property MKMapView* mapview;

- (void)setLocation:(CLLocation*) location distance:(CLLocationDistance) distance;
- (void)showModal;
@end


#endif /* MapView_h */
