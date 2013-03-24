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
@property (strong, nonatomic) Game *game;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UITextField *monthField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *cvcField;
@property (weak, nonatomic) IBOutlet UILabel *wagerAmountLabel;

/**
 *
 *  setNewWager
 *
 *  This method is called when a nonzero wager game attempted to be created. Sets the to send to process the credit card.
 *
 *  @param  newWager  Wager of the game which is attempted to be created.
 *
 *  @return  Nothing
 */
- (void)setNewWager:(int)newWager;

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
