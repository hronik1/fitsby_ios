//
//  CreateGameResponse.m
//  Fitsby
//
//  Created by Brent Hronk on 3/13/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "CreateGameResponse.h"

static NSString *const GAME_ID = @"game_id";

@implementation CreateGameResponse

- (id)init {
    self = [super init];
    if (!self)
        return nil;
    
    self.gameID = 0;
    return self;
}

- (id)initWithDictionary:(NSDictionary *)jsonDictionary {
    self = [super initWithDictionary:jsonDictionary];
    if (!self)
        return nil;
    
    self.gameID = [[jsonDictionary objectForKey:GAME_ID] intValue];
    
    return self;
}

@end
