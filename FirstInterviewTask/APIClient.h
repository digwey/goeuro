//
//  APIClient.h
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "RequestConfig.h"

typedef void (^APISuccessBlock)(id data);
typedef void (^APIFailureBlock)(NSError *error);


@interface APIClient : AFHTTPSessionManager
@property (strong,nonatomic) RequestConfig *requestConfig;
@property (copy,nonatomic) APISuccessBlock requestSuccessBlock;
@property (copy,nonatomic) APIFailureBlock requestFailureBlock;

+ (instancetype)sharedClient;

//Public Methods
- (void)startRequestWithRequestConfig:(RequestConfig *)requestConfig successBlock:(APISuccessBlock)success
                         failureBlock:(APIFailureBlock)failure;

- (void)handleSuccessWithMappedObject:(id)responseObject successBlock:(APISuccessBlock)successBlock failureBlock:(APIFailureBlock)failureBlock;
- (void)handleError:(NSError *)error withFailureBlock:(APIFailureBlock)failureBlock;

- (void)restartRequest;

@end
