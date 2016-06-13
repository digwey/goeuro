//
//  CityService.h
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import "BaseService.h"

@interface CityService : BaseService
- (void)requestAllCitiesByName: (NSString *)searchCity;
@end
