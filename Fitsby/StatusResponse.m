//
//  StatusResponse.m
//  Fitsby
//
//  Created by Brent Hronk on 2/28/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "StatusResponse.h"

//key and result constant definititons
NSString *const STATUS_KEY = @"status";
NSString *const ERROR_KEY = @"error";
NSString *const RESPONSE_SUCCESS = @"okay";
NSString *const RESPONSE_SUCCESS_GOOGLE_PLACES = @"OK";
NSString *const RESPONSE_FAIL = @"fail";

@implementation StatusResponse

-(id) init {
    self.successful = NO;
    self.error = nil;
    return self;
}

-(id) initWithData:(NSDictionary *)jsonDictionary {
    NSString *tempStatus = [jsonDictionary objectForKey:@"status"];
    NSString *tempError = [jsonDictionary objectForKey:@"error"];
    
    if ([tempStatus isEqualToString:RESPONSE_SUCCESS] || [tempStatus isEqualToString:RESPONSE_SUCCESS_GOOGLE_PLACES])
        self.successful = YES;
    else
        self.successful = NO;
    
    if (tempError)
        self.error = tempError;
    else
        self.error = @"";
    
    return self;
}

@end
