//
//  ViewController.m
//  Uber Bean
//
//  Created by Raman Singh on 2018-04-26.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () 
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.location = [[CLLocation alloc] init];
    self.mapView.delegate = self;
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocation *location1 = self.locationManager.location;
    CLLocationCoordinate2D location = location1.coordinate;
    location.latitude = location1.coordinate.latitude;
    location.longitude = location1.coordinate.longitude;
    region.span = span;
    region.center = location;
    NSLog(@"user location is %@", [self.locationManager location]);
    [self.mapView setRegion:region animated:YES];
    
    
    
    
    
    
    
    
    
    
    
    
}//load


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.location = locations.lastObject;
    NSLog(@"raman %@", self.location.description);
}//didUpdateLocations

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"raman %@", error.localizedDescription);
}//didFailWithError

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if ((status == kCLAuthorizationStatusAuthorizedAlways) | (kCLAuthorizationStatusAuthorizedWhenInUse)) {
    
    [self.locationManager requestLocation];
    }
    
}//didChangeAuthorizationStatus




//- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
//    MKCoordinateRegion region;
//    MKCoordinateSpan span;
//    span.latitudeDelta = 0.005;
//    span.longitudeDelta = 0.005;
//    CLLocationCoordinate2D location;
//    location.latitude = aUserLocation.coordinate.latitude;
//    location.longitude = aUserLocation.coordinate.longitude;
//    region.span = span;
//    region.center = location;
////    self.location.coordinate.longitude = aUserLocation.coordinate.longitude;
//    ;
//    NSLog(@"user location is %@", [self.locationManager location]);
//    [aMapView setRegion:region animated:YES];
//}




@end
