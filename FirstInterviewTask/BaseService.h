//
//  BaseService.h
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceDelegate
- (void)didReceiveDataSuccessfully:(id)data;
- (void)didFailToReceiveData:(NSError *)error;
@end
@interface BaseService : NSObject

@property (nonatomic,weak) id<ServiceDelegate>delegate ;

- (instancetype)initWithDelegate:(id)delegate;

@end
