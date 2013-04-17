//
//  PrivateGameResponse.h
//  Fitsby
//
//  Created by Brent Hronk on 3/27/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "StatusResponse.h"
@class Game;

@interface PrivateGameResponse : StatusResponse

@property (strong, nonatomic) Game *game;

/**
 *  init
 *
 *  Default initializer for PrivateGameResponse class.
 *
 *  @return  Reference to this instance of a PrivateGameResponse.
 */
- (id)init;

/**
 *  initWithDictionary
 *
 *  Initialize a PrivateGameResponse objct with a NSDictionary.
 *
 *  @param  jsonDictionary  Dictionary object corresponding to the response to be parsed.
 *
 *  @return Reference to this instance of PrivateGameResponse
 */
- (id)initWithDictionary:(NSDictionary *)jsonDictionary;

@end
