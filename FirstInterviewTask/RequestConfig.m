//
//  RequestConfig.m
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import "RequestConfig.h"

@implementation RequestConfig


#pragma mark - Class Methods
+ (instancetype)requestWithMethod:(HTTPRequestMethod)method withPath:(NSString*)path withParameters:(NSDictionary*)parameters modelClass:(Class)modelClass
{
    return [[RequestConfig alloc]initWithMethod:method withPath:path withParameters:parameters modelClass:modelClass];
}


#pragma mark - Instance Methods
- (instancetype)initWithMethod:(HTTPRequestMethod)method withPath:(NSString*)path withParameters:(NSDictionary*)parameters modelClass:(Class)modelClass
{
    _baseURL = kBaseURL;
    _path = path;
    _requestMethod = method;
    _modelClass = modelClass;
    return self;
}
-(NSString*)fullURLString
{
    return [NSString stringWithFormat:@"%@%@",_baseURL,_path];
}

@end
