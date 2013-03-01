//
//  UserResponse.h
//  Fitsby
//
//  Created by Brent Hronk on 3/1/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import "StatusResponse.h"
@class User;

@interface UserResponse : StatusResponse

@property (weak, nonatomic) User *user;

/**
 *  init
 *
 *  Default initializer for UserResponse class.
 *
 *  @return  Reference to this instance of a UserResponse.
 */
-(id) init;

/**
 *  initWithData
 *
 *  Initialize a UserResponse objct with a NSDictionary.
 *
 *  @param  jsonDictionary  Dictionary object corresponding to the response to be parsed.
 *
 *  @return  Referenece to this instance of a UserResponse.
 */
-(id) initWithData:(NSDictionary *)jsonDictionary;

@end
