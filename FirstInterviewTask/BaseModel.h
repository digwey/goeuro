//
//  BaseModel.h
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "APIClient.h"


@interface BaseModel : JSONModel
typedef void (^ModelCompletionBlock)(id data ,NSError *error);

+ (void)performNetworkActivityWithRequestConfig:(RequestConfig *)requestConfig
                                        success:(APISuccessBlock)success
                                     andFailure:(APIFailureBlock)failure;

@end
