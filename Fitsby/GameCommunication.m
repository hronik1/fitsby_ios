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
#import "UserApplication.h"
#import "User.h"
#import "AFJSONRequestOperation.h"
#import "FeedCell.h"

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
static NSString *const GAME_COMMENTS = @"game_comments";
static NSString *const USER_GAMES = @"games_user_is_in";


@implementation GameCommunication

+ (PublicGamesResponse *)getPublicGames:(int) userID {
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

+ (NSDictionary*)getGameComments:(NSString *)gameID  {
    NSArray *keys = [NSArray arrayWithObjects: GAME_ID_KEY, nil];
    NSArray *objects = [NSArray arrayWithObjects:gameID, nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    NSMutableString *stringRequest = [[userApplication getServerURL] mutableCopy];
    [stringRequest appendString:GAME_COMMENTS];
    [stringRequest appendFormat:@"?"];
    [stringRequest appendFormat:@"game_id=%@",gameID];
   
   
    
    NSURL *url = [NSURL URLWithString:stringRequest];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        for (id key in JSON) {
           if([key isEqualToString:@"all_comments"])
           {
              
               returnedFeedArray=[JSON objectForKey:key];
           }
        }
        
        if(returnedFeedArray!=nil)
        {
            NSMutableArray *tempFeedArray=[[NSMutableArray alloc] init];
             for(id key in returnedFeedArray)
             {
                 FeedCell *tempFeedCell=[[FeedCell alloc] initWithData:[key objectForKey:@"first_name"] lastName:[key objectForKey:@"last_name"] message:[key objectForKey:@"message"] timeStamp:[key objectForKey:@"stamp"] commentType:[key objectForKey:@"checkin"] userId:[[NSString stringWithFormat:@"%@",[key objectForKey:@"user_id"]] intValue]];
                 [tempFeedArray addObject:tempFeedCell];
                 
             }
            userApplication.feedArray=tempFeedArray;

        }
       
        [[NSNotificationCenter defaultCenter] postNotificationName:@"finishedLoadingGetGameComments" object:nil];
        
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                             NSLog(@"NSError: %@",[error localizedDescription]);
                                         }];
    [operation start];

    NSData *response = [MyHttpClient createGetRequest:GAME_COMMENTS withParams:dictionary];
    NSError *error = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    if (error)
        return nil;
    else
        return jsonDictionary;
    
}
+ (NSDictionary*)getUserGames:(NSString *)userID  {
    NSArray *keys = [NSArray arrayWithObjects: ID_KEY, nil];
    NSArray *objects = [NSArray arrayWithObjects:userID, nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    NSData *response = [MyHttpClient createGetRequest:USER_GAMES withParams:dictionary];
    NSError *error = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    if (error)
        return nil;
    
    for (id key in jsonDictionary) {
        NSLog(@"key:%@, value:%@", key, [jsonDictionary objectForKey:key]);
    }
    return jsonDictionary;
}

+(void)populateUserGames
{
    UserApplication *userApplication = (UserApplication *)[UserApplication sharedApplication];
    NSLog(@"%d",userApplication.user._id);
    NSDictionary *userGames=[GameCommunication getUserGames:[NSString stringWithFormat:@"%d",userApplication.user._id]];
    if(userGames==nil)
    {
        NSLog(@"Error loading newsFeed");
    }
    for (id key in userGames) {
        
        if([key isEqualToString:@"games_user_is_in"])
        {
            
            
            userApplication.gameArray=[userGames objectForKey:key];
            //NSLog(@"Games : %@",gamesArray);
        }
    }
    
}

@end
