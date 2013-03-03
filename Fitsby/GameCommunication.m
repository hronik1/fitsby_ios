//
//  GameCommunication.m
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "GameCommunication.h"
#import "MyHttpClient.h"

static NSString *const ID_KEY = @"user_id";
static NSString *const GET_PUBLIC_GAMES_ROUTE = @"public_games";

@implementation GameCommunication

+ (PublicGamesResponse *) getPublicGames:(int) userID {
    NSArray *keys = [NSArray arrayWithObjects:ID_KEY, nil];
    NSArray *objects = [NSArray arrayWithObjects:[NSNumber numberWithInt:userID], nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects
                                                           forKeys:keys];
    NSData *response = [MyHttpClient createPostRequest:GET_PUBLIC_GAMES_ROUTE withParams:dictionary];
    NSError *error = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    for (id key in jsonDictionary) {
        NSLog(@"key:%@, value:%@", key, [jsonDictionary objectForKey:key]);
    }
    return nil;
}

@end
