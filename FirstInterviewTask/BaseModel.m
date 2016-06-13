//
//  BaseModel.m
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import "BaseModel.h"
#import "APIClient.h"

@implementation BaseModel

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

+ (void)performNetworkActivityWithRequestConfig:(RequestConfig *)requestConfig
                                        success:(APISuccessBlock)success
                                     andFailure:(APIFailureBlock)failure
{
    
    [[APIClient sharedClient]startRequestWithRequestConfig:requestConfig successBlock:^(id data) {
        
        NSError *mappingError;
        id mappedObject = [[requestConfig.modelClass alloc] initWithDictionary:data error:&mappingError];
        
        success(mappedObject);
        
    } failureBlock:failure];
    
    
}

@end
