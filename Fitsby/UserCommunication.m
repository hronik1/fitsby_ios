//
//  UserCommunication.m
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "UserCommunication.h"
#import "MyHttpClient.h"

@implementation UserCommunication

+ (NSData *) loginUser:(NSString *)email withPassword:(NSString *)password {
    NSLog(@"email:%@, password:%@", email, password);
    
    NSArray *keys = [NSArray arrayWithObjects:@"email", @"password", nil];
    NSArray *objects = [NSArray arrayWithObjects:email, password, nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects
                                                           forKeys:keys];
    NSData *response = [MyHttpClient createPostRequest:@"login_android" withParams:dictionary];
    
    return nil;
}

+ (NSData *) registerUser:(NSString *)email withPassword:(NSString *)password
          confirmPassword:(NSString *)confirmPassword firstName:(NSString *)firstName lastName:(NSString *)lastName {
    NSLog(@"email:%@ password:%@ confirmPassword:%@ firstName:%@ lastName:%@",
          email, password, confirmPassword, firstName, lastName);
    
    NSArray *keys = [NSArray arrayWithObjects:@"email", @"password", @"confirm_password",
                     @"first_name", @"last_name", nil];
    NSArray *objects = [NSArray arrayWithObjects:email, password, confirmPassword,
                        firstName, lastName, nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects
                                                           forKeys:keys];
    
    NSData *response = [MyHttpClient createPostRequest:@"users.json" withParams:dictionary];
    return nil;
}

@end
