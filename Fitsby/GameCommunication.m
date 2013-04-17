//
//  GameCommunication.m
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "GameCommunication.h"
#import "MyHttpClient.h"
#import "PublicGamesResponse.h"
#import "CreateGameResponse.h"
#import "PrivateGameResponse.h"

static NSString *const ID_KEY = @"user_id";
static NSString *const GAME_ID_KEY = @"game_id";
static NSString *const DURATION_KEY = @"duration";
static NSString *const PRIVATE_KEY = @"is_private";
static NSString *const WAGER_KEY = @"wager";
static NSString *const GOAL_KEY = @"goal_days";
static NSString *const CARD_NUMBER_KEY = @"credit_card_number";
static NSString *const EXP_MONTH_KEY = @"credit_card_exp_month";
static NSString *const EXP_YEAR_KEY = @"credit_card_exp_year";
static NSString *const CVC_KEY = @"credit_card_cvc";
static NSString *const CREATOR_NAME_KEY = @"first_name_of_creator";

static NSString *const GET_PUBLIC_GAMES_ROUTE = @"public_games";
static NSString *const CREATE_GAME_ROUTE = @"create_game";
static NSString *const JOIN_GAME_ROUTE = @"join_game";
static NSString *const PRIVATE_GAME_ROUTE = @"get_private_game_info";

@implementation GameCommunication

+(PublicGamesResponse *) getPublicGames:(int) userID {
    NSArray *keys = [NSArray arrayWithObjects:ID_KEY, nil];
    NSArray *objects = [NSArray arrayWithObjects:[NSNumber numberWithInt:userID], nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects
                                                           forKeys:keys];
    NSData *response = [MyHttpClient createGetRequest:GET_PUBLIC_GAMES_ROUTE withParams:dictionary];
    NSError *error = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    if (error)
        return nil;
    
    for (id key in jsonDictionary) {
        NSLog(@"key:%@, value:%@", key, [jsonDictionary objectForKey:key]);
    }
    return [[PublicGamesResponse alloc] initWithDictionary:jsonDictionary];
}

+ (CreateGameResponse *)createGame:(int)creatorID duration:(int)duration isPrivate:(BOOL)isPrivate wager:(int)wager goal:(int)      goal cardNumber:(NSString *)cardNumber expYear:(NSString *)expYear expMonth:(NSString *)expMonth cvc:(NSString *)cvc {
    NSArray *keys = [NSArray arrayWithObjects:ID_KEY, DURATION_KEY, PRIVATE_KEY, WAGER_KEY, GOAL_KEY, CARD_NUMBER_KEY,
                     EXP_MONTH_KEY, EXP_YEAR_KEY, CVC_KEY, nil];
    NSArray *objects = [NSArray arrayWithObjects:[NSNumber numberWithInt:creatorID],[NSNumber numberWithInt:duration], [NSNumber numberWithBool:isPrivate], [NSNumber numberWithInt:wager], [NSNumber numberWithInt:goal], cardNumber, expMonth, expYear, cvc, nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects
                                                           forKeys:keys];
    
    NSData *response = [MyHttpClient createPostRequest:CREATE_GAME_ROUTE withParams:dictionary];
    NSError *error = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    if (error)
        return nil;
    
    for (id key in jsonDictionary) {
        NSLog(@"key:%@, value:%@", key, [jsonDictionary objectForKey:key]);
    }
    return [[CreateGameResponse alloc] initWithDictionary:jsonDictionary];
}

+ (StatusResponse *)joinGame:(int)userID gameID:(int)gameID cardNumber:(NSString *)cardNumber expYear:(NSString *)expYear expMonth:(NSString *)expMonth cvc:(NSString *)cvc {
    NSArray *keys = [NSArray arrayWithObjects:ID_KEY, GAME_ID_KEY, CARD_NUMBER_KEY, EXP_MONTH_KEY,
                     EXP_YEAR_KEY, CVC_KEY, nil];
    NSArray *objects = [NSArray arrayWithObjects:[NSNumber numberWithInt:userID], [NSNumber numberWithInt:gameID],
                        cardNumber, expMonth, expYear, cvc, nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    NSData *response = [MyHttpClient createPostRequest:JOIN_GAME_ROUTE withParams:dictionary];
    NSError *error = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    if (error)
        return nil;
    
    for (id key in jsonDictionary) {
        NSLog(@"key:%@, value:%@", key, [jsonDictionary objectForKey:key]);
    }
    return [[StatusResponse alloc] initWithDictionary:jsonDictionary];
}

+ (PrivateGameResponse *)getPrivateGame:(NSString *)gameID creatorName:(NSString *)creatorName userID:(int)userID {
    NSArray *keys = [NSArray arrayWithObjects: GAME_ID_KEY, CREATOR_NAME_KEY, ID_KEY, nil];
    NSArray *objects = [NSArray arrayWithObjects:gameID, creatorName, [NSNumber numberWithInt:userID], nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    NSData *response = [MyHttpClient createGetRequest:PRIVATE_GAME_ROUTE withParams:dictionary];
    NSError *error = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    if (error)
        return nil;
    
    for (id key in jsonDictionary) {
        NSLog(@"key:%@, value:%@", key, [jsonDictionary objectForKey:key]);
    }
    return [[PrivateGameResponse alloc] initWithDictionary:jsonDictionary];
}
@end
