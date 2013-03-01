//
//  UserResponse.m
//  Fitsby
//
//  Created by Brent Hronk on 3/1/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "UserResponse.h"
#import "User.h"

NSString *const FIRST_NAME_KEY = @"first_name";
NSString *const LAST_NAME_KEY = @"last_name";
NSString *const ID_KEY = @"id";
NSString *const EMAIL_KEY = @"email";

@implementation UserResponse

-(id) init {
    self = [super init];
    if (!self)
        return nil;
    
    self.user = nil;
    return self;
}

-(id) initWithData:(NSDictionary *)jsonDictionary {
    self = [super initWithData:jsonDictionary];
    if (!self)
        return nil;
    
    self.user.firstName = [jsonDictionary objectForKey:FIRST_NAME_KEY];
    self.user.lastName = [jsonDictionary objectForKey:LAST_NAME_KEY];
    self.user._id = [[jsonDictionary objectForKey:ID_KEY] intValue];
    self.user.email = [jsonDictionary objectForKey:EMAIL_KEY];
    
    return self;
}

@end
