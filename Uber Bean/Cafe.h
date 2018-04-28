//
//  Cafe.h
//  Uber Bean
//
//  Created by Raman Singh on 2018-04-27.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Cafe : NSObject
@property (nonatomic) NSString *alias;
@property (nonatomic) NSArray *categories;
@property (nonatomic) NSDictionary *coordinates;
@property (nonatomic) NSString *display_phone;
@property (nonatomic) NSString *distance;
@property (nonatomic) NSString *cafeID;
@property (nonatomic) NSString *image_url;
@property (nonatomic) NSString *is_closed;
@property (nonatomic) NSDictionary *location;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *phone;
@property (nonatomic) NSString *price;
@property (nonatomic) NSString *rating;
@property (nonatomic) int reviewCount;
@property (nonatomic) NSArray *transactions;
@property (nonatomic) NSString *url;
@property  (nonatomic) UIImage *image;
- (instancetype)initWithDict:(NSDictionary *)givenDict;
@end
