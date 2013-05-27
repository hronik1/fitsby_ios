//
//  CreateGameResponse.h
//  Fitsby
//
//  Created by Brent Hronk on 3/13/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "StatusResponse.h"

@interface CreateGameResponse : StatusResponse

@property int gameID;

/**
 *  init
 *
 *  Default initializer for CreateGameResponse class.
 *
 *  @return  Reference to this instance of a CreateGameResponse.
 */
- (id)init;

/**
 *  initWithDictionar
 *
 *  Initialize a CreateGameResponse objct with a NSDictionary.
 *
 *  @param  jsonDictionary  Dictionary object corresponding to the response to be parsed.
 *
 *  @return  Reference to this instance of CreateGameResponse
 */
- (id)initWithDictionary:(NSDictionary *)jsonDictionary;

@end
