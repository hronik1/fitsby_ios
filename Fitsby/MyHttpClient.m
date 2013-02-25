//
//  MyHttpClient.m
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

#define SERVER_URL [NSURL URLWithString:@"https://f-app.herokuapp.com/"]; //production server

//#define SERVER_URL [NSURL URLWithString:@"https://test-fitsby.herokuapp.com/"]; //test server

#import "MyHttpClient.h"

@implementation MyHttpClient

+ (NSData *) createPostRequest:(NSString *)route withParams:(NSData *)params {
    //TODO implement properly
    return nil;
}

+ (NSData *) createGetRequest:(NSString *)route withParams:(NSData *)params {
    //TODO implement properly
    return nil;
}
@end
