//
//  Cafe.m
//  Uber Bean
//
//  Created by Raman Singh on 2018-04-27.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "Cafe.h"

@implementation Cafe
- (instancetype)initWithDict:(NSDictionary *)givenDict
{
    self = [super init];
    if (self) {
        _coordinates = [NSDictionary new];
        _location = [NSDictionary new];
        _transactions = [NSArray new];
        
    }
    return self;
}
@end
