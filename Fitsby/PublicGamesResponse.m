//
//  PublicGamesResponse.m
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "PublicGamesResponse.h"
#import "Game.h"
#import "GravatarHelper.h"

//key for array of games
static NSString *const GAMES_KEY = @"public_games";
//keys for an individual game
static NSString *const ID_KEY = @"id";
static NSString *const PLAYERS_KEY = @"players";
static NSString *const DURATION_KEY = @"duration";
static NSString *const WAGER_KEY = @"wager";
static NSString *const GOAL_KEY = @"goal_days";
static NSString *const EMAIL_KEY = @"email";
static NSString *const STAKES_KEY = @"stakes";


@interface PublicGamesResponse()

//Parses and individual game and returns it
- (Game *)parseGame:(NSDictionary *)jsonDictionary;

@end

@implementation PublicGamesResponse

- (id)init {
    self = [super init];
    if (!self)
        return nil;
    
    self.games = [[NSMutableArray alloc] init];
    if (!self.games)
        return nil;
    
    return self;
}

- (id)initWithDictionary:(NSDictionary *)jsonDictionary {
    self = [super initWithDictionary:jsonDictionary];
    if (!self)
        return nil;
    
    self.games = [[NSMutableArray alloc] init];
    if (!self.games)
        return nil;
    
    NSArray *array = [jsonDictionary objectForKey:GAMES_KEY];
    for (id object in array) {
        Game *game = [self parseGame:object];
        [self.games addObject:game];
    }
    return self;
}

- (Game *)parseGame:(NSDictionary *)jsonDictionary {
    Game *game = [[Game alloc] init];
    if (!game)
        return nil;
    
    game._id = [[jsonDictionary objectForKey:ID_KEY] intValue];
    game.creatorEmail = [jsonDictionary objectForKey:EMAIL_KEY];
    game.players = [[jsonDictionary objectForKey:PLAYERS_KEY] intValue];
    game.duration = [[jsonDictionary objectForKey:DURATION_KEY] intValue];
    game.stakes = [[jsonDictionary objectForKey:STAKES_KEY] intValue];
    game.goal = [[jsonDictionary objectForKey:GOAL_KEY] intValue];
    game.wager = [[jsonDictionary objectForKey:WAGER_KEY] intValue];
    
    NSURL *gravatarURL = [GravatarHelper getGravatarURL:game.creatorEmail];
    NSData *gravatarData = [[NSData alloc] initWithContentsOfURL:gravatarURL];
    game.creatorImage = [[UIImage alloc] initWithData:gravatarData];
    
    return game;
}

@end
