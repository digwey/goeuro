//
//  City.h
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import "BaseModel.h"
#import "City.h"
#import "GeoPosition.h"

@protocol City
@end

@interface City : BaseModel

@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *country;

@property (nonatomic, strong) GeoPosition *geo_position;

@end
