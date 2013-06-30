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
@class StatusResponse;
@class PrivateGameResponse;

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
+ (PublicGamesResponse *)getPublicGames:(int) userID;

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

/**
 *  joinGame
 *
 *  Joins a game for a given user.
 *
 *  @param  userID  The id of the user who is attempting to join the game.
 *  @param  gameID  The id of the game that is attempted to be joinged.
 *  @param  cardNumber  The users credit card number, only used if wager > 0.
 *  @param  expYear  The expiration year of the users credit card, only used if wager > 0.
 *  @param  expMonth  The expiration month of the users credit card, only used if wager > 0.
 *  @param  cvc  The cvc of the users credit card, only used if wager > 0.
 *
 *  @return  A StatusResponse corresponding to success of failure of joining the game.
 */
+ (StatusResponse *)joinGame:(int)userID gameID:(int)gameID cardNumber:(NSString *)cardNumber expYear:(NSString *)expYear expMonth:(NSString *)expMonth cvc:(NSString *)cvc;

/**
 *  getPrivateGame
 *
 *  Attempts to get the private game with given credentials.
 *
 *  @param  gameID  The id of the game which is being searched for.
 *  @param  creatorName  The first name of the person who created the game.
 *  @param  creatorID  The id of the user who is searching for this game.
 *
 *  @return  A PrivateGameResponse corresponding to the finding or not finding of the game.
 */
+ (PrivateGameResponse *)getPrivateGame:(NSString *)gameID creatorName:(NSString *)creatorName userID:(int)userID;

/**
 *  getGameComments
 *
 *  Returns the comments for a particular game which is passed as an arugument
 *
 *  @param  gameID  The id of the game which is being searched for.
 *
 *  @return  A NSDictionary with a status and then an array of array of comments with all the details
 */
+ (NSDictionary*)getGameComments:(NSString *)gameID;

/**
 *  getUserGames
 *
 *  Returns the games the user is in
 *
 *  @param  gameID  The id of the game which is being searched for.
 *
 *  @return  A NSDictionary with a status and then an array of array of comments with all the details
 */
+ (NSDictionary*)getUserGames:(NSString *)userID;

+(void)populateUserGames;

@end
