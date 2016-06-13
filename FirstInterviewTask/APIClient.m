//
//  APIClient.m
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import "APIClient.h"

@implementation APIClient


+ (instancetype)sharedClient {
    static id sharedClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[[self class] alloc] initWithBaseURL:nil sessionConfiguration:nil];
    });
    
    return sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    if(self = [super initWithBaseURL:url sessionConfiguration:configuration]) {
        [self setupRequestSerializer];
        [self setupResponseSerializer];
    }
    
    return self;
}

- (void)setupRequestSerializer
{
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.requestSerializer.timeoutInterval = 20.0f;
    [self.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [self.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
}

- (void)setupResponseSerializer
{
    self.responseSerializer = [AFJSONResponseSerializer serializer];
}

#pragma mark - Public Methods
- (void)startRequestWithRequestConfig:(RequestConfig *)requestConfig successBlock:(APISuccessBlock)success
                         failureBlock:(APIFailureBlock)failure
{
    NSLog(@"%@",requestConfig.fullURLString);
    [self setRequestConfig:requestConfig successBlock:success failureBlock:failure];
    
    if (requestConfig.requestMethod == HTTPRequestMethodGET)
    {
        [self GET:requestConfig.fullURLString parameters:requestConfig.parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            
            [self handleSuccessWithMappedObject:responseObject successBlock:success failureBlock:failure];
            
        } failure:^(NSURLSessionTask *operation, NSError *error) {
           
            [self handleError:error withFailureBlock:failure];
            
        }];
        
    }
    
    
}

- (void)handleSuccessWithMappedObject:(id)responseObject successBlock:(APISuccessBlock)successBlock failureBlock:(APIFailureBlock)failureBlock
{
    successBlock(responseObject);
}
- (void)handleError:(NSError *)error withFailureBlock:(APIFailureBlock)failureBlock
{
    failureBlock(error);
}

- (void)restartRequest
{
    [self startRequestWithRequestConfig:self.requestConfig successBlock:self.requestSuccessBlock failureBlock:self.requestFailureBlock];
}

- (void)setRequestConfig:(RequestConfig *)requestConfig successBlock:(APISuccessBlock)successBlock failureBlock:(APIFailureBlock)failureBlock
{
    self.requestConfig = requestConfig;
    self.requestSuccessBlock = successBlock;
    self.requestFailureBlock = failureBlock;
}



@end
