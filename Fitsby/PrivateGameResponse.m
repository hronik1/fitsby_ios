//
//  PrivateGameResponse.m
//  Fitsby
//
//  Created by Brent Hronk on 3/27/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "PrivateGameResponse.h"
#import "Game.h"
#import "GravatarHelper.h"

static NSString *const ID_KEY = @"game_id";
static NSString *const PLAYERS_KEY = @"players";
static NSString *const DURATION_KEY = @"duration";
static NSString *const WAGER_KEY = @"wager";
static NSString *const STAKES_KEY = @"stakes";
static NSString *const PRIVATE_KEY = @"is_private";
static NSString *const START_KEY = @"start_date";
static NSString *const EMAIL_KEY = @"email";
static NSString *const GOAL_KEY = @"goal_days";

@interface PrivateGameResponse()

//Parses and individual game and returns it
- (Game *)parseGame:(NSDictionary *)jsonDictionary;

@end

@implementation PrivateGameResponse

- (id)init
{
    self = [super init];
    if (!self)
        return nil;
    
    return self;
}

- (id)initWithDictionary:(NSDictionary *)jsonDictionary
{
    self = [super initWithDictionary:jsonDictionary];
    if (!self)
        return nil;
    else if (!self.isSuccessful)
        return self;
    
    self.game = [self parseGame:jsonDictionary];
    return self;
}

/** private methods **/
- (Game *)parseGame:(NSDictionary *)jsonDictionary
{
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
    game.startDate = [jsonDictionary objectForKey:START_KEY];
    
    NSURL *gravatarURL = [GravatarHelper getGravatarURL:game.creatorEmail];
    NSData *gravatarData = [[NSData alloc] initWithContentsOfURL:gravatarURL];
    game.creatorImage = [[UIImage alloc] initWithData:gravatarData];
    
    return game;
}

@end
