//
//  BaseService.m
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService
- (instancetype)initWithDelegate:(id)delegate {
    if (self = [super init]) {
        self.delegate = delegate;
    }
    return self;
}
@end
