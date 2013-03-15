//
//  GameCommunication.h
//  Fitsby
//
//  Created by Brent Hronk on 3/2/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PublicGamesResponse;
@class CreateGameResponse;

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

/**
 *  createGame
 *
 *  Creates a game for a given user.
 *
 *  @param  creatorID  ID of the user who is attempting to create this game.
 *  @param  duration  The desired duration of the game to be created.
 *  @param  isPrivate  Yes if the game should be private, no if public.
 *  @param  wager  The desired wager per person of the game to be created.
 *  @param  goal  The desired number of days that players must go to the gym.
 *  @param  cardNumber  The users credit card number, only used if wager > 0.
 *  @param  expYear  The expiration year of the users credit card, only used if wager > 0.
 *  @param  expMonth  The expiration month of the users credit card, only used if wager > 0.
 *  @param  cvc  The cvc of the users credit card, only used if wager > 0.
 *
 *  @return  A CreateGameResponse corresponding to the creation of the game.
 */
+ (CreateGameResponse *)createGame:(int)creatorID duration:(int)duration isPrivate:(BOOL)isPrivate wager:(int)wager goal:(int)      goal cardNumber:(NSString *)cardNumber expYear:(NSString *)expYear expMonth:(NSString *)expMonth cvc:(NSString *)cvc;

@end
