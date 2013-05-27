//
//  User.m
//  Fitsby
//
//  Created by Brent Hronk on 2/26/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "User.h"

@implementation User

- (id)init {
    self = [super init];
    if (!self)
        return nil;
    
    self._id = 0;
    self.firstName = nil;
    self.lastName = nil;
    self.email = nil;
    
    return self;
}

- (id)initWithId:(int)_id firstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email {
    self = [super init];
    if (!self)
        return nil;
    
    self._id = _id;
    self.firstName = firstName;
    self.lastName = lastName;
    self.email = email;
    
    return self;
}
@end
