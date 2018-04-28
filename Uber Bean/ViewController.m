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
    self.allPlaces = [NSArray new];
    self.listings = [NSMutableArray new];
    
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
    self.location = self.locationManager.location;
    CLLocationCoordinate2D location = self.location.coordinate;
    location.latitude = self.location.coordinate.latitude;
    location.longitude = self.location.coordinate.longitude;
    region.span = span;
    region.center = location;
    [self.mapView setRegion:region animated:YES];
    NSLog(@"current location is %@", self.locationManager.location);
    
    NetworkManager *myNetMan = [NetworkManager new];
    [myNetMan dictFromString:@"cafe" andLatitude:self.location.coordinate.latitude andLongitude:self.location.coordinate.longitude completionHandler:^(NSDictionary *returnDict, NSError *error) {
        
        self.allPlaces = returnDict[@"businesses"];
        
        
        
        int i = 16;
        for (int i=0; i<self.allPlaces.count; i++) {
            Cafe *thisCafe = [Cafe new];
            NSDictionary *thisDict = [self.allPlaces objectAtIndex:i];
            thisCafe.alias = thisDict[@"alias"];
            thisCafe.categories = thisDict[@"categories"];
            thisCafe.coordinates = thisDict[@"coordinates"];
            thisCafe.display_phone = thisDict[@"display_phone"];
            thisCafe.distance = thisDict[@"distance"];
            thisCafe.cafeID = thisDict[@"id"];
            thisCafe.image_url = thisDict[@"image_url"];
            thisCafe.is_closed = thisDict[@"is_closed"];
            thisCafe.location = thisDict[@"location"];
            thisCafe.name = thisDict[@"name"];
            thisCafe.phone = thisDict[@"phone"];
            thisCafe.price = thisDict[@"price"];
            thisCafe.rating = thisDict[@"rating"];
            thisCafe.reviewCount = thisDict[@"review_count"];
            thisCafe.transactions = thisDict[@"transactions"];
            thisCafe.url = thisDict[@"url"];
            NSURL *thisURL = [NSURL URLWithString:thisCafe.image_url];
            [self loadImageWithURLandReturnImage:thisURL forCafeObject:thisCafe];
            [self.listings addObject:thisCafe];
        NSLog(@"all places is %lu", self.allPlaces.count);
                  
        NSLog(@"place name is %@", thisCafe.name);
                  
                  
                  
        NSString *latitude = thisCafe.coordinates[@"latitude"];
        NSString *longitude = thisCafe.coordinates[@"longitude"];
        double b = [latitude doubleValue];
        double c = [longitude doubleValue];

        MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];

        myAnnotation.coordinate = CLLocationCoordinate2DMake(b, c);
        [myAnnotation setTitle:thisCafe.name];
        [myAnnotation setSubtitle:thisCafe.phone];
        [myAnnotation setSubtitle:@"come over bitches"];
        [self.mapView addAnnotation: myAnnotation];
        }//forLoop
     
        
        
//        NSLog(@"%@", thisCafe.coordinates);
        
        
        
    }];//completion
    
 

    
    
    
    
    
    
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


-(void)loadImageWithURLandReturnImage:(NSURL *)imageURL forCafeObject:(Cafe *)thisCafeObject{
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:imageURL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            thisCafeObject.image = image;
        }];
    }];
    
    [downloadTask resume];
    
}//loadImage

//- (MKAnnotationView *)mapView:(MKMapView *)mapView
//            viewForAnnotation:(id <MKAnnotation>)annotation
//{
//    MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"myId"];
//
//    if (!pinView)
//    {
//        // If an existing pin view was not available, create one.
//        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myId"];
//        pinView.canShowCallout = YES;
//        pinView.pinTintColor = [UIColor greenColor];
//        pinView.image = [UIImage imageNamed:@"pin.png"];
//
//        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        pinView.rightCalloutAccessoryView = rightButton;
//
//        // Add an image to the left callout.
//        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lhlLogo.png"]];
//        pinView.leftCalloutAccessoryView = iconView;
//
//
//    }
//    return pinView;
//}






@end
