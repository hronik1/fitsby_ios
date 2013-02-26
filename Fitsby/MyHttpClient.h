//
//  MyHttpClient.h
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyHttpClient : NSObject

//Class method to send a post request
+ (NSData *) createPostRequest:(NSString *)route withParams:(NSDictionary *)params;

//Class method to send a get request
+ (NSData *) createGetRequest:(NSString *)route withParams:(NSDictionary *)params;

@end
