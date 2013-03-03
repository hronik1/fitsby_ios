//
//  UserResponse.m
//  Fitsby
//
//  Created by Brent Hronk on 3/1/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "UserResponse.h"
#import "User.h"

static NSString *const FIRST_NAME_KEY = @"first_name";
static NSString *const LAST_NAME_KEY = @"last_name";
static NSString *const ID_KEY = @"id";
static NSString *const EMAIL_KEY = @"email";

@implementation UserResponse

-(id) init {
    self = [super init];
    if (!self)
        return nil;
    
    self.user = [[User alloc] init];
    if (!self.user)
        return nil;
    
    return self;
}

-(id) initWithDictionary:(NSDictionary *)jsonDictionary {
    self = [super initWithDictionary:jsonDictionary];
    if (!self)
        return nil;
    self.user = [[User alloc] init];
    if(!self.user)
        return nil;

    self.user.firstName = [jsonDictionary objectForKey:FIRST_NAME_KEY];
    self.user.lastName = [jsonDictionary objectForKey:LAST_NAME_KEY];
    self.user._id = [[jsonDictionary objectForKey:ID_KEY] intValue];
    self.user.email = [jsonDictionary objectForKey:EMAIL_KEY];
    
    return self;
}

@end
