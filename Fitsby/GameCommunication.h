//
//  GameCommunication.h
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PublicGamesResponse;

@interface GameCommunication : NSObject

/**
 *  getPublicGames
 *
 *  Gets all of the public games that the user is not in.
 *
 *  @param  userID  The id corresponding to the user who is requesting the games.
 *
 *  @return  A PublicGamesResponse wrapper corresponding to the games;
 */
+ (PublicGamesResponse *) getPublicGames:(int) userID;

@end
