//
//  FitsbyCreditCardViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 3/15/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Game;

@interface FitsbyCreditCardViewController : UIViewController

@property int wager;
@property int duration;
@property int goal;
@property BOOL isPrivate;
@property (strong, nonatomic) Game *game;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UITextField *monthField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *cvcField;
@property (weak, nonatomic) IBOutlet UILabel *wagerAmountLabel;

/**
 *
 *  doneClicked
 *
 *  A callback for when the done button is clicked. Lightly validates credit card and then calls join or create game.
 *
 *  @param  sender  The id of what is responsible for this callback being called.
 *
 *  @return  Nothing
 */ 
- (IBAction)doneClicked:(id)sender;

/**
 *
 *  cancelClicked
 *
 *  A callback for the cancel button being clicked. Unwinds segue to appropriate view controller.
 *
 *  @param  sender  The id of what is responsible for this callback being called.
 *
 *  @return Nothing
 */
- (IBAction)cancelClicked:(id)sender;

/**
 *
 *  setNewWager
 *
 *  This method is called when a nonzero wager game attempted to be created. Sets the to send to process the credit card.
 *
 *  @param  newWager  Wager of the game which is attempted to be created.
 *  @param  duration  Duration of the game which is attempted to be created.
 *  @param  goal  Goal of the game which is attempted to be created.
 *  @param  isPrivate  True if the game that is attempted to be created is private, false otherwise.
 *
 *  @return  Nothing
 */
- (void)setNewWager:(int)newWager duration:(int)duration goal:(int)goal isPrivate:(BOOL)isPrivate;

/**
 *
 *  setNewGame
 *
 *  This method is called when a nonzero wager game is attempted to be joined. Sets the game which is attempted to be joined.
 *
 *  @param  newGame  The game which is attempted to be joined.
 *
 *  @return  Nothing
 */
- (void)setNewGame:(Game *)newGame;
@end
