//
//  Cities.m
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import "Cities.h"
#import "RequestConfig.h"


@implementation Cities

+ (void)requestCityWithcompletionBlock:(ModelCompletionBlock)completionBlock andSearchCity:(NSString *)searchCity{
    NSString *formatedSearchCity = [@"/" stringByAppendingString:searchCity];
    RequestConfig * request = [RequestConfig requestWithMethod:HTTPRequestMethodGET withPath:formatedSearchCity withParameters:@{} modelClass:[self class]];
    [self performNetworkActivityWithRequestConfig:request success:^(id data) {
        completionBlock(data,nil);
    } andFailure:^(NSError *error) {
        completionBlock(nil,error);
    }];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing )err
{
    NSArray* models = [City arrayOfModelsFromDictionaries: (NSArray*)dict error:&err];
    self.cities = (NSArray<City,Optional>*)models;
    
    return self;
}
@end
