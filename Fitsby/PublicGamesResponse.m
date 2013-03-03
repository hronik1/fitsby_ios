//
//  PublicGamesResponse.m
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "PublicGamesResponse.h"

static NSString *const ID_KEY = @"id";
static NSString *const PLAYERS_KEY = @"players";
static NSString *const DURATION_KEY = @"duration";
static NSString *const WAGER_KEY = @"wager";

@implementation PublicGamesResponse

//TODO add implementation
-(id)init {
    self = [super init];
    if (!self)
        return nil;
    
    self.games = [[NSMutableArray alloc] init];
    if (!self.games)
        return nil;
    
    return self;
}

-(id)initWithDictionary:(NSDictionary *)jsonDictionary {
    self = [super initWithDictionary:jsonDictionary];
    if (!self)
        return nil;
    
    self.games = [[NSMutableArray alloc] init];
    if (!self.games)
        return nil;
    
    //TODO parse dictionary
    return self;
}
@end
