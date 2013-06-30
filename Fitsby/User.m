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
@synthesize firstName,_id,lastName;
-(void)saveUserSession
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userId=[NSString stringWithFormat:@"%d",self._id];
    [standardUserDefaults setValue:userId forKey:@"loggedInUserId"];
    [standardUserDefaults setValue:self.email forKey:@"loggedInUserEmail"];
    [standardUserDefaults setValue:self.firstName forKey:@"loggedInUserFirstName"];
    [standardUserDefaults setValue:self.lastName forKey:@"loggedInUserLastName"];
     [standardUserDefaults setValue:@"yes" forKey:@"loggedIn"];
    
    [standardUserDefaults synchronize];
}
-(void)retriveUserSession
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    self.firstName=[standardUserDefaults objectForKey:@"loggedInUserFirstName"];
    self.lastName=[standardUserDefaults objectForKey:@"loggedInUserLastName"];
   // NSLog(@"Some : %@",self.firstName);
    NSString *id=[standardUserDefaults objectForKey:@"loggedInUserId"];
    self.email=[standardUserDefaults objectForKey:@"loggedInUserEmail"];
    self._id=[id intValue];
}

@end
