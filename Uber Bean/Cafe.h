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
@property (nonatomic) float longitude;
@property (nonatomic) float latitude;
@property (nonatomic) NSString *imageURL;
@property  (nonatomic) UIImage *image;
@property (nonatomic) NSString *name;
@property (nonatomic) NSDictionary *imageDict;
- (instancetype)initWithDict:(NSDictionary *)givenDict;
@end
