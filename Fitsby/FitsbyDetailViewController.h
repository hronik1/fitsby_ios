//
//  FitsbyDetailViewController.h
//  Fitsby
//
//  Created by Brent Hronk on 2/19/13.
//  Copyright (c) 2013 Fitsby. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Game;

@interface FitsbyDetailViewController : UIViewController


@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) IBOutlet UIImageView *profileIV;

/**
 *
 *  joinButtonPressed
 *
 *  Callback for pressing joined. Attempts to either let user join or send to credit card page.
 *
 *  @param  sender  The id of what is responsible for this callback being callled.
 *
 *  @return  Nothing
 */
- (IBAction)joinButtonPressed:(id)sender;

/**
 *
 *  cancelJoinGame
 *
 *  Attempts to unwind segue from the credit card page.
 *
 *  @param  segue  The segue which is attempting to be unwound.
 *
 *  @return  Nothing
 */
- (IBAction)cancelJoinGame:(UIStoryboardSegue *)segue;
@end
