//
//  Cities.h
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import "BaseModel.h"
#import "City.h"

@interface Cities : BaseModel
@property (nonatomic, strong) NSArray <City> *cities;

+ (void) requestCityWithcompletionBlock:(ModelCompletionBlock)completionBlock andSearchCity:(NSString *)searchCity;
-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing )err;

@end
