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

@end
