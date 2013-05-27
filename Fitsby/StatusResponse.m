//
//  StatusResponse.m
//  Fitsby
//
//  Created by Brent Hronk on 2/28/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "StatusResponse.h"

//key and result constant definititons
static NSString *const STATUS_KEY = @"status";
static NSString *const ERROR_KEY = @"error";
static NSString *const RESPONSE_SUCCESS = @"okay";
static NSString *const RESPONSE_SUCCESS_GOOGLE_PLACES = @"OK";
static NSString *const RESPONSE_FAIL = @"fail";

@implementation StatusResponse

- (id)init {
    self = [super init];
    if (!self)
        return nil;
    
    self.successful = NO;
    self.error = nil;
    return self;
}

- (id)initWithDictionary:(NSDictionary *)jsonDictionary {
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
