//
//  User.m
//  Fitsby
//
//  Created by Brent Hronk on 2/26/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "User.h"

@implementation User

-(id)init {
    self._id = nil;
    self.firstName = nil;
    self.lastName = nil;
    self.email = nil;
    
    return self;
}

-(id)initWithId:(NSInteger *)_id firstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email {
    self._id = _id;
    self.firstName = firstName;
    self.lastName = lastName;
    self.email = email;
    
    return self;
}
@end
