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
#import "NetworkManager.h"


@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;
@property (nonatomic) NSArray *allPlaces;
@property (nonatomic) NSMutableArray *listings;

@end

