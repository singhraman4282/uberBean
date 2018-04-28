//
//  NetworkManager.h
//  Uber Bean
//
//  Created by Raman Singh on 2018-04-27.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject
-(void)dictFromString:(NSString *)searchItem andLatitude:(float)lati andLongitude:(float)longi completionHandler:(void(^)(NSDictionary *returnDict, NSError *error))completion;
@property (nonatomic) NSDictionary *jsonDict;
@end
