//
//  RequestConfig.h
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestConfig : NSObject
@property (nonatomic,strong) NSString *baseURL;
@property (nonatomic,strong) NSString *path;
@property (nonatomic,assign) HTTPRequestMethod requestMethod;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic)Class modelClass;

//Class Methods
+ (instancetype)requestWithMethod:(HTTPRequestMethod)method withPath:(NSString*)path withParameters:(NSDictionary*)parameters modelClass:(Class)modelClass;

//Instance Methods
- (instancetype)initWithMethod:(HTTPRequestMethod)method withPath:(NSString*)path withParameters:(NSDictionary*)parameters modelClass:(Class)modelClass;

- (NSString*)fullURLString;


@end
