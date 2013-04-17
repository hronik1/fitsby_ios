//
//  PublicGamesResponse.h
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "StatusResponse.h"

@interface PublicGamesResponse : StatusResponse

@property (strong, nonatomic) NSMutableArray *games;

/**
 *  init
 *
 *  Default initializer for PublicGamesResponse class.
 *
 *  @return  Reference to this instance of PublicGamesResponse.
 */
-(id)init;

/**
 *  initWithDictionary
 *
 *  Initialize a PublicGamesResponse objct with a NSDictionary.
 *
 *  @param  jsonDictionary  Dictionary object corresponding to the response to be parsed.
 *
 *  @return Reference to this instance of PublicGamesResponse
 */
-(id)initWithDictionary:(NSDictionary *)jsonDictionary;

@end
