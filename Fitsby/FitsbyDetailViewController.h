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

- (IBAction)joinButtonPressed:(id)sender;
- (IBAction)cancelJoinGame:(UIStoryboardSegue *)segue;
@end
