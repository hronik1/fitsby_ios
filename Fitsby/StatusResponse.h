//
//  StatusResponse.h
//  Fitsby
//
//  Created by Brent Hronk on 2/28/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusResponse : NSObject

@property (nonatomic, assign, getter=isSuccessful) BOOL successful;
@property (weak, nonatomic) NSString *error;

/**
 *  init
 *
 *  Default initializer for StatusResponse class.
 *
 *  @return  Reference to this instance of a StatusResponse.
 */
-(id) init;

/**
 *  initWithData
 *
 *  Initialize a StatusResponse objct with a NSDictionary.
 *
 *  @param  jsonDictionary  Dictionary object corresponding to the response to be parsed.
 *
 *  @return Reference to this instance of StatusResponse
 */
-(id) initWithData:(NSDictionary *)jsonDictionary;

@end
