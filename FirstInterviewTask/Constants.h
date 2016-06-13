//
//  Constants.h
//  FirstInterviewTask
//
//  Created by Mohamed Digwey on 6/12/16.
//  Copyright © 2016 GoEuro. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    HTTPRequestMethodGET,
    HTTPRequestMethodPOST
}HTTPRequestMethod;

static NSString * const kBaseURL = @"http://api.goeuro.com/api/v2/position/suggest/de";

static NSString * const kRequestLocations = @"/hamburg";
