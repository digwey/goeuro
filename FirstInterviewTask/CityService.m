//
//  CityService.m
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import "CityService.h"
#import "Cities.h"

@implementation CityService

- (void)requestAllCitiesByName: (NSString *)searchCity {
    [Cities requestCityWithcompletionBlock:^(id data, NSError* error) {
        if (!error) {
            [self.delegate didReceiveDataSuccessfully:data];
        }
        else {
            [self.delegate didFailToReceiveData:error];
        }
    } andSearchCity:searchCity];
    
  
}
@end
