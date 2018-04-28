//
//  NetworkManager.m
//  Uber Bean
//
//  Created by Raman Singh on 2018-04-27.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager
-(void)dictFromString:(NSString *)searchItem andLatitude:(float)lati andLongitude:(float)longi completionHandler:(void(^)(NSDictionary *returnDict, NSError *error))completion
{
    self.jsonDict = [NSDictionary new];
    NSString *urlString = [NSString stringWithFormat:@"https://api.yelp.com/v3/businesses/search?term=%@&latitude=%f&longitude=%f", searchItem, lati, longi];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    [urlRequest addValue:@"Bearer 1Xhul00_71BPzNJS446OOWyN9qCnWnBz9aYEcazRIW7BC8cKENhRFiom9ihm22D9eI7FR8pLLDp7mRUh_Bx7jmq0V5UdsDVGeP3vurbyZ_UGHQZ0KCwt5mI66DPjWnYx" forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        
        self.jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
//        NSLog(@"dict is %lu", (unsigned long)self.jsonDict.count);
        
        
        if (jsonError) {
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            completion(nil, error);
            return;
        }
        completion(self.jsonDict, nil);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        }];
        
    }];
    
    [dataTask resume]; // 6
    
    
    
}//dictFromString
@end
