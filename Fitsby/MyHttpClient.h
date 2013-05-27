//
//  MyHttpClient.h
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyHttpClient : NSObject

/**
 *  createPostRequest
 * 
 * @param  route  This is the route of the method of the post request
 * @param  params  A dictionary of keys and values corresponding to the post paramaters
 *
 * @ereturn  Raw data returned from the server
 */
+ (NSData *)createPostRequest:(NSString *)route withParams:(NSDictionary *)params;

/**
 *  createGetRequest
 *
 * @param  route  This is the route of the method of the get request
 * @param  params  A dictionary of keys and values corresponding to the get paramaters
 *
 * @ereturn  Raw data returned from the server
 */
+ (NSData *)createGetRequest:(NSString *)route withParams:(NSDictionary *)params;

@end
