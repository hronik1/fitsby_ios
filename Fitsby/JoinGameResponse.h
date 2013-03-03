//
//  JoinGameResponse.h
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "StatusResponse.h"

@interface JoinGameResponse : StatusResponse


/**
 *  init
 *
 *  Default initializer for JoinGameResponse class.
 *
 *  @return  Reference to this instance of a JoinGameResponse.
 */
-(id)init;

/**
 *  initWithDictionar
 *
 *  Initialize a JoinGameResponse objct with a NSDictionary.
 *
 *  @param  jsonDictionary  Dictionary object corresponding to the response to be parsed.
 *
 *  @return Reference to this instance of JoinGameResponse
 */
-(id)initWithDictionary:(NSDictionary *)jsonDictionary;
@end
