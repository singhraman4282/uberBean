//
//  ViewController.h
//  Uber Bean
//
//  Created by Raman Singh on 2018-04-26.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Cafe.h"


@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;

//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;
//- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
@end

