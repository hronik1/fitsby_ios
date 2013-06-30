//
//  UserApplication.m
//  Fitsby
//
//  Created by Brent Hronk on 2/26/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "UserApplication.h"
#import "User.h"
#import "GameCommunication.h"
@implementation UserApplication
@synthesize user;

static NSString *const SERVER_URL = @"https://f-app.herokuapp.com/"; //production server

-(NSString*)getServerURL
{
    return SERVER_URL;
}

@end
