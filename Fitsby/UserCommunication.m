//
//  UserCommunication.m
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "UserCommunication.h"
#import "MyHttpClient.h"
#import "UserResponse.h"
#import "User.h"

@implementation UserCommunication

+ (UserResponse *)loginUser:(NSString *)email withPassword:(NSString *)password {
    NSArray *keys = [NSArray arrayWithObjects:@"email", @"password", nil];
    NSArray *objects = [NSArray arrayWithObjects:email, password, nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects
                                                           forKeys:keys];
    NSData *response = [MyHttpClient createPostRequest:@"login_android" withParams:dictionary];
    if(!response)
    {
        NSLog(@"error");
        return nil;
    }
    NSError *error = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    
    if (!error) {
        UserResponse *userResponse = [[UserResponse alloc] initWithDictionary:jsonDictionary];
        return userResponse;
    } else {
        NSLog(@"error");
        return nil;
    }
}
+(BOOL)logoutUser
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if(standardUserDefaults!=nil)
    {
    [standardUserDefaults setValue:@"no" forKey:@"loggedIn"];
    [standardUserDefaults synchronize];
    return true;
    }
    else
        return false;
}

+ (UserResponse *)registerUser:(NSString *)email withPassword:(NSString *)password
          confirmPassword:(NSString *)confirmPassword firstName:(NSString *)firstName lastName:(NSString *)lastName {
    NSArray *keys = [NSArray arrayWithObjects:@"email", @"password", @"confirm_password",
                     @"first_name", @"last_name", nil];
    NSArray *objects = [NSArray arrayWithObjects:email, password, confirmPassword,
                        firstName, lastName, nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects
                                                           forKeys:keys];
    
    NSData *response = [MyHttpClient createPostRequest:@"users.json" withParams:dictionary];
    if(!response)
    {
        NSLog(@"error");
        return nil;
    }

    NSError *error = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    
    if (!error) {
        UserResponse *userResponse = [[UserResponse alloc] initWithDictionary:jsonDictionary];
        return userResponse;
    } else {
        NSLog(@"error");
        return nil;
    }
}

@end
