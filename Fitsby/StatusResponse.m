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
    self = [super init];
    if (!self)
        return nil;
    
    self.successful = NO;
    self.error = nil;
    return self;
}

-(id) initWithData:(NSDictionary *)jsonDictionary {
    self = [super init];
    if (!self)
        return nil;
    
    NSString *tempStatus = [jsonDictionary objectForKey:STATUS_KEY];
    NSString *tempError = [jsonDictionary objectForKey:ERROR_KEY];
    
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
