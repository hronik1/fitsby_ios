//
//  MyHttpClient.m
//  Fitsby
//
//  Created by Brent Hronk on 2/24/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

NSString *const SERVER_URL = @"https://f-app.herokuapp.com/"; //production server
//NSString *const SERVER_URL = @"https://fitsby-test.herokuapp.com/"; //test server

#import "MyHttpClient.h"

@implementation MyHttpClient

+ (NSData *)createPostRequest:(NSString *)route withParams:(NSDictionary *)params {
    //create url
    NSMutableString *stringRequest = [SERVER_URL mutableCopy];
    [stringRequest appendString:route];
    NSURL *url = [NSURL URLWithString:stringRequest];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    //create json data
    NSData *jsonParams = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc]initWithData:jsonParams encoding:NSUTF8StringEncoding];
    NSLog(@"My json is %@", jsonString);
    
    //set body
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [jsonParams length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: jsonParams];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *responseString = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"Response is %@", responseString);
    return response;
}

+ (NSData *)createGetRequest:(NSString *)route withParams:(NSDictionary *)params {
    //format base route
    NSMutableString *request = [SERVER_URL mutableCopy];
    [request appendString:route];
    [request appendString:@"?"];
    
    //add params and strip off trailing '&', if applicable
    for (id key in params) {
        [request appendString:[NSMutableString stringWithFormat:@"%@=%@&",key,[params objectForKey:key]]];
        NSLog(@"key: %@, value: %@", key, [params objectForKey:key]);
    }
    if ([request characterAtIndex:(request.length-1)] == '&') {
        [request deleteCharactersInRange:NSMakeRange(request.length-1, 1)];
    }
    
    // Create the request and log response
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:request]
                                            cachePolicy:NSURLRequestUseProtocolCachePolicy
                                            timeoutInterval:60.0];
    NSURLResponse* response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:nil];
    NSString *responseString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"My request is %@", request);
    NSLog(@"Response: %@", responseString);
   
    return data;
}

@end
